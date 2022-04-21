import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String textToDisplay = " ";
  int firstnuum = 0;
  int secondnum = 0;
  String result = " ";
  String operationtoPerform = "";

  void btnclicked(String btnvalue) {
    if (btnvalue == "C") {
      textToDisplay = "";
      firstnuum = 0;
      secondnum = 0;
      result = "";
    } else if (btnvalue == "+" ||
        btnvalue == "-" ||
        btnvalue == "/" ||
        btnvalue == "x") {
      firstnuum = int.parse(textToDisplay);
      result = "";
      operationtoPerform = btnvalue;
    } else if (btnvalue == "=") {
      secondnum = int.parse(textToDisplay);
      if (operationtoPerform == '+') {
        result = (firstnuum + secondnum).toString();
      }
      if (operationtoPerform == '-') {
        result = (firstnuum - secondnum).toString();
      }
      if (operationtoPerform == '/') {
        result = (firstnuum ~/ secondnum).toString();
      }
      if (operationtoPerform == 'x') {
        result = (firstnuum * secondnum).toString();
      }
    } else {
      result = int.parse(textToDisplay + btnvalue).toString();
    }
    setState(() {
      textToDisplay = result;
    });
  }

  Widget customButton(String btnvalue) {
    return Expanded(
        child: OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(width: 1.0, color: Colors.greenAccent),
        backgroundColor: Colors.lightGreen,
      ),
      onPressed: () => btnclicked(btnvalue),
      child: Text(
        btnvalue,
        style: const TextStyle(fontSize: 20.0, color: Colors.black),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(13.0),
                child: Text(
                  textToDisplay,
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                customButton('1'),
                customButton('2'),
                customButton('3'),
                customButton('+'),
              ],
            ),
            Row(
              children: [
                customButton('4'),
                customButton('5'),
                customButton('6'),
                customButton('-'),
              ],
            ),
            Row(
              children: [
                customButton('7'),
                customButton('8'),
                customButton('9'),
                customButton('x'),
              ],
            ),
            Row(
              children: [
                customButton('C'),
                customButton('0'),
                customButton('/'),
                customButton('='),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
