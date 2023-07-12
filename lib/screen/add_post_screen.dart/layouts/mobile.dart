// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:linkstagram/blocs/cubit/app_cubit.dart';
import 'package:linkstagram/models/user_model.dart';
import 'package:linkstagram/widgets/app_input.dart';
import 'package:linkstagram/widgets/app_text_button.dart';

class AddPostMobileLayout extends StatefulWidget {
  const AddPostMobileLayout({
    Key? key,
    this.onFileChanged,
  }) : super(key: key);
  final Function(String)? onFileChanged;
  @override
  State<AddPostMobileLayout> createState() => _AddPostMobileLayoutState();
}

class _AddPostMobileLayoutState extends State<AddPostMobileLayout> {
  File? selectedImage;
  final TextEditingController _descriptionController = TextEditingController();

  void postImage(
    String name,
    String username,
    String? postPicture,
  ) async {
    try {} catch (e) {}
  }

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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      body: ListView(
        children: [
          SizedBox(
            height: 32,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: GestureDetector(
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
                  child: FractionallySizedBox(
                    widthFactor: 0.9,
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xffC9CAD1),
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
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 32,
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppInput(
                      textEditingController: _descriptionController,
                      maxLines: 3,
                      title: 'Description',
                      hintText: 'Description ...',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(
          bottom: 32,
          left: 16,
          right: 16,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: AppTextButton(
                onPressed: () {
                  context.router.pop();
                },
                title: 'Cancel',
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            BlocBuilder<AppCubit, AppState>(
              builder: (context, state) {
                final User user = (state as AppLogedIn).user;
                return Expanded(
                  flex: 1,
                  child: AppTextButton(
                    onPressed: () => postImage(
                      user.uid,
                      user.username,
                      user.avatar,
                    ),
                    title: 'Post',
                    buttonColor: Color(0xff0087FF),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
