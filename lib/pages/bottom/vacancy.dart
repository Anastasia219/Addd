import 'package:flutter/material.dart';

class VacancyPage extends StatelessWidget {
  const VacancyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          child: Column
          (
            children: [
              Row(
                children: [
                  const Text('Должность'),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                  const Text("50000 - 1000000"),
                  const Divider(
                    color: Colors.white,
                  )

                ],

              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.2,
                child: const Text('Какое-то описание...')),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Дата публикации"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                  OutlinedButton(onPressed: () {}, child: Text("Откликнуться"))
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}