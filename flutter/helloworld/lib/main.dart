import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text("My first app")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          HelloWorld(),
          HelloWorldGenerator(10),
          HelloWorldPlus(11),
          HelloWorldPlus(12, color: Colors.blue),
        ],
      )),
    ));
  }
}

class HelloWorld extends StatelessWidget {
  const HelloWorld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Hello World!!!",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    );
  }
}

class HelloWorldPlus extends StatelessWidget {
  final int number;
  final Color color;

  const HelloWorldPlus(this.number, {this.color = Colors.red, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Hello World $number",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: color),
    );
  }
}

class HelloWorldGenerator extends StatelessWidget {
  final int count;
  const HelloWorldGenerator(this.count, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (int i = 0; i < count; i++) {
      children.add(HelloWorldPlus(i + 1,
          color:
              Color.fromRGBO(16 * i % 255, 32 * i % 255, 64 * i % 255, 1.0)));
    }
    return Column(children: children);
  }
}


