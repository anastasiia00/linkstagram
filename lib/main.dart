import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:linkstagram/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:linkstagram/responsive/mobile_screen_layout.dart';
import 'package:linkstagram/responsive/responsive_layout_screen.dart';
import 'package:linkstagram/responsive/web_screen_layout.dart';
import 'package:linkstagram/screen/auth/auth_view.dart';
import 'package:linkstagram/ui_kit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.authStateChanges().listen((event) {
    print(event);
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StreamBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              const ResponsiveLayout(
                mobileScreenLayout: UiKit(),
                webScreenLayout: UiKit(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return AuthScreen();
        },
        stream: FirebaseAuth.instance.authStateChanges(),
      ),
    );
  }
}
