import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopps/providers/cart.provider.dart';
import 'package:shopps/providers/orders.provider.dart';
import 'package:shopps/providers/products.provider.dart';
import 'package:shopps/screens/cart_screen.dart';
import 'package:shopps/screens/edit-product-screen.dart';
import 'package:shopps/screens/orders_screen.dart';
import 'package:shopps/screens/product_detail_screen.dart';
import 'package:shopps/screens/products_overview_screen.dart';
import 'package:shopps/screens/user_products_screen.dart';

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
        ChangeNotifierProvider(
          create: (_) => Orders(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          accentColor: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Lato',
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(
              color: Theme.of(context).accentColor,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).accentColor),
            ),
          ),
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
        },
        onGenerateRoute: (RouteSettings settings) {
          // I'm using this approach so I can pass the Product ID. When using just a norm
          // route, we can't get the ModalRoute from initState. But in here, we can get it
          // Thanks to RouteSettings parameter
          final Map<String, WidgetBuilder> routes = {
            EditProductScreen.routeName: (ctx) =>
                EditProductScreen(product: settings.arguments),
          };

          return MaterialPageRoute(builder: routes[settings.name]);
        },
      ),
    );
  }
}

/*
 * With the ChangeNotifierProvider we can Provide classes that have the Mixin
 * ChangeNotifier as our state holder. This is done in the create method
 */
