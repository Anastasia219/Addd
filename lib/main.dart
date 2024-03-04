import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_job/database/firebaseAuth/users_services.dart';
import 'package:flutter_job/routes/routes.dart';
import 'package:flutter_job/themes/darkTheme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBY7Wmp8fgGtov_5yxrKhCxCl1axiF0jRQ",
          appId: "1:910757145226:android:bf38c2c676e3c77098db73",
          messagingSenderId: "910757145226",
          projectId: "flutterjob-842eb",
          storageBucket: 'flutterjob-842eb.appspot.com'),
          );
  runApp(const ThemeAppMaterial());
}

class ThemeAppMaterial extends StatelessWidget {
  const ThemeAppMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      initialData: null,
      value: AuthService().currentUser,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: dark,
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}
