import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:womensafty/models/patient.dart';

@lazySingleton
class FirestoreService {
  CollectionReference _patients =
      FirebaseFirestore.instance.collection('patients');

  Future<Patient> addPatient({
    @required String uid,
    @required String email,
    @required String fullName,
  }) async {
    await _patients.doc(uid).set({
      'email': email,
      'fullName': fullName,
    });

    return _patients
        .doc(uid)
        .get()
        .then((DocumentSnapshot snapshot) => Patient.fromSnapshot(snapshot));
  }

  Future<Patient> fetchPatient(String uid) async {
    return await _patients
        .doc(uid)
        .get()
        .then((DocumentSnapshot snapshot) => Patient.fromSnapshot(snapshot));
  }

  Future<String> createReport({
    @required String uid,
    @required Timestamp timestamp,
    @required double bloodPreassure,
    @required double heartRate,
    @required double temperature,
  }) async {
    return await _patients.doc(uid).collection('reports').add({
      'timestamp': timestamp,
      'bloodPreassure': bloodPreassure,
      'heartRate': heartRate,
      'temperature': temperature,
    }).then((DocumentReference reference) => reference.id);
  }

  Stream<QuerySnapshot> streaReports(String uid) {
    return _patients
        .doc(uid)
        .collection('reports')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
