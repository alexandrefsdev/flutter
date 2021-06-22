import 'package:estudando_getx/app/data/models/movie.dart';
import 'package:estudando_getx/app/modules/home/home_controller.dart';
import 'package:estudando_getx/app/modules/home/local_widgets/movie_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: _.logOut,
              icon: Icon(Icons.exit_to_app),
            )
          ],
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.transparent,
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              final Movie movie = _.movies[index];
              return MovieItem(movie: movie);
            },
            itemCount: _.movies.length,
          ),
        ),
      ),
    );
  }
}
