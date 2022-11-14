// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:minirater/view/view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp =
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minirater',
      theme: CustomTheme.defaultTheme,
      home: FutureBuilder(
          future: _fbApp,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('You have an error! ${snapshot.error.toString()}');
              return const Text('Something went wrong!');
            } else if (snapshot.hasData) {
              print('successful initalization: ${snapshot.data.toString()}');
              return const HomePage();
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        'home': (context) => const HomePage(),
        'creator_profile': (context) => const CreatorProfilePage(),
        'create_creator': (context) => CreatorCreatorPage()
      },
    );
  }
}
