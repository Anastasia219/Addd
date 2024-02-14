import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('images/icon.png',
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width *0.31 ,
          fit: BoxFit.cover 
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),

          
          
          const TextField(),
          const TextField(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.5,
            child: OutlinedButton(
              onPressed: () {},
              child: const Text('Войти'),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          InkWell(
            child: const Text(
              'Нет аккаунта? Зарегистрируйся!',
              style: TextStyle(color: Colors.white54),
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
