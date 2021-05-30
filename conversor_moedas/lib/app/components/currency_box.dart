import 'package:conversor_moedas/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel> items;
  final CurrencyModel selectedItem;
  final TextEditingController controller;
  final void Function(CurrencyModel model) onChanged;

  const CurrencyBox(
      {Key? key,
      required this.items,
      required this.controller,
      required this.onChanged,
      required this.selectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: SizedBox(
              height: 56,
              child: DropdownButton<CurrencyModel>(
                iconEnabledColor: Colors.amber,
                isExpanded: true,
                underline: Container(height: 1, color: Colors.amber),
                items: items
                    .map((e) => DropdownMenuItem<CurrencyModel>(
                        value: e, child: Text(e.name)))
                    .toList(),
                // onChanged: onChanged,
              ),
            )),
        SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber)))),
        ),
      ],
    );
  }
}
