import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopps/providers/cart.provider.dart';
import 'package:shopps/providers/products.provider.dart';
import 'package:shopps/screens/product_detail_screen.dart';
import 'package:shopps/screens/products_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // With this
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          accentColor: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {ProductDetailScreen.routeName: (ctx) => ProductDetailScreen()},
      ),
    );
  }
}

/*
 * With the ChangeNotifierProvider we can Provide classes that have the Mixin
 * ChangeNotifier as our state holder. This is done in the create method
 */
