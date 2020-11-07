import 'package:flutter/material.dart';
import 'package:shopps/screens/product_detail_screen.dart';
import 'package:shopps/screens/products_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        accentColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Lato',
      ),
      home: ProductsOverviewScreen(),
      routes: {ProductDetailScreen.routeName: (ctx) => ProductDetailScreen()},
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Shopts'),
//       ),
//     );
//   }
// }
