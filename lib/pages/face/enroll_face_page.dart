import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class FaceEnrollmentPage extends StatefulWidget {
  const FaceEnrollmentPage({super.key});

  @override
  State<FaceEnrollmentPage> createState() => _FaceEnrollmentPageState();
}

class _FaceEnrollmentPageState extends State<FaceEnrollmentPage> {
  CameraController? _controller;
  List<CameraDescription>? cameras;
  bool isCameraReady = false;
  XFile? capturedImage;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    cameras = await availableCameras();
    if (cameras!.isNotEmpty) {
      _controller = CameraController(cameras!.first, ResolutionPreset.medium);
      await _controller!.initialize();
      setState(() {
        isCameraReady = true;
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Enregistrer mon visage")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Caméra ou image preview
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade300,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: capturedImage == null
                      ? (isCameraReady
                      ? CameraPreview(_controller!)
                      : const Center(child: CircularProgressIndicator()))
                      : Image.file(
                    File(capturedImage!.path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Bouton Capturer
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    if (_controller != null && _controller!.value.isInitialized) {
                      capturedImage = await _controller!.takePicture();
                      setState(() {});
                    }
                  },
                  icon: const Icon(Icons.camera_alt),
                  label: const Text("Capturer"),
                ),

                // Bouton Enregistrer
                ElevatedButton.icon(
                  onPressed: capturedImage == null
                      ? null
                      : () {
                    // Ici on enregistrera l'image et vecteur facial plus tard
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Visage enregistré ! (Simulation)"),
                      ),
                    );
                  },
                  icon: const Icon(Icons.save),
                  label: const Text("Enregistrer"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
