import 'package:cloud_firestore/cloud_firestore.dart';

class Patient {
  final String id;
  final String email;
  final String fullName;

  Patient({
    this.id,
    this.email,
    this.fullName,
  });

  factory Patient.fromSnapshot(DocumentSnapshot snapshot) {
    return Patient(
      id: snapshot.id,
      email: snapshot.data()['email'],
      fullName: snapshot.data()['fullName'],
    );
  }
}
