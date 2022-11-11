import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum ProjectTeam { leader, member }

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
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _midtermController = TextEditingController();
  final _finalController = TextEditingController();
  String _obstate = '-';
  void dispose() {
    _midtermController.dispose();
    _finalController.dispose();
    super.dispose();
  }

  ProjectTeam _projectTeam = ProjectTeam.leader;

  final _valueList = List.generate(10, (i) => '$i point');
  var _selectedValue = '0 point';

  var _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grade Calculator'),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Mid-term exam',
              ),
              controller: _midtermController,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Final exam',
              ),
              controller: _finalController,
            ),
            const SizedBox(
              height: 20,
            ),
            RadioListTile(
              title: Text('Project Team Leader (+10)'),
              value: ProjectTeam.leader,
              groupValue: _projectTeam,
              onChanged: (value) {
                setState(() {
                  _projectTeam = value!;
                });
              },
            ),
            RadioListTile(
              title: Text('Project Team Member'),
              value: ProjectTeam.member,
              groupValue: _projectTeam,
              onChanged: (value) {
                setState(() {
                  _projectTeam = value!;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Additional Point',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      DropdownButton(
                        value: _selectedValue,
                        items: _valueList.map(
                          (value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value)
                            );
                          },
                        ).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedValue = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                CheckboxListTile(
                  title: Text('Absence less than 4'),
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
              ],
            ),
            Text(_obstate,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 50,
                color: Colors.red,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              child: const Text('Enter'),
              onPressed: () {
                setState(() {
                  var midterm_value = double.parse(_midtermController.text.trim());
                  var final_value = double.parse(_finalController.text.trim());
                  var point_value = double.parse(_selectedValue.trim().split(' ')[0]);
                  var result = midterm_value + final_value + point_value;
                  if (_projectTeam == ProjectTeam.leader) {
                    result += 10;
                  }
                  if (_isChecked == true){
                    _obstate = 'F';
                  } else if (result >= 170) {
                    _obstate = 'A';
                  } else if (result >= 150) {
                    _obstate = 'B';
                  } else if (result >= 130) {
                    _obstate = 'C';
                  } else if (result >= 110) {
                    _obstate = 'D';
                  } else {
                    _obstate = 'F';
                  }
                });
              },
            ),
          ],
        ),
      ),
      drawer: const Drawer(),
    );
  }
}

