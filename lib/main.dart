import 'package:flutter/material.dart';
import 'package:login_app/view/login_page_view.dart';
import 'package:login_app/view/welcome.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Uplaps Demo',
      initialRoute: 'login',
      routes: {
        '/login': (context) => LoginView(title: "No Title"),
        '/welcome': (context) => WelcomeView(),
      },
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: LoginView(title: 'Flutter Demo Home Page'),
    );
  }
}
