import 'dart:math';

import 'package:camera/camera.dart';
import 'package:chatapp/screens/camera_view.dart';
import 'package:chatapp/screens/video_view.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

List<CameraDescription?>? cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late Future<void> cameraValue;
  bool isRecording = false;
  String videoPath = "";
  bool flash = false;
  bool isCameraFront = true;
  double transform  = pi;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraController(cameras![0]!, ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: cameraValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: CameraPreview(_cameraController),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            flash = !flash;
                          });
                          flash
                              ? _cameraController.setFlashMode(FlashMode.torch)
                              : _cameraController.setFlashMode(FlashMode.off);
                        },
                        icon: Icon(
                          flash ? Icons.flash_on : Icons.flash_off,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),

                      GestureDetector(
                        onLongPress: () async {
                          try {
                            if (!_cameraController.value.isInitialized ||
                                _cameraController.value.isRecordingVideo) {
                              return;
                            }

                            await _cameraController.startVideoRecording();

                            if (!mounted) return;

                            setState(() {
                              isRecording = true;
                            });
                          } catch (e) {
                            debugPrint('Error starting video recording: $e');
                          }
                        },

                        onLongPressUp: () async {
                          try {
                            if (!_cameraController.value.isRecordingVideo) {
                              return;
                            }

                            final XFile videoFile = await _cameraController
                                .stopVideoRecording();

                            if (!mounted) return;

                            setState(() {
                              isRecording = false;
                              videoPath = videoFile.path;
                            });

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => VideoView(path: videoFile.path),
                              ),
                            );
                          } catch (e) {
                            debugPrint('Error stopping video recording: $e');

                            if (mounted) {
                              setState(() {
                                isRecording = false;
                              });
                            }
                          }
                        },

                        onTap: () {
                          if (!isRecording) {
                            takePhoto(context);
                          }
                        },

                        child: Icon(
                          isRecording
                              ? Icons.radio_button_on
                              : Icons.panorama_fish_eye,
                          color: isRecording ? Colors.red : Colors.white,
                          size: isRecording ? 80 : 70,
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          setState(() {
                            isCameraFront = !isCameraFront;
                            transform = transform+pi;
                          });
                          int cameraPos = isCameraFront ? 0 : 1;
                          _cameraController = CameraController(
                            cameras![cameraPos]!,
                            ResolutionPreset.high,
                          );
                          cameraValue = _cameraController.initialize();
                        },
                        icon: Transform.rotate(
                          angle: transform,
                          child: Icon(
                            Icons.flip_camera_ios,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Hold for Video, tap for photo",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> takePhoto(BuildContext context) async {
    try {
      final XFile image = await _cameraController.takePicture();

      if (!context.mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => CameraView(path: image.path)),
      );

      print('Photo saved at: ${image.path}');
    } catch (e) {
      print('Error taking photo: $e');
    }
  }
}
