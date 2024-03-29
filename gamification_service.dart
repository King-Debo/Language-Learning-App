import 'package:cloud_firestore/cloud_firestore.dart';

class GamificationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String userId;

  GamificationService(this.userId);

  // Update user points
  Future<void> updateUserPoints(int points) async {
    await _firestore.collection('users').doc(userId).update({'points': FieldValue.increment(points)});
  }

  // Add a new badge to the user's collection
  Future<void> addBadge(String badgeId) async {
    await _firestore.collection('users').doc(userId).collection('badges').doc(badgeId).set({'earned': true});
  }

  // Fetch user badges
  Stream<QuerySnapshot> getUserBadgesStream() {
    return _firestore.collection('users').doc(userId).collection('badges').snapshots();
  }

  // Record completion of a daily challenge
  Future<void> completeDailyChallenge(String challengeId) async {
    await _firestore.collection('users').doc(userId).collection('dailyChallenges').doc(challengeId).set({'completed': true});
  }

  // Fetch leaderboard data
  Stream<QuerySnapshot> getLeaderboardStream() {
    return _firestore.collection('leaderboard').orderBy('points', descending: true).limit(10).snapshots();
  }
}
