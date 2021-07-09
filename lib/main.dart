import "package:flutter/material.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:flutter_redux/flutter_redux.dart";
import "package:redux/redux.dart";
import "./pages/home.dart";
import "./states/app.dart";

const locale = Locale("ja", "JP");

class App extends StatelessWidget {

  final store = Store<AppState>(appReducer, initialState: AppState.initAppState());

  @override 
  Widget build(BuildContext context) {
    return StoreProvider(store: store, child: MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: locale,
      supportedLocales: const [
        locale,
      ],
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage()
      },
    ));
  }

}

void main() { runApp(App()); }