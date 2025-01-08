import 'package:firebase_database/firebase_database.dart';

class DatabaseService {

  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  void turnOffRoutines() {
    _db.child("rotinas/chegada/on").set(false);
    _db.child("rotinas/saida/on").set(false);
  }
}