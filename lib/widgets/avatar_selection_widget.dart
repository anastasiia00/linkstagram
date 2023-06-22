// ignore_for_file: public_member_api_docs, sort_constructors_first, library_private_types_in_public_api
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AvatarSelectionWidget extends StatefulWidget {
  final Function(String)? onFileChanged;
  const AvatarSelectionWidget({
    Key? key,
    this.onFileChanged,
  }) : super(key: key);
  @override
  _AvatarSelectionWidgetState createState() => _AvatarSelectionWidgetState();
}

class _AvatarSelectionWidgetState extends State<AvatarSelectionWidget> {
  File? selectedImage;

  Future getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
        if (widget.onFileChanged != null) {
          widget.onFileChanged!(pickedImage.path);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffE5E5E5),
      child: Column(
        children: [
          const Text(
            'Choose your avatar',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Select the source photos'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          getImage(ImageSource.gallery);
                        },
                        child: const Text('Photos'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          getImage(ImageSource.camera);
                        },
                        child: const Text('Camera'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
                image: selectedImage != null
                    ? DecorationImage(
                        image: FileImage(selectedImage!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: selectedImage == null
                  ? const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 60,
                    )
                  : null,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
