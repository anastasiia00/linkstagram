import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkstagram/screen/home/home_view.dart';
import 'package:linkstagram/screen/sign_up/sign_up_view.dart';
import 'package:linkstagram/widgets/app_text_button.dart';
import 'package:linkstagram/widgets/app_input.dart';

import 'cubit/auth_cubit.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          print(state);
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
                            onChange: (value) {
                              print('AppInput Auth email');
                              BlocProvider.of<AuthCubit>(context)
                                  .emailUpdate(value);
                            },
                            hintText: 'E-mail',
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          AppInput(
                            onChange: (value) {
                              print('AppInput Auth password');
                              BlocProvider.of<AuthCubit>(context)
                                  .passwordUpdate(value);
                            },
                            hintText: 'Password',
                            isPass: true,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          AppTextButton(
                            onPressed: () {
                              BlocProvider.of<AuthCubit>(context)
                                  .logIn(context);
                            },
                            title: 'Login',
                            buttonColor: Colors.blue,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          AppTextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpView(),
                                ),
                              );
                            },
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
