import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:linkstagram/widgets/app_text_button.dart';
import 'package:linkstagram/widgets/app_input.dart';

class SignUpView extends StatefulWidget {
  SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                child: InkWell(
                  onTap: () {},
                  child: Container(),
                ),
              ),
              AppInput(
                textEditingController: _emailController,
                hintText: 'E-mail',
              ),
              const SizedBox(
                height: 16,
              ),
              AppInput(
                textEditingController: _passwordController,
                hintText: 'Password',
                isPass: true,
              ),
              const SizedBox(
                height: 16,
              ),
              AppInput(
                textEditingController: _nameController,
                hintText: 'Name',
              ),
              const SizedBox(
                height: 16,
              ),
              AppInput(
                textEditingController: _usernameController,
                hintText: 'Username',
              ),
              const SizedBox(
                height: 16,
              ),
              AppTextButton(
                onPressed: () {},
                title: 'Sign Up',
                buttonColor: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
