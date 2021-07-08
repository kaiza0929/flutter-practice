import "package:flutter/material.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "./../pages/home.dart";
import "./../pages/login.dart";
import "./../pages/new.dart";
import "./states/app.dart";
import "package:flutter_redux/flutter_redux.dart";
import "package:redux/redux.dart";

const locale = Locale("ja", "JP");

class App extends StatelessWidget {

  final store = Store<AppState>(appReducer, initialState: AppState.initAppState());

  @override
  Widget build(BuildContext context) {
    return StoreProvider(store: store, child: MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: locale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        locale,
      ],
      /* これがあるので未ログイン時の各ページからログインページへのリダイレクト処理は必要ない */
      initialRoute: "/login",
      routes: {
        "/": (context) => HomePage(),
        "/login": (context) => LoginPage(),
        "/new": (context) => NewPage()
      }
    ));
  }

}

void main() => runApp(App());