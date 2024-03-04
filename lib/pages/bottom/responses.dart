import 'package:flutter/material.dart';

class Responses extends StatelessWidget {
  const Responses({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          child: Column(
            
            children: [
              SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                    width: MediaQuery.of(context).size.width * 0.035,
                  ),
              Row(
                
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                    width: MediaQuery.of(context).size.width * 0.035,
                  ),
                  const Text('Должность'),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                  const Text("50000 - 1000000"),
               
                ],
                
              ),
               const Divider(
            height: 20,
            thickness: 1,
            indent: 5,
            endIndent: 5,
            color: Colors.white,
          ),
              Container(
                alignment: Alignment.bottomLeft,
                width: MediaQuery.of(context).size.width * 0.9,
                child: const Text('Какое-то описание...'),
              ),
              Container(
                  alignment: Alignment.bottomLeft,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const Text("Статус : отказанo")),
              Container(
                  alignment: Alignment.bottomLeft,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const Text("Дата отклика: 12.02.24")),
            SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                    width: MediaQuery.of(context).size.width * 0.035,
                  ),],
          ),
        )
      ],
    );
  }
}
