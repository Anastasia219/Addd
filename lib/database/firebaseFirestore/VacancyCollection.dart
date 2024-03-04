// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

class VacancyCollection{
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<void>  addVacancy(
    String id, 
    String post, 
    String salary, 
    String decription, 
    String date, 
    String grafic,
     String idManager,
     String nameCompany
     ) async{
    try {
      await _firebaseFirestore.collection("vacancy").doc(id).set({
        'uid':id,
        'post': post,
        'salary':salary,
        'decription':decription,
        'date':date,
        'grafic':grafic,
        'idManager':idManager,
        'nameCompany':nameCompany
    });
    } catch (e) {
      return;
    }
  }

  Future<void>  editVacancy(
    dynamic docs, 
    String post, 
    String salary, 
    String decription, 
    String date, 
    String grafic,
     String idManager,
     String nameCompany
     ) async{
    try {
      await _firebaseFirestore.collection("vacancy").doc(docs.id).update({
        'post': post,
        'salary':salary,
        'decription':decription,
        'date':date,
        'grafic':grafic,
        'idManager':idManager,
        'nameCompany':nameCompany
    });
    } catch (e) {
      return;
    }
  }

  Future<void>  deleteVacancy(
    dynamic docs,
    
     ) async{
    try {
      await _firebaseFirestore.collection("vacancy").doc(docs.id).delete();
    } catch (e) {
      return;
    }
  }
}