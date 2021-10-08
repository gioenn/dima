import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text("Counter")),
            body: const Counter()));
  }
}

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  CounterState createState() => CounterState();
}

class CounterState extends State<Counter> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      if (counter < 100) {
        counter++;
      }
    });
  }

  void decrementCounter() {
    setState(() {
      if (counter > 0) {
        counter--;
      }
    });
  }

  void setCounter(double newValue) {
    setState(() {
      counter = newValue.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                color: Colors.blue,
                child: Center(
                  child: Text("$counter",
                      style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                )),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.white, backgroundColor: Colors.pinkAccent),
                child: const Icon(Icons.remove),
                onPressed: counter == 0 ? null : decrementCounter,
              ),
              TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.white, backgroundColor: Colors.pinkAccent),
                child: const Icon(Icons.add),
                onPressed: counter == 100 ? null : incrementCounter,
              )
            ]),
            Slider(
                activeColor: Colors.blueAccent,
                inactiveColor: Colors.blueGrey,
                value: counter.toDouble(),
                min: 0,
                max: 100,
                divisions: 100,
                onChanged: setCounter)
          ],
        ));
  }
}
