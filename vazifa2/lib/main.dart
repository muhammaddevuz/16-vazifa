import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List box = [
    {
      'check':true,
      'text':"Swimming"
    },
    {
      'check':true,
      'text':"Eating"
    },
    {
      'check':true,
      'text':"Drawing"
    },
    {
      'check':true,
      'text':"Slipping"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 150, left: 50, right: 50),
          child: Column(
            children: [
              for (var i=0;i<box.length;i++)todo(i)
            ],
          ),
        ),
      ),
    );
  }

  Widget todo(int i) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              box[i]['check'] = !box[i]['check'];
            });
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: Colors.grey, width: 3)),
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(
                  box[i]['check'] == true ? Icons.circle_outlined : Icons.check_circle,
                  color: box[i]['check'] ? null : Colors.green,
                  size: 30,
                ),
                SizedBox(width: 20),
                Text(
                  box[i]['text'],
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      decoration: box[i]['check'] ? null : TextDecoration.lineThrough),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),

      ],
    );
  }
}
