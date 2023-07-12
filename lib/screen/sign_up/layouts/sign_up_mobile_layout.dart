import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:linkstagram/screen/sign_up/cubit/sign_up_cubit.dart';
import 'package:linkstagram/utils/validator.dart';
import 'package:linkstagram/widgets/app_input.dart';
import 'package:linkstagram/widgets/app_text_button.dart';
import 'package:linkstagram/widgets/avatar_selection_widget.dart';

class SignUpMobileLayout extends StatefulWidget {
  const SignUpMobileLayout({super.key});

  @override
  State<SignUpMobileLayout> createState() => _SignUpMobileLayoutState();
}

class _SignUpMobileLayoutState extends State<SignUpMobileLayout> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

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
          if (state is SignUpStateProcessing) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Scaffold(
            backgroundColor: const Color(0xffE5E5E5),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
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
                        textEditingController: _emailController,
                        hintText: 'E-mail',
                        validator: emailValueData,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      AppInput(
                        validator: passwordValueData,
                        textEditingController: _passwordController,
                        hintText: 'Password',
                        isPass: true,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      AppInput(
                        validator: nameValueData,
                        textEditingController: _nameController,
                        hintText: 'Name',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      AppInput(
                        validator: usernameValueData,
                        textEditingController: _usernameController,
                        hintText: 'Username',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      AppTextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<SignUpCubit>(context).signUp(
                              context: context,
                              email: _emailController.text,
                              password: _passwordController.text,
                              name: _nameController.text,
                              username: _usernameController.text,
                            );
                          }
                        },
                        title: 'Sign Up',
                        buttonColor: Colors.blue,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      AppTextButton(
                        onPressed: () {
                          context.router.pop();
                        },
                        title: 'Sign In',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
