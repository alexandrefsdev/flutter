import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/providers/products.dart';

class ProductFormScreen extends StatefulWidget {
  @override
  _ProductFormScreenState createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  @override
  void initState() {
    super.initState();
    _imageUrlFocusNode.addListener(_updateImage);
  }

  // Quando houver mudanças nas dependencias
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_formData.isEmpty) {
      final Product? product =
          ModalRoute.of(context)!.settings.arguments as Product?;

      if (product != null) {
        _formData['id'] = product.id as String;
        _formData['title'] = product.title;
        _formData['description'] = product.description;
        _formData['price'] = product.price;
        _formData['imageUrl'] = product.imageUrl;

        _imageUrlController.text = _formData['imageUrl'].toString();
      } else {
        _formData['id'] = Null;
        _formData['title'] = '';
        _formData['description'] = '';
        _formData['price'] = '';
        _formData['imageUrl'] = '';
      }
    }
  }

  void _updateImage() {
    if (isValidImageUrl(_imageUrlController.text)) {
      setState(() {});
    }
  }

  // Algumas validações para a url da imagem
  bool isValidImageUrl(String url) {
    bool startWithHttp = url.toLowerCase().startsWith('http://');
    bool startWithHttps = url.toLowerCase().startsWith('https://');
    bool endsWithPng = url.toLowerCase().endsWith('.png');
    bool endsWithJpg = url.toLowerCase().endsWith('.jpg');
    bool endsWithJpeg = url.toLowerCase().endsWith('.jpeg');

    return (startWithHttp || startWithHttps) &&
        (endsWithPng || endsWithJpg || endsWithJpeg);
  }

  @override
  void dispose() {
    super.dispose();
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlFocusNode.removeListener(_updateImage);
    _imageUrlFocusNode.dispose();
  }

  void _saveForm() {
    var isValid = _form.currentState!.validate();

    if (!isValid) {
      return;
    }

    _form.currentState!.save();

    final product = Product(
      id: _formData['id'].toString(),
      title: _formData['title'].toString(),
      description: _formData['description'].toString(),
      price: _formData['price'] as double,
      imageUrl: _formData['imageUrl'] as String,
    );

    final products = Provider.of<Products>(context, listen: false);
    if (_formData['id'] == Null) {
      products.addProduct(product);
    } else {
      products.updateProduct(product);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário Produto'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              _saveForm();
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _formData['title'].toString(),
                decoration: InputDecoration(labelText: 'Título'),
                // Função para que apos o enter, va para o proximo input
                textInputAction: TextInputAction.next,
                // Controle de foco para o priceFocusNode -> proximo textfield -> focusNode
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                onSaved: (value) => _formData['title'] = value!,
                validator: (value) {
                  bool isEmpty = value!.trim().isEmpty;
                  bool isInvalid = value.trim().length < 3;

                  if (isEmpty || isInvalid) {
                    return 'Informe um Título válido com no mínimo 3 caracteres!';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData['price'].toString(),
                decoration: InputDecoration(labelText: 'Preço'),
                focusNode: _priceFocusNode,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                // Função para que apos o enter, va para o proximo input
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                onSaved: (value) => _formData['price'] = double.parse(value!),
                validator: (value) {
                  bool isEmpty = value!.trim().isEmpty;
                  var newPrice = double.tryParse(value);
                  bool isInvalid = newPrice == null || newPrice <= 0;
                  if (isEmpty || isInvalid) {
                    return 'Informe um Preço válido!';
                  }

                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData['description'].toString(),
                decoration: InputDecoration(labelText: 'Descrição'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                // Função para que apos o enter, va para o proximo input
                focusNode: _descriptionFocusNode,
                onSaved: (value) => _formData['description'] = value!,
                validator: (value) {
                  bool isEmpty = value!.trim().isEmpty;
                  bool isInvalid = value.trim().length < 10;

                  if (isEmpty) {
                    return 'Informe um Descrição válido!';
                  }

                  if (isInvalid) {
                    return 'Informe um título com no mínimo 10 letras!';
                  }
                  return null;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'URL da imagem'),
                      keyboardType: TextInputType.url,
                      // Está ação submete o formulário
                      textInputAction: TextInputAction.done,
                      // Função para que apos o enter, va para o proximo input
                      focusNode: _imageUrlFocusNode,
                      controller: _imageUrlController,
                      onFieldSubmitted: (_) {
                        _saveForm();
                      },
                      onSaved: (value) => _formData['imageUrl'] = value!,
                      validator: (value) {
                        bool isEmpty = value!.trim().isEmpty;
                        bool isInvalid = !isValidImageUrl(value);
                        if (isEmpty || isInvalid) {
                          return 'Informe uma URL válida!';
                        }

                        return null;
                      },
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(
                      top: 8,
                      left: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: _imageUrlController.text.isEmpty
                        ? Text('Informe a URL')
                        : FittedBox(
                            child: Image.network(
                              _imageUrlController.text,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
