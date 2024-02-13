import 'package:flutter/material.dart';
import 'package:flutter_job/routes/routes.dart';

void main() {
  runApp(const ThemeAppMaterial());
}

class ThemeAppMaterial extends StatelessWidget{
  const ThemeAppMaterial({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      initialRoute: '/',
      routes: routes,
    );
  }
}


