import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = '';
  double squareside = 100;
  @override
  Widget build(BuildContext context) {
    List items = List.generate(20, (i) => i);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: (){},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: AnimatedContainer(
                width: squareside,
                height: squareside,
                color: Colors.orange,
                duration: const Duration(seconds: 1),
              ),
              onTap: () {
                setState(() {
                  if (text == '') {
                    text = 'This is an orange square.';
                  } else {
                    text = '';
                  }
                });
              },
              onLongPress: () {
                setState(() {
                  if (squareside > 75) {
                    squareside = 50;
                    text = 'This is small orange square.';
                  } else {
                    squareside = 100;
                    text = 'This is normal orange square.';
                  }
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Text(text, style: const TextStyle(
              fontSize: 20,
            ),),
          ],
        ),
      ),
    );
  }
}