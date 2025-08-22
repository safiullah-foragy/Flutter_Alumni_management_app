import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const CloudinaryApp());
}

class CloudinaryApp extends StatelessWidget {
  const CloudinaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cloudinary Gallery",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const GalleryScreen(),
    );
  }
}

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final ImagePicker _picker = ImagePicker();
  final cloudinary = CloudinaryPublic("dn9sgguee", "sofiullah", cache: false);
  final List<Map<String, String>> _mediaList = []; // {url, type}

  Future<void> _uploadMedia(ImageSource source, bool isVideo) async {
    final pickedFile = await (isVideo
        ? _picker.pickVideo(source: source)
        : _picker.pickImage(source: source));

    if (pickedFile == null) return;

    File file = File(pickedFile.path);

    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(
          file.path,
          resourceType: isVideo ? CloudinaryResourceType.Video : CloudinaryResourceType.Image,
        ),
      );

      setState(() {
        _mediaList.add({"url": response.secureUrl, "type": isVideo ? "video" : "image"});
      });
    } catch (e) {
      debugPrint("Upload failed: $e");
    }
  }

  Widget _buildMediaItem(Map<String, String> media) {
    if (media["type"] == "image") {
      return Image.network(media["url"]!, fit: BoxFit.cover);
    } else {
      return VideoPlayerWidget(url: media["url"]!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cloudinary Gallery")),
      body: _mediaList.isEmpty
          ? const Center(child: Text("No media uploaded yet"))
          : GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1, crossAxisSpacing: 8, mainAxisSpacing: 8),
              itemCount: _mediaList.length,
              itemBuilder: (context, index) => _buildMediaItem(_mediaList[index]),
            ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: () => _uploadMedia(ImageSource.gallery, false),
            icon: const Icon(Icons.image),
            label: const Text("Upload Image"),
          ),
          const SizedBox(height: 10),
          FloatingActionButton.extended(
            onPressed: () => _uploadMedia(ImageSource.gallery, true),
            icon: const Icon(Icons.video_call),
            label: const Text("Upload Video"),
          ),
        ],
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String url;
  const VideoPlayerWidget({super.key, required this.url});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(aspectRatio: _controller.value.aspectRatio, child: VideoPlayer(_controller))
        : const Center(child: CircularProgressIndicator());
  }
}
