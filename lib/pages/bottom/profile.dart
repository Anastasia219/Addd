import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final colRef = FirebaseFirestore.instance.collection('profile');

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userID = FirebaseAuth.instance.currentUser!.uid.toString();
  dynamic userDoc;

  getUserById() async {
    final DocumentSnapshot documentSnapshot = await colRef.doc(userID).get();
    setState(() {
      userDoc = documentSnapshot;
    });
  }

  @override
  void initState() {
    getUserById();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            title: Container(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Text(
                    userDoc['surname'],
                    style: const TextStyle(color: Colors.black),
                  ),
                  Text(
                    userDoc['name'],
                    style: const TextStyle(color: Colors.black),
                  ),
                  Text(
                    userDoc['patronymic'],
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            subtitle: Text(
              userDoc['phone'],
              style: const TextStyle(color: Colors.black),
            ),
            //Переправить на Image.network
            leading: userDoc['image'] == ''
                ? CircleAvatar(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                    ),
                  )
                : CircleAvatar(
                    backgroundImage: NetworkImage(userDoc['image']),
                  ),
            // leading: const Icon(Icons.account_box),
            trailing: IconButton(
                onPressed: () {}, icon: const Icon(Icons.arrow_right)),
          ),
        ),
        const Text(
          'Список резюме',
          style: TextStyle(color: Colors.white),
        ),
        ListView(
          shrinkWrap: true,
          children: const [
            ListTile(
              tileColor: Colors.white,
              subtitle: Text('щгащукшвщзкдплвзплзплвзпжлвж'),
              title: Text('Программист'),
            ),
          ],
        )
      ],
    );
  }
}
