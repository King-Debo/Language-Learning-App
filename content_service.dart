import 'package:cloud_firestore/cloud_firestore.dart';

class ContentService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add new content to the database
  Future<void> addContent(Map<String, dynamic> contentData) async {
    await _firestore.collection('content').add(contentData);
  }

  // Update existing content
  Future<void> updateContent(String documentId, Map<String, dynamic> contentData) async {
    await _firestore.collection('content').doc(documentId).update(contentData);
  }

  // Delete content
  Future<void> deleteContent(String documentId) async {
    await _firestore.collection('content').doc(documentId).delete();
  }

  // Fetch content
  Stream<QuerySnapshot> getContentStream() {
    return _firestore.collection('content').snapshots();
  }
}
