import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';


class FaceScanPage extends StatefulWidget {
  const FaceScanPage({super.key});

  @override
  State<FaceScanPage> createState() => _FaceScanPageState();
}

class _FaceScanPageState extends State<FaceScanPage> {
  CameraController? _controller;
  List<CameraDescription>? cameras;
  bool isCameraReady = false;
  XFile? scannedImage;
  bool scanning = false;
  String resultText = "";

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

  Future<void> _scanFace() async {
    if (_controller == null || !_controller!.value.isInitialized) return;

    setState(() {
      scanning = true;
      resultText = "";
    });

    scannedImage = await _controller!.takePicture();

    // Simulation de la comparaison faciale
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      scanning = false;
      resultText = "Présence validée ✅"; // Placeholder
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scanner ma présence")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Affichage caméra / image scannée
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade300,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: scannedImage == null
                      ? (isCameraReady
                      ? CameraPreview(_controller!)
                      : const Center(child: CircularProgressIndicator()))
                      : Image.file(
                    File(scannedImage!.path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Bouton scanner
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: scanning ? null : _scanFace,
                icon: const Icon(Icons.fingerprint),
                label: scanning
                    ? const Text("Analyse en cours…")
                    : const Text("Scanner"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Résultat
            Text(
              resultText,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
