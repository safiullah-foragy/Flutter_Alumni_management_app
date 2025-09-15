import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enhanced Registration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _jobController = TextEditingController();
  final _sessionController = TextEditingController();
  final _dobController = TextEditingController();
  final _skill1Controller = TextEditingController();
  final _skill2Controller = TextEditingController();
  final _skill3Controller = TextEditingController();
  final _skill4Controller = TextEditingController();
  final _hometownController = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    // Fade animation for form elements
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.3, 1, curve: Curves.easeOut),
      ),
    );

    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _jobController.dispose();
    _sessionController.dispose();
    _dobController.dispose();
    _skill1Controller.dispose();
    _skill2Controller.dispose();
    _skill3Controller.dispose();
    _skill4Controller.dispose();
    _hometownController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF5B67CA),
              onPrimary: Colors.white,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    
    if (picked != null) {
      setState(() {
        _dobController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed with registration
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Registration Successful!'),
          backgroundColor: Colors.green.shade700,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
      
      // Simulate a successful registration process
      _animationController.reverse().then((_) {
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.grey[100], // Light grey background
          appBar: AppBar(
            title: const Text('Register', style: TextStyle(color: Colors.white)),
            backgroundColor: const Color(0xFF5B67CA),
            elevation: 0,
            centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Transform.translate(
                    offset: Offset(0, 30 * (1 - _fadeAnimation.value)),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9, // 90% of screen width
                          constraints: const BoxConstraints(maxWidth: 500), // Max width for larger screens
                          padding: const EdgeInsets.all(24.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Create Account',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF5B67CA),
                                ),
                              ),
                              const SizedBox(height: 20),
                              _buildTextField(
                                controller: _nameController,
                                labelText: 'Name',
                                icon: Icons.person,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 12),
                              _buildTextField(
                                controller: _emailController,
                                labelText: 'Email',
                                icon: Icons.email,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                      .hasMatch(value)) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 12),
                              _buildTextField(
                                controller: _passwordController,
                                labelText: 'Password',
                                icon: Icons.lock,
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a password';
                                  }
                                  if (value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 12),
                              _buildTextField(
                                controller: _jobController,
                                labelText: 'Current Job',
                                icon: Icons.work,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your current job';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 12),
                              _buildTextField(
                                controller: _sessionController,
                                labelText: 'Session',
                                icon: Icons.calendar_today,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your session';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 12),
                              // Date of Birth field with calendar picker
                              TextFormField(
                                controller: _dobController,
                                decoration: InputDecoration(
                                  labelText: 'Date of Birth',
                                  labelStyle: const TextStyle(color: Colors.black54),
                                  prefixIcon: Icon(Icons.cake, color: const Color(0xFF5B67CA)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: Color(0xFF5B67CA), width: 2),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.calendar_month, color: Color(0xFF5B67CA)),
                                    onPressed: () => _selectDate(context),
                                  ),
                                ),
                                readOnly: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select your date of birth';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 12),
                              _buildTextField(
                                controller: _skill1Controller,
                                labelText: 'Skill 1',
                                icon: Icons.star,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter at least one skill';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 12),
                              _buildTextField(
                                controller: _skill2Controller,
                                labelText: 'Skill 2',
                                icon: Icons.star,
                              ),
                              const SizedBox(height: 12),
                              _buildTextField(
                                controller: _skill3Controller,
                                labelText: 'Skill 3',
                                icon: Icons.star,
                              ),
                              const SizedBox(height: 12),
                              _buildTextField(
                                controller: _skill4Controller,
                                labelText: 'Skill 4',
                                icon: Icons.star,
                              ),
                              const SizedBox(height: 12),
                              _buildTextField(
                                controller: _hometownController,
                                labelText: 'Hometown',
                                icon: Icons.location_city,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your hometown';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: _submitForm,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF5B67CA),
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    elevation: 3,
                                  ),
                                  child: const Text(
                                    'Register',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    bool obscureText = false,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black54),
        prefixIcon: Icon(icon, color: const Color(0xFF5B67CA)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF5B67CA), width: 2),
        ),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}