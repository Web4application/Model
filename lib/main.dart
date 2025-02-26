import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Text Analyzer")),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              analyzeText("This pizza is great!");
            },
            child: Text("Analyze Text"),
          ),
        ),
      ),
    );
  }
}

Future<void> analyzeText(String text) async {
  final response = await http.post(
    Uri.parse('http://localhost:5000/analyze'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'text': text}),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> result = jsonDecode(response.body);
    print(result);  // Handle the result as needed
  } else {
    print('Failed to analyze text');
  }
}
