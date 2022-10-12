import 'dart:math';
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
  // List<Widget> myTiles = [Padding(
  //   key: UniqueKey(),
  //   padding: const EdgeInsets.all(8.0),
  //   child: MyTile(),
  // ), Padding(
  //   key: UniqueKey(),
  //   padding: const EdgeInsets.all(8.0),
  //   child: MyTile(),
  // ),];
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
      body: ReorderableListView.builder(
        itemCount: items.length,
        itemBuilder: (c, i) {
          return Dismissible(
            background: Container(color: Colors.green),
            key: ValueKey(items[i]),
            child: ListTile(
              title: Text('Student ${items[i]}'),
              leading: const Icon(Icons.home),
              trailing: const Icon(Icons.navigate_next),
            ),
            onDismissed: (direction) {
              setState(() {
                items.removeAt(i);
              });
            },
          );
        },
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            items.insert(newIndex, items.removeAt(oldIndex));
          });
        },
      ),
      // Row(
      //   children: myTiles,
      // ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.swap_calls),
      //   onPressed: (){
      //     setState(() {
      //       myTiles.insert(1, myTiles.removeAt(0));
      //     });
      //   },
      // ),
    );
  }
}

// class MyTile extends StatefulWidget {
//   MyTile({Key? key}) : super(key: key);
//
//   @override
//   State<MyTile> createState() => _MyTileState();
// }
//
// class _MyTileState extends State<MyTile> {
//   final Color myColor = UniqueColorGenerator.getColor();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 100,
//       height: 100,
//       color : myColor,
//     );
//   }
// }
//
//
// class UniqueColorGenerator {
//   static Random random = Random();
//   static Color getColor() {
//     return Color.fromARGB(
//         255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
//   }
// }
