import 'package:flutter/material.dart';
import 'package:flutter_first_app/question.dart';

// runApp will take our MyApp Widget and Attach it to the screen. It basically
// will take the object passed in and call the "build" method
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _onQuestionAnswered() {
    setState(() {
      this._questionIndex += 1;
    });
  }

  // Similar as render()
  @override
  Widget build(BuildContext context) {
    var questionsList = ['Are you a dog or cat type person?', 'Coffee or Tea?'];

    // home: is the widget that will be first loaded in the app, similar to a
    // root rout "/"
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Question(questionsList[this._questionIndex]),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Column(children: [
          Text(questionsList[this._questionIndex]),
          RaisedButton(
            child: Text('Dog Person'),
            onPressed: this._onQuestionAnswered,
          ),
          RaisedButton(
            child: Text('Cat Person'),
            onPressed: this._onQuestionAnswered,
          ),
          RaisedButton(
            child: Text('Neither, I\'m a monster!'),
            onPressed: this._onQuestionAnswered,
          ),
        ]),
      ),
    );
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

/*
 * StatefulWidget
 *
 * As with React, an Widget (Component) can store state and gets
 * re-rendered/re-built if this state changes. But in Flutter we need to
 * separate the State from the Widget, because the Widget get's re-built and if
 * the State would be attached to it, it'd get loss.
 *
 * So first, we need create an class that extends StatefulWidget and other
 * That extends the State class.
 *
 * The State class will also receive the StatefulWidget base class as the
 * generic type. And the StatefulWidget extend class will need to implement
 * the createState method.
 */
