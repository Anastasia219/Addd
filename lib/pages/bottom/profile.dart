import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_job/database/firebaseFirestore/ProfileCollection.dart';
import 'package:flutter_job/database/firebaseStore/image_storage.dart';
import 'package:flutter_job/themes/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

final colRef = FirebaseFirestore.instance.collection('profile');

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userID = FirebaseAuth.instance.currentUser!.uid.toString();
  dynamic userDoc;
  File? selectImage;
  XFile? fileName;
  ImageStorage imageStorage = ImageStorage();
  ProfileCollection profile = ProfileCollection();

  selectImageGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      fileName = returnImage;
      selectImage = File(returnImage!.path);
    });
  }

//////////  Метод отправки на облако  //////////

  void pushStorage() async {
    await imageStorage.addImageStorage(fileName!);
  }

  getUserById() async {
    final DocumentSnapshot documentSnapshot = await colRef.doc(userID).get();
    setState(() {
      userDoc = documentSnapshot;
    });
  }

  Widget resumeCard(BuildContext context, dynamic docs) {
    return Card(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(docs['position']),
            Text(docs['salary']),
          ],
        ),
        subtitle: Column(children: [
          Text(docs['surname']),
          Text(docs['name']),
          Text(docs['patronymic']),
          Text(docs['email']),
          Text(docs['phone']),
          const Expanded(
            child: Divider(
              color: Colors.red,
            ),
          ),
          Text(docs['description']),
          Container(
            alignment: Alignment.bottomRight,
            child: Text(docs['date']),
          ),
        ]),
      ),
    );
  }

  @override
  void initState() {
    getUserById();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
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
                      onPressed: () async {
                        selectImageGallery();
                        if (selectImage != null) {
                          pushStorage();
                          await Future.delayed(
                            const Duration(seconds: 4),
                          );
                          await profile.editImageProfile(
                              userDoc, imageStorage.pathImageUrl!);
                          Toast.show("Успешно!");
                        } else {
                          Toast.show("ХУЙЛО ДОБАВЬ ФОТО");
                        }
                      },
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
        Text(
          'Список резюме',
          textScaler:
              TextScaler.linear(MediaQuery.textScalerOf(context).scale(2)),
          style: const TextStyle(color: Colors.white),
        ),
        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('profiles')
                .doc(userID)
                .collection('resumes')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return resumeCard(context, snapshot.data!.docs[index]);
                    });
              }
            })
      ],
    );
  }
}
