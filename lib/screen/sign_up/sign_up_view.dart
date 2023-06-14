import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:linkstagram/services/auth.dart';
import 'package:linkstagram/widgets/app_text_button.dart';
import 'package:linkstagram/widgets/app_input.dart';
import 'package:linkstagram/widgets/avatar_selection_widget.dart';

import 'cubit/sign_up_cubit.dart';

class SignUpView extends StatefulWidget {
  SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool _isLoading = false;

  Future _selectImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Color(0xffE5E5E5),
            body: state.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            child: InkWell(
                              child: AvatarSelectionWidget(
                                onFileChanged: (value) {
                                  BlocProvider.of<SignUpCubit>(context)
                                      .avatarUpdate(value);
                                },
                              ),
                            ),
                          ),
                          AppInput(
                            onChange: (value) {
                              print('AppInput SignUp email');
                              BlocProvider.of<SignUpCubit>(context)
                                  .emailUpdate(value);
                            },
                            hintText: 'E-mail',
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          AppInput(
                            onChange: (value) {
                              print('AppInput SignUp password');
                              BlocProvider.of<SignUpCubit>(context)
                                  .passwordUpdate(value);
                            },
                            hintText: 'Password',
                            isPass: true,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          AppInput(
                            onChange: (value) {
                              print('AppInput SignUp name');
                              BlocProvider.of<SignUpCubit>(context)
                                  .nameUpdate(value);
                            },
                            hintText: 'Name',
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          AppInput(
                            onChange: (value) {
                              print('AppInput SignUp username');
                              BlocProvider.of<SignUpCubit>(context)
                                  .usernameUpdate(value);
                            },
                            hintText: 'Username',
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          AppTextButton(
                            onPressed: () {
                              BlocProvider.of<SignUpCubit>(context)
                                  .signUp(context);
                            },
                            title: 'Sign Up',
                            buttonColor: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
