import 'package:flutter/material.dart';
import 'calculator.dart';

class Factorial extends StatefulWidget {
  final Function update;
  const Factorial(this.update, {Key? key}) : super(key: key);
  
  @override
  _FactorialState createState() => _FactorialState();
}

class _FactorialState extends State<Factorial> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      TextField(
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.w500, color: Colors.blue),
          controller: myController),
      TextButton(
          style: buttonStyle,
          onPressed: () {
              widget.update(factorial(int.parse(myController.text)));
              myController.clear();
          }, 
          child: const Text("FACTORIAL"))
    ]);
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
}

var buttonStyle = TextButton.styleFrom(primary: Colors.white, backgroundColor: Colors.greenAccent);
