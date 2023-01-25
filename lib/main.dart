import 'dart:math';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: kDebugMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SmartBallHome(),
    );
  }
}

class SmartBallHome extends StatefulWidget {
  const SmartBallHome({Key? key}) : super(key: key);

  @override
  State<SmartBallHome> createState() => _SmartBallHomeState();
}

class _SmartBallHomeState extends State<SmartBallHome> {
  int imageNumber = 1;
  void answers() {
    imageNumber = Random().nextInt(5) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Center(
          child: Text(
            'Ask Me Anything'.toUpperCase(),
            style: const TextStyle(fontSize: 16.0,),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
            child: TextButton(
                onPressed: () {
                  setState(() {
                    answers();
                  });
                },
                child: Image.asset('images/ball$imageNumber.png'))),
      ),
    );
  }
}
