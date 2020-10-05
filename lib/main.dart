import 'package:flutter/material.dart';
import 'package:venten/views/filters.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Venten',
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: Colors.blueAccent,
        appBarTheme: AppBarTheme(
          elevation: 0.0,
        ),
        scaffoldBackgroundColor: Color(0xfffcfcff),
      ),
      home: Filters(),
      debugShowCheckedModeBanner: false,
    );
  }
}
