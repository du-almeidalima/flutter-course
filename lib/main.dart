import 'package:flutter/material.dart';

// runApp will take our MyApp Widget and Attach it to the screen. It basically
// will take the object passed in and call the "build" method
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // Similar as render()
  @override
  Widget build(BuildContext context) {
    // home: is the widget that will be first loaded in the app, similar to a
    // root rout "/"
    return MaterialApp(home: Text('Hey Dude!'),);
  }
}

/*
 * Similar to JavaScript Frameworks, that uses Components as their building
 * blocks, Flutter uses Widgets. The "root" widget sort to say, is called
 * Scaffold (Andaime).
 *
 * Since a class is not enough to become a Widget, because it would need to deal
 * with Rendering, Widget tree, and so on... It needs to extends some class with
 * this logic. A class that comes from Flutter
 */

/*
 * The build() method will be the method Flutter will call to draw a Widget
 * on the screen, and this method, returns a Widget.
 *
 * The MaterialApp is kind of a container  that does a basic setup
 * it bundles all the Widgets to form an App.
 */