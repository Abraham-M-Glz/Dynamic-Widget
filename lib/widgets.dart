import 'package:flutter/material.dart';
import 'dart:math';

class WidgetInput extends StatefulWidget {
  final String selection;
  final String numOfWidgets;

  WidgetInput({
    Key? key,
    required this.selection,
    required this.numOfWidgets,
  }) : super(key: key);

  @override
  State<WidgetInput> createState() => _WidgetInputState();
}

class _WidgetInputState extends State<WidgetInput> {
  late int randomColor;
  //random color function
  rc() {
    return randomColor = Random().nextInt(255);
  }

  widgetSelected(selection) {
    switch (selection) {
      case "Text Field":
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: "Text Field",
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.text,
          ),
        );
      case "Text":
        return Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              "  Text Widget  ",
              style: TextStyle(
                  fontSize: 28,
                  color: Color.fromARGB(255, rc(), rc(), rc()),
                  fontStyle: FontStyle.italic,
                  letterSpacing: 8,
                  wordSpacing: 10,
                  backgroundColor: Color.fromARGB(255, rc(), rc(), rc()),
                  shadows: [
                    Shadow(
                        color: Color.fromARGB(255, 209, 226, 255),
                        offset: Offset(2, 1),
                        blurRadius: 10)
                  ]),
            ));

      case "Container":
        return Container(
          width: double.infinity,
          height: 100.0,
          margin: EdgeInsets.symmetric(vertical: 10.0),
          padding: EdgeInsets.all(8.0),
          color: Color.fromARGB(255, rc(), rc(), rc()),
          child: Text(
            "Hello! I am the container widget",
            style: TextStyle(
                fontSize: 25, color: Color.fromARGB(255, rc(), rc(), rc())),
          ),
        );

      // ignore: dead_code
      case "Button":
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: ElevatedButton(
            onPressed: () {},
            child: Text("Touch"),
            style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, rc(), rc(), rc()),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                side: BorderSide(
                  color: Color.fromARGB(255, rc(), rc(), rc()),
                ),
                textStyle:
                    TextStyle(fontSize: 27, fontWeight: FontWeight.bold)),
          ),
        );
      case "Icon":
        return Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: Icon(
              Icons.cruelty_free,
              size: 50,
              color: Color.fromARGB(255, rc(), rc(), rc()),
            ));

      default:
        return Text("invalid selection");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dynamic Widget")),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: int.parse(widget.numOfWidgets),
            itemBuilder: (BuildContext context, int index) {
              return widgetSelected(widget.selection);
            }),
      ),
    );
  }
}
