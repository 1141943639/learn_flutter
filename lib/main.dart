import 'package:flutter/material.dart';
import 'package:learn_flutter/routes/Detail/index.dart';
import 'package:learn_flutter/routes/Edit/index.dart';
import 'package:learn_flutter/routes/Home/index.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MaterialPageRoute;
    return MaterialApp(
      initialRoute: '/',
      home: const Home(),
      routes: {
        'detail': (context) => const DetailPage(),
        'edit': (context) => const Edit()
      },
    );
  }
}
