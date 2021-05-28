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
      // Menu esquerdo
      drawer: Drawer(
          child: Column(
            children: [
              // Cabeçalho Usuário
              UserAccountsDrawerHeader(
                currentAccountPicture: ClipOval(
                  // Ou
                  // currentAccountPicture: ClipRRect(
                  // borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                    'http://core.r2ti.com.br/assets/logo-8254567cf15397e05487d0adad9f7c2ef7a7191dd533941d55fd8f4015e504b2.png'
                    )
                  ),
                accountName: Text('Alexandre Silveira'), 
                accountEmail: Text('alexandrefsdev@gmail.com')
                ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Inicio'),
          subtitle: Text('Tela de início'),
          onTap: () {
            print('home');
          },
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Sair'),
          subtitle: Text('Finalizar sessão'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        )
      ])),
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [CustomSwitch()],
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // scrollDirection: Axis.horizontal,
            children: [
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
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.menu), onPressed: () {}),
            Spacer(),
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
      ),
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
