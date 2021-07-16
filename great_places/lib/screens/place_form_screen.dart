import 'package:flutter/material.dart';
import 'package:great_places/widgets/image_input_widget.dart';

class PlaceFormScreen extends StatefulWidget {
  PlaceFormScreen({Key? key}) : super(key: key);

  @override
  _PlaceFormScreenState createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  final _titleController = TextEditingController();

  void _submitForm() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Novo Lugar')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: "Título",
                      ),
                    ),
                    SizedBox(height: 10),
                    ImageInputWidget(),
                  ],
                ),
              ),
            ),
          ),
          Text('Teste'),
          ElevatedButton.icon(
            onPressed: _submitForm,
            icon: Icon(Icons.add),
            label: Text('Adicionar'),
            style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              elevation: 0,
              primary: Theme.of(context).accentColor,
              onPrimary: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
