import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopps/mock/mock_products.dart';
import 'package:shopps/providers/auth_provider.dart';
import 'package:shopps/providers/cart.provider.dart';
import 'package:shopps/providers/orders.provider.dart';
import 'package:shopps/providers/products.provider.dart';
import 'package:shopps/old/auth_screen_with_animated_container.dart';
import 'package:shopps/screens/cart_screen.dart';
import 'package:shopps/screens/edit-product-screen.dart';
import 'package:shopps/screens/orders_screen.dart';
import 'package:shopps/screens/product_detail_screen.dart';
import 'package:shopps/screens/products_overview_screen.dart';
import 'package:shopps/screens/splash_screen.dart';
import 'package:shopps/screens/user_products_screen.dart';
import 'package:shopps/utils/GlobalScaffoldKey.dart';

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
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (_) => Products(null, MOCK_PRODUCTS),
          update: (ctx, auth, oldProductsState){
            return Products(
              auth,
              oldProductsState.products != null ? oldProductsState.products : [],
            );
          },
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (_) => Orders(null, []),
          update: (ctx, auth, oldOrdersState) => Orders(
            auth,
            oldOrdersState.orders != null ? oldOrdersState.orders : [],
          ),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
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
                borderSide: BorderSide(
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
          ),
          builder: (context, child) {
            // Introducing a global Scaffold
            return Scaffold(
              key: GlobalScaffoldKey.instance.scaffoldKey,
              body: child,
            );
          },
          home: auth.isAuth
              ? ProductsOverviewScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (context, autoLoginSnapshot) {
                    // Checking the status of tryAutoLogin, this returns a boolean
                    // and notify the changes when finishes. That's why we don't
                    // need to worry forwarding the user to the ProductsOverviewScreen
                    // Because when it finishes, the notifyListeners will rebuild this
                    // Widget tree. Look at the Consumer<Auth> above
                    return autoLoginSnapshot.connectionState ==
                            ConnectionState.waiting
                        ? SplashScreen()
                        : AuthScreen();
                  },
                ),
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
      ),
    );
  }
}

/*
 * With the ChangeNotifierProvider we can Provide classes that have the Mixin
 * ChangeNotifier as our state holder. This is done in the create method
 */
