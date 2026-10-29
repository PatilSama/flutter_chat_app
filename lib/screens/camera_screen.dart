import 'package:camera/camera.dart';
import 'package:chatapp/screens/camera_view.dart';
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
                return CameraPreview(_cameraController);
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
                        onPressed: () {},
                        icon: Icon(
                          Icons.flash_off,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          takePhoto(context);
                        },
                        icon: Icon(
                          Icons.panorama_fish_eye,
                          color: Colors.white,
                          size: 70,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.flip_camera_ios,
                          color: Colors.white,
                          size: 28,
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

      final path = join(
        (await getTemporaryDirectory()).path,
        '${DateTime.now().millisecondsSinceEpoch}.png',
      );

      await image.saveTo(path);
      Navigator.push(context, MaterialPageRoute(builder: (_)=>CameraView()));

      print('Photo saved at: $path');
    } catch (e) {
      print('Error taking photo: $e');
    }
  }
}
