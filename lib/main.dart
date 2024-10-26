import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // String hand = 'ぐー';


  void showRobotResult(){
    List<String> hands = ['グー','チョキ','パー'];
    Image image = Image.asset('assets/janken_choki.png');
    hands.shuffle();
    String hand =  hands.first;
    if(hand ==  "グー"){
      image = Image.asset('assets/janken_gu.png');
    }else if(hand ==  "チョキ"){
      image = Image.asset('assets/janken_choki.png');
    }else{
      image = Image.asset('assets/janken_pa.png');
    }

    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: const Text("ロボットくん"),
        content: image,
        // content: Text('「$hand」を出しました。'),
      );
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: const Text("ジャンケンゲーム"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {
          showRobotResult();
        },
          child: const Text("ジャンケン"),
        ),
      ),
    );
  }
}
