import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  await Hive.initFlutter();
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Box box;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    openBox();
  }

  Future openBox() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box = await Hive.openBox('textBox');
    return;
  }

  void putData() {
    // key / pair
    String teste = '';
    box.put('name', 'Alexandre');
    box.put('user23', '');

    // box.add('');
  }

  void getAll() {
    print(box.toMap());
  }

  void getData() {
    box.get('jose');
    print(box.get('jose'));
  }

  void updateData() {
    box.put('name', 'Alexandre Silveira');
  }

  void deleteData() {
    box.delete('name');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'output',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () => putData(),
              child: Text('Put Data'),
            ),
            ElevatedButton(
              onPressed: () => getAll(),
              child: Text('Get All'),
            ),
            ElevatedButton(
              onPressed: () => getData(),
              child: Text('Get Data'),
            ),
            ElevatedButton(
              onPressed: () => updateData(),
              child: Text('Update Data'),
            ),
            ElevatedButton(
              onPressed: () => deleteData(),
              child: Text('Delete Data'),
            ),
          ],
        ),
      ),
    );
  }
}
