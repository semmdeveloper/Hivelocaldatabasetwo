import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:localdatabase2/pages/login_page.dart';
import 'package:localdatabase2/pages/sign_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {

  await Hive.initFlutter();
  await Hive.openBox('semm');



  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:LoginPage(),
      routes: {
        LoginPage.id:(context) => LoginPage(),
        SignPage.id:(context) => SignPage(),
      },
    );
  }
}

