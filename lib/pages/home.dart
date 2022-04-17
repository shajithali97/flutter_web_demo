import 'package:flutter/material.dart';
import 'package:flutter_tutorial/pages/container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List sideMenu = [
    "Material App with Scaffold Properties",
    "Material App with theme primary color change",
    "Dark Theme",
    "Material App Routes",
    "Text Without Scaffold",
    "Container with text",
    "Container with padding all 20",
    "Container with padding symmetric h:10,v:20",
    "Container with padding only left 20",
    "Container with padding LTRB 20,30,10,30",
    "Container with Alignment topLeft",
    "Container with Alignment topRight",
    "Container with Alignment topCenter",
    "Container with Alignment bottomLeft",
    "Container with Alignment bottomRight",
    "Container with Alignment bottomCenter",
    "Container with Alignment centerLeft",
    "Container with Alignment centerRight",
    "Container with Alignment center",
    "Circle Container",
    "Circle Container with clip",
  ];
  List<Widget> Containers = [
    MaterialApp(
      title: "DEMO",
      home: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {}),
        appBar: AppBar(
          title: Text("FLUTTER"),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage("assets/ram.jpg")),
                  accountName: Text("Ramkrishnan P"),
                  accountEmail: Text("ramkrishnan.p.applogiq@gmail.org"))
            ],
          ),
        ),
      ),
    ),
    MaterialApp(
      title: "DEMO",
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {}),
        appBar: AppBar(
          title: Text("FLUTTER"),
        ),
        // body: Container(
        //     width: double.maxFinite,
        //     height: double.maxFinite,
        //     color: Colors.white,
        //     child: Text("HI DEVELOPERS")),
      ),
    ),
    MaterialApp(
      title: "DEMO",
      theme: ThemeData.dark(),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {}),
        appBar: AppBar(
          title: Text("FLUTTER"),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage("assets/ram.jpg")),
                  accountName: Text("Ramkrishnan P"),
                  accountEmail: Text("ramkrishnan.p.applogiq@gmail.org"))
            ],
          ),
        ),
      ),
    ),
    MaterialApp(
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home Route'),
            ),
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/about");
                },
                child: Text("Go To About Page"),
              ),
            ),
          );
        },
        '/about': (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('About Route'),
            ),
          );
        }
      },
    ),
    MaterialApp(
      home: Container(child: Text("HI DEVELOPERS")),
    ),
    MyContainer(),
    //PADDING
    MyContainer(
      padding: EdgeInsets.all(20),
    ),
    MyContainer(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    ),
    MyContainer(
      padding: EdgeInsets.only(left: 20),
    ),
    MyContainer(
      padding: EdgeInsets.fromLTRB(20, 30, 10, 30),
    ),
    //ALIGNMENT
    MyContainer(
      alignment: Alignment.topLeft,
    ),
    MyContainer(
      alignment: Alignment.topRight,
    ),
    MyContainer(
      alignment: Alignment.topCenter,
    ),
    MyContainer(
      alignment: Alignment.bottomLeft,
    ),
    MyContainer(
      alignment: Alignment.bottomRight,
    ),
    MyContainer(
      alignment: Alignment.bottomCenter,
    ),
    MyContainer(
      alignment: Alignment.centerLeft,
    ),
    MyContainer(
      alignment: Alignment.centerRight,
    ),
    MyContainer(
      alignment: Alignment.center,
    ),
    MyContainer(
      shape: BoxShape.circle,
      // alignment: Alignment.center,
    ),
    MyContainer(
      shape: BoxShape.circle,
      clip: Clip.antiAlias,
    ),
    MyContainer(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Tutorial"),
      ),
      body: Container(
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(color: Colors.black, blurRadius: 15),
                ]),
                child: ListView.builder(
                  itemCount: sideMenu.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(5),
                        color: selectedIndex == index
                            ? Colors.red
                            : Colors.grey.shade200,
                      ),
                      child: Text(
                        sideMenu[index],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.white,
                child: IndexedStack(index: selectedIndex, children: Containers),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
