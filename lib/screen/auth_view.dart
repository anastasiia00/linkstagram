import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:linkstagram/widgets/app_text_button.dart';
import 'package:linkstagram/widgets/app_input.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
              AppTextButton(
                onPressed: () {},
                title: 'Login',
                buttonColor: Colors.blue,
              ),
              const SizedBox(
                height: 16,
              ),
              AppTextButton(
                onPressed: () {},
                title: 'Sign Up',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
