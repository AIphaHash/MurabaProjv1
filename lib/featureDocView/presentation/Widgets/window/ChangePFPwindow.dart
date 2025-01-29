import 'dart:io';
import 'dart:typed_data'; // Import for Uint8List
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_application_5/featureDocView/presentation/Widgets/Buttons/confirmPFP.dart';

class UserImagePopup extends StatefulWidget {
  const UserImagePopup({Key? key}) : super(key: key);

  @override
  _UserImagePopupState createState() => _UserImagePopupState();
}

class _UserImagePopupState extends State<UserImagePopup> {
  static Uint8List? selectedImageBytes; // Store binary data
  static String? selectedImageName; // Store image name

  XFile? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      final File imageFile = File(pickedImage.path);
      final Uint8List imageBytes =
          await imageFile.readAsBytes(); // Read as bytes

      setState(() {
        _image = pickedImage;
        selectedImageName = pickedImage.name; // Save file name
        selectedImageBytes = imageBytes; // Save binary data
      });

      print("Selected Image Name: $selectedImageName");
      print("Binary Data Length: ${selectedImageBytes}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 252, 250, 250),
      content: SizedBox(
        width: 260,
        height: 450,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(top: 20, right: 110, child: Text("الرجاء")),
            Center(
              child: GestureDetector(
                onTap: _pickImage,
                child: _image == null
                    ? Image.asset(
                        'assets/images/pfpChange.png',
                        width: 210,
                        height: 300,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        File(_image!.path),
                        width: 210,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Positioned(
              top: -10,
              right: -10,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Icon(Icons.close, color: Colors.white, size: 24),
                ),
              ),
            ),
            SizedBox(height: 10),
            ConfirmButton()
          ],
        ),
      ),
    );
  }
}
