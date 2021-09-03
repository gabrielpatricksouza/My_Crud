import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_crud/app/app_controller.dart';

class ImageSourceSheet extends StatelessWidget {
  ImageSourceSheet({required this.onImageSelected});

  final Function(File?) onImageSelected;
  final picker = ImagePicker();
  final AppController i18n = Modular.get();

  Future<void> selectedImage(BuildContext context, File? image) async {
    if (image != null) {
      final croppedImage = await ImageCropper.cropImage(
          sourcePath: image.path,
          cropStyle: CropStyle.circle,
          aspectRatioPresets: [CropAspectRatioPreset.square,],
          maxWidth: 400,
          maxHeight: 400,
          androidUiSettings: AndroidUiSettings(
            toolbarTitle: "Editar",
            toolbarColor: Colors.purpleAccent,
            toolbarWidgetColor: Colors.white,
            activeControlsWidgetColor: Colors.purpleAccent,
          ));
      onImageSelected(croppedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        backgroundColor: Colors.deepPurple,
        onClosing: () {},
        builder: ((context) => Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                /// Select image from gallery
                TextButton.icon(
                  icon: Icon(Icons.photo_library, color: Colors.white, size: 27),
                  label: Text("Galeria",
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                  onPressed: () async {
                    // ignore: deprecated_member_use
                    final pickedFile = await picker.getImage(
                      source: ImageSource.gallery,
                    );
                    if (pickedFile == null) return;
                    selectedImage(context, File(pickedFile.path));
                  },
                ),

                /// Capture image from camera
                TextButton.icon(
                  icon: Icon(Icons.camera_alt_outlined, color: Colors.white, size: 27),
                  label: Text("Câmera",
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                  onPressed: () async {
                    // ignore: deprecated_member_use
                    final pickedFile = await picker.getImage(
                      source: ImageSource.camera,
                    );
                    if (pickedFile == null) return;
                    selectedImage(context, File(pickedFile.path));
                  },
                ),
              ],
            )
        )
    );
  }
}
