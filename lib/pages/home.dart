import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_job/pages/bottom/profile.dart';
import 'package:flutter_job/pages/bottom/responses.dart';
import 'package:flutter_job/pages/bottom/vacancy.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? title = "Вакансии";
  int index = 0;
  bool search = true;
  final pages = [const VacancyPage(), const Responses(), const ProfilePage()];
  
  @override
  Widget build(BuildContext context) {
    AppBar appBarSearch = AppBar(
    title:  const TextField( 
      cursorColor: Colors.white,
      style: TextStyle(
      color: Colors.white
    ),
    decoration: InputDecoration(
      focusedBorder: UnderlineInputBorder(borderSide: const BorderSide(color: Colors.white)),
      prefixIcon: Icon(Icons.search, color: Colors.white,),
      hintText: 'search...',
      hintStyle: TextStyle(
        color: Colors.white38
    ),),),
    actions: [
      IconButton(onPressed: () {},color: const Color.fromARGB(255, 199, 199, 199) ,icon: const Icon(Icons.tune)),
      IconButton(onPressed: (){
        setState(() {
          search = true;
        });
      },  icon: const  Icon(Icons.cancel, color: Colors.white,)),
      
    ],
  );
  AppBar appBar =AppBar(
    leading: IconButton(
      icon: const Icon(Icons.exit_to_app),
      color: Colors.white,
      onPressed: () {
        Navigator.popAndPushNamed(context, '/');
      },
    ),
    title: Text(title!),
    actions: [
      IconButton(onPressed: (){
        setState(() {
          search = false;
        });
      }, icon: const Icon(Icons.search, color: Colors.white,))
    ],
  );
    return Scaffold(
      appBar: search? appBar : appBarSearch,
      body: pages.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap:(value) {
          setState(() {
            index = value;
            if(index == 0){
              title = "Вакансии";

            }
            if(index == 1){
              title = "Отклики";
            }
            if(index == 2){
              title = "Профиль";
            }
          });
          
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Вакансии'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Отклики'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'Профиль'),
        ],
      ),
    );
  }
}
