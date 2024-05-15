import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final numController = TextEditingController();
  String errorMessage = "";
  String countdownValue = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 200, left: 40, right: 40),
          child: Column(
            children: [
              TextField(
                controller: numController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: "Input number",
                  errorText: errorMessage.isEmpty ? null : errorMessage,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  String box = numController.text.trim();
                  int box_n = int.tryParse(box) ?? 0; // Ensure valid integer
                  setState(() {
                    countdownValue = '';
                  });
                  for (var i = box_n; 0 <= i; i--) {
                    await Future.delayed(Duration(seconds: 1), () {
                      setState(() {
                        countdownValue = i.toString();
                      });
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text("Start"),
              ),
              SizedBox(height: 20),
              Text(
                countdownValue,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
