import 'package:flutter/material.dart';
import 'package:others/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Home(
      onSubmit: (String value) {},
    ));
  }
}

class Home extends StatefulWidget {
  Home({Key? key, required this.onSubmit}) : super(key: key);
  final ValueChanged<String> onSubmit;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Initial Selected Value
  String dropdownvalue = "Select Widget";

  // List of items in our dropdown menu
  var items = [
    "Select Widget",
    "Text Field",
    "Text",
    "Container",
    "Button",
    "Icon",
  ];

  final _valController = TextEditingController();

  // dispose it when the widget is unmounted
  @override
  void dispose() {
    _valController.dispose();
    super.dispose();
  }

  String? get _errorText {
    // at any time, we can get the text from _controller.value.text
    final text = _valController.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    // return null if the text is valid
    return null;
  }

  _submit() {
    // if there is no error text
    if (_errorText == null) {
      // notify the parent widget via the onSubmit callback
      widget.onSubmit(_valController.value.text);
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WidgetInput(
            selection: dropdownvalue, numOfWidgets: _valController.text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Widgets'),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: _valController,
              decoration: InputDecoration(
                labelText: "Type the number of widgets",
                errorText: _errorText,
                labelStyle: TextStyle(
                  color: Color(0xFFa3a3a3),
                  fontSize: 24,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            DropdownButton(
              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              ElevatedButton(
                child: Text(" Reset "),
                onPressed: () {
                  setState(() {
                    _valController.clear();
                    dropdownvalue = "Select Widget";
                  });
                },
              ),
              ElevatedButton(
                child: Text("Continue"),
                onPressed:
                    _valController.value.text.isNotEmpty ? _submit : null,
              )
            ]),
          ],
        ),
      ),
    );
  }
}
