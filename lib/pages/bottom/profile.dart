import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(child: ListTile(
            title: Container(
              alignment: Alignment.topLeft,
              child: const Column(
                
                children: 
                  [
                    Text('Иванов', style: TextStyle(color: Colors.black),),
                    Text('Иван', style: TextStyle(color: Colors.black),),
                    Text('Иванович', style: TextStyle(color: Colors.black),),
                  ],
                ),
              ),
            subtitle: const Text('+79872293084', style: TextStyle(color: Colors.black),),
            //Переправить на Image.network
            leading: const Icon(Icons.account_box),
            trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_right)),
            ),
          ),

        ],
      ),
    );
  }
}