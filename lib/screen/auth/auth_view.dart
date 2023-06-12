import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkstagram/widgets/app_text_button.dart';
import 'package:linkstagram/widgets/app_input.dart';

import 'cubit/auth_cubit.dart';

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
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          print(state);
          return Scaffold(
            backgroundColor: Color(0xffE5E5E5),
            body: Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        bottom: 40,
                      ),
                      child: Text(
                        'Linkstagram',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
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
        },
      ),
    );
  }
}
