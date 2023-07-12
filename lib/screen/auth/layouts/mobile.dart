import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkstagram/blocs/cubit/app_cubit.dart';
import 'package:linkstagram/screen/auth/cubit/auth_cubit.dart';
import 'package:linkstagram/utils/validator.dart';
import 'package:linkstagram/widgets/app_input.dart';
import 'package:linkstagram/widgets/app_text_button.dart';

class AuthMobileLayout extends StatefulWidget {
  const AuthMobileLayout({super.key});

  @override
  State<AuthMobileLayout> createState() => _AuthMobileLayoutState();
}

class _AuthMobileLayoutState extends State<AuthMobileLayout> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
        appCubit: BlocProvider.of<AppCubit>(context),
      ),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthStateProcessing) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Form(
            key: _formKey,
            child: Scaffold(
              backgroundColor: const Color(0xffE5E5E5),
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
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
                        validator: emailValueData,
                        hintText: 'E-mail',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      AppInput(
                        textEditingController: _passwordController,
                        validator: passwordValueData,
                        hintText: 'Password',
                        isPass: true,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      AppTextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<AuthCubit>(context).logIn(
                                context: context,
                                email: _emailController.text,
                                password: _passwordController.text);
                          }
                        },
                        title: 'Login',
                        buttonColor: Colors.blue,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      AppTextButton(
                        onPressed: () {
                          context.router.pushNamed('/signUP');
                        },
                        title: 'Sign Up',
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
