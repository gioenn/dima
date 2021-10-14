import 'package:flutter/material.dart';
import 'calculator.dart';

class Power extends StatefulWidget {
  final Function update;
  const Power(this.update, {Key? key}) : super(key: key);

  @override
  _PowerState createState() => _PowerState();
}

class _PowerState extends State<Power> {
  final baseController = TextEditingController();
  final expController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                width: 100,
                child: TextField(
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue),
                  controller: baseController,
                )),
            const Text("^"),
            SizedBox(
                width: 100,
                child: TextField(
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                    controller: expController)),
          ]),
      TextButton(
          style: buttonStyle,
          onPressed: () {
            widget.update(power(
                int.parse(baseController.text), int.parse(expController.text)));
            baseController.clear();
            expController.clear();
          },
          child: const Text("POWER"))
    ]);
  }

  @override
  void dispose() {
    baseController.dispose();
    expController.dispose();
    super.dispose();
  }
}

var buttonStyle = TextButton.styleFrom(
    primary: Colors.white, backgroundColor: Colors.greenAccent);
