import 'dart:async';
import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

const String SETTINGS_BOX = 'settings';
const String API_BOX = "api_data";
const String FAVORITES_BOX = 'favorites';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(SETTINGS_BOX);
  await Hive.openBox(API_BOX);
  await Hive.openBox(FAVORITES_BOX);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
      routes: {
        'favorites': (_) => FavoritesPage(),
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Hive.box(SETTINGS_BOX).get('welcome_show'));
    // bool caixaVazia = Hive.box(SETTINGS_BOX).get('welcome_show') == null;
    // return caixaVazia ? HomePage(title: "Olá") : WelcomePage();
    return ValueListenableBuilder<Box>(
      valueListenable: Hive.box(SETTINGS_BOX).listenable(),
      builder: (context, box, child) =>
          box.get('welcome_show', defaultValue: false)
              ? HomePage(title: "HomePage")
              : WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome Page"),
          ElevatedButton(
            onPressed: () async {
              var box = Hive.box('settings');
              box.put("welcome_show", true);
            },
            child: Text("Get Started"),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'favorites');
            },
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      body: FutureBuilder(
        future: ApiService().getPosts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator.adaptive();
          final List posts = snapshot.data as List;
          return ValueListenableBuilder<Box>(
            valueListenable: Hive.box(FAVORITES_BOX).listenable(),
            builder: (context, box, _) {
              return ListView(
                padding: EdgeInsets.all(16),
                children: [
                  Text(
                    'This is a Home page',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  ...posts.map(
                    (post) => ListTile(
                      title: Text(post['title']),
                      trailing: IconButton(
                        onPressed: () {
                          Hive.box(FAVORITES_BOX).put(post['id'], post);
                        },
                        icon: Icon(
                          Hive.box(FAVORITES_BOX).containsKey(post['id'])
                              ? Icons.favorite
                              : Icons.favorite_border,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Hive.box(FAVORITES_BOX).put('welcome_show', false);
                    },
                    child: Text("Clear"),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: ValueListenableBuilder<Box>(
        valueListenable: Hive.box(FAVORITES_BOX).listenable(),
        builder: (context, box, child) {
          List posts = List.from(box.values);
          return ListView(
            padding: EdgeInsets.all(16),
            children: [
              Text(
                'This is a favorite page',
                style: Theme.of(context).textTheme.headline4,
              ),
              ...posts.map(
                (post) => ListTile(
                  title: Text(post['title']),
                  trailing: IconButton(
                    onPressed: () {
                      if (box.containsKey(post['id'])) {
                        box.delete(post['id']);
                      } else {
                        box.put(post['id'], post);
                      }
                    },
                    icon: Icon(Icons.clear),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Hive.box(FAVORITES_BOX).clear();
                  },
                  child: Text("Clear"))
            ],
          );
        },
      ),
    );
  }
}

class ApiService {
  Future getPosts() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      final posts = Hive.box(API_BOX).get('posts', defaultValue: []);
      return posts;
    } else {
      Uri url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
      final res = await http.get(url);
      final resjson = jsonDecode(res.body);
      Hive.box(API_BOX).put("posts", resjson);
      return resjson;
    }
  }
}
