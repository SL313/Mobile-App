import 'package:flutter/material.dart';
import 'package:flutter_app/styles.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        fontFamily: 'Cabin',
        primaryColor: const Color(0xff1FBFBA),
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(),
    );
  }
}

// final List<String> images = <String>['dog_1.jpeg', 'dog_2.jpeg', 'dog_3.jpeg', 'dog_4.jpeg', 'dog_5.jpeg', 'dog_6.jpeg', 'dog_7.jpeg', 'dog_8.jpeg', 'dog_9.jpeg', 'dog_10.jpeg', 'dog_11.jpeg', 'dog_12.jpeg', 'dog_13.jpeg', 'dog_14.jpeg', 'dog_15.jpeg', 'dog_16.jpeg'];
// List imgList = [
//   Image.asset('dog_1.jpeg'),
//   Image.asset('dog_2.jpeg'),
//   Image.asset('dog_3.jpeg'),
//   Image.asset('dog_4.jpeg'),
// ];

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.mint,
          title: const Text('My Flutter App'),
          // leading: const Icon(Icons.add),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.add,
              ),
              onPressed: (){},
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.tag_faces), text: 'Students'),
              Tab(icon: Icon(Icons.photo), text: 'Album'),
              Tab(icon: Icon(Icons.info), text: 'Info'),
            ],
            labelColor: Colors.white,
          ),
        ),
        body: TabBarView(
            children: [
              ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 100,
                itemBuilder: (c, i){
                  return ListTile(
                    leading: const Icon(Icons.home),
                    title: Text('Student ${i+1}'),
                    trailing: const Icon(Icons.navigate_next),
                    onTap: (){},
                  );
                },
              ),
              Tab(
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: 16,
                  itemBuilder: (c, i) {
                    return SizedBox(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage('dog_${i+1}.jpeg'),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Tab(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                        width: 300,
                        height: 300,
                        child: Opacity(
                          opacity: 0.3,
                          child: Image.asset('warning.jpeg'),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('This page does not include contents.',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Please insert contents by pressing this button.',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FloatingActionButton(child: Icon(Icons.add), onPressed: (){}, )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
        ),
        drawer: const Drawer(),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
          ],
        ),
      ),
    );
  }
}
