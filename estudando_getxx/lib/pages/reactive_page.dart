import 'package:estudando_getxx/controllers/reactive_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ReactivePage extends StatelessWidget {
  ReactivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReactiveController>(
        init: ReactiveController(),
        builder: (_) {
          print('reactive');
          return Scaffold(
            appBar: AppBar(
              title: Text(''),
            ),
            body: Obx(
              () => ListView(
                children: _.mapItems.values
                    .map(
                      (e) => ListTile(
                        title: Text(e),
                        trailing: IconButton(
                          onPressed: () => _.removeMapItem(e),
                          icon: Icon(Icons.delete),
                        ),
                      ),
                    )
                    .toList(),
              ),

              // () => ListView.builder(
              //   itemBuilder: (__, index) {
              //     final String text = _.items[index];
              //     return ListTile(
              //       title: Text(text),
              //       trailing: IconButton(
              //         onPressed: () => _.removeItem(index),
              //         icon: Icon(Icons.delete),
              //       ),
              //     );
              //   },
              //   itemCount: _.items.length,
              // ),
            ),
            // body: Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Obx(() {
            //       print('Esta atualizando o Contador');
            //       return Text(
            //         _.counter.value.toString(),
            //         style: TextStyle(fontSize: 30),
            //       );
            //     }),
            //     Obx(() {
            //       print('Esta atualizando a Data do dia');
            //       return Text(
            //         _.currentDate.value,
            //         style: TextStyle(fontSize: 30),
            //       );
            //     }),
            //   ],
            // ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // FloatingActionButton(
                //   heroTag: 'add',
                //   onPressed: () {
                //     _.increment();
                //   },
                //   child: Icon(Icons.add),
                // ),
                // FloatingActionButton(
                //   heroTag: 'add',
                //   onPressed: () {
                //     _.addItem();
                //   },
                //   child: Icon(Icons.add),
                // ),
                FloatingActionButton(
                  heroTag: 'add',
                  onPressed: () {
                    _.addMapItem();
                  },
                  child: Icon(Icons.add),
                ),
                FloatingActionButton(
                  heroTag: 'date',
                  onPressed: () {
                    _.getDate();
                  },
                  child: Icon(Icons.calendar_today),
                ),
              ],
            ),
          );
        });
  }
}
