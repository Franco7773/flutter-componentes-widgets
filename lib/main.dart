import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// import 'package:components_flutter/src/pages/home_temp.dart';
import 'package:components_flutter/src/pages/alert_page.dart';
import 'package:components_flutter/src/routes/routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('es', 'ES')
      ],
      // home: HomePage(),
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: ( RouteSettings settings ) {
        return MaterialPageRoute(
          builder: ( BuildContext context ) => AlertPage()
        );
      },
    );
  }
}