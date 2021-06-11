import 'package:core_mobile/utils/app_routes.dart';
import 'package:core_mobile/views/tabs_screen.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'R2 Telecomunicações',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
        fontFamily: 'Lato',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(),
        // AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(),
        // AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
      },
      // onGenerateRoute: ,
      // onUnknownRoute: ,
    );
  }
}
