import 'package:cloud_firestore/cloud_firestore.dart';

class ProgressService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String userId;

  ProgressService(this.userId);

  // Add or Update progress
  Future<void> updateProgress(String lessonId, Map<String, dynamic> progressData) async {
    await _firestore.collection('users').doc(userId).collection('progress').doc(lessonId).set(progressData, SetOptions(merge: true));
  }

  // Fetch user progress
  Stream<DocumentSnapshot> getUserProgressStream() {
    return _firestore.collection('users').doc(userId).snapshots();
  }

  // Reset progress
  Future<void> resetProgress() async {
    await _firestore.collection('users').doc(userId).collection('progress').get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }
}
