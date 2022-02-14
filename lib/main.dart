import 'package:flutter/material.dart';
import 'package:lesson_network/pages/home_page.dart';

void main() {
  runApp(FlutterB14());
}

class FlutterB14 extends StatelessWidget {
  const FlutterB14({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        HomePage.id: (context) => HomePage()
      },
    );
  }
}
