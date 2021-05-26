import 'package:flutter/material.dart';
import 'package:ola_mundo/app_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [CustomSwitch()],
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            // scrollDirection: Axis.horizontal,
            children: [
              Text("Contador: $counter"),
              Container(height: 10),
              CustomSwitch(),
              Text("Contador: $counter"),
              Container(height: 10),
              CustomSwitch(),
              Text("Contador: $counter"),
              Container(height: 10),
              CustomSwitch(),
              Text("Contador: $counter"),
              Container(height: 10),
              CustomSwitch(),
              Text("Contador: $counter"),
              Container(height: 10),
              CustomSwitch(),
              Text("Contador: $counter"),
              Container(height: 10),
              CustomSwitch(),
              Text("Contador: $counter"),
              Container(height: 10),
              CustomSwitch(),
              Text("Contador: $counter"),
              Container(height: 10),
              CustomSwitch(),
              Text("Contador: $counter"),
              Container(height: 10),
              CustomSwitch(),
              Container(height: 50),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(width: 50, height: 50, color: Colors.black),
                    Container(width: 50, height: 50, color: Colors.black),
                    Container(width: 50, height: 50, color: Colors.black),
                  ])
            ],
          )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            counter++;
          });
        },
      ),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDartTheme,
      onChanged: (value) {
        AppController.instance.changeTheme();
      },
    );
  }
}
