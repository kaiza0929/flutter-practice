import "package:flutter/material.dart";
import 'package:flutter_redux/flutter_redux.dart';
import "./pages/index.dart";
import "package:flutter_app/redux/app.dart";
import 'package:redux/redux.dart';

class App extends StatelessWidget {

  final store = Store<AppState>(appReducer, initialState: AppState.initialState());

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store, 
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/": (context) => Index()
        }
      )
    );
  }

}

void main() => runApp(App());

