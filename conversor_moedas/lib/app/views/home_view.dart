import 'package:conversor_moedas/app/components/currency_box.dart';
import 'package:conversor_moedas/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  late HomeController homeController;

  HomeView() {
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // “Bottom Overflowed” error caused by the keyboard
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 40, right: 40, top: 100, bottom: 20),
          child: Column(children: [
            Image.asset('assets/images/logo.png', width: 150, height: 150),
            SizedBox(height: 10),
            CurrencyBox(
                selectedItem: homeController.toCurrency,
                controller: toText,
                items: homeController.currencies,
                onChanged: (model) {
                  print(model.name);
                }),
            SizedBox(height: 10),
            CurrencyBox(
                selectedItem: homeController.fromCurrency,
                controller: fromText,
                items: homeController.currencies,
                onChanged: (model) {}),
            SizedBox(height: 50),
            RaisedButton(
                onPressed: () {}, child: Text('CONVERTER'), color: Colors.amber)
          ]),
        ),
      ),
    );
  }
}
