import 'package:cloud_firestore/cloud_firestore.dart';

class Db {
  final dbRef = Firestore.instance;
  getAllRecordsSnapShot() {
    return dbRef.collection('users').snapshots();
  }

  DocumentSnapshot lastDoc = null;
  List<DocumentSnapshot> list = [];
  Future<List<DocumentSnapshot>> getPaginatedData(records) async {
    QuerySnapshot result;
    if (lastDoc == null) {
      // 1 to 5
      print("First Time Call");
      Query query = dbRef.collection('users').orderBy('name').limit(records);
      result = await query.getDocuments();
      lastDoc = result.documents[result.documents.length - 1]; //5
      list = result.documents;
    } else {
      print("Next time call");
      Query query = dbRef
          .collection('users')
          .orderBy('name')
          .startAfter([lastDoc.data['name']]).limit(records);
      result = await query.getDocuments();
      list.addAll(result.documents);
    }

    return list;
  }
}
