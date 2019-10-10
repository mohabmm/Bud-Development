import 'dart:async';
import 'package:budupdated/core/models/achievement.dart';
import 'package:budupdated/core/models/ride_list.dart';
import 'package:budupdated/core/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseService {
  final Firestore _db = Firestore.instance;
  StreamController<List<User>> menuItemsController = new BehaviorSubject();
  Stream<List<User>> get menuItems => menuItemsController.stream;

  FirebaseService() {
    getLeaderBoardDriver();
  }
  Future<RideList> getRide() {
    return _db
        .collection('Offer Ride list')
        .document()
        .get()
        .then((snap) => RideList.fromMap(snap.data));
  }

  getAchievement(FirebaseUser user) {
    return _db
        .collection("Achievements")
        .where("email", isEqualTo: user.email)
        .snapshots()
        .listen(_getAchievementFromSnapshot);
  }

  getLeaderBoardDriver() {
    return _db
        .collection("users")
        .where("driverrate", isGreaterThan: "0")
        .orderBy('driverrate', descending: true)
        .limit(10)
        .snapshots()
        .listen(_menuitemsUpdated);
  }
//

  List<User> _menuitemsUpdated(QuerySnapshot snapshot) {
    // used to get the list of menu items from snapshot
    var item = _getLeaderBoardDriverFromSnapshot(snapshot);

    menuItemsController.add(item);
  }

  getLeaderBoardPassenger() {
    return _db
        .collection("users")
        .where("passengerrate", isGreaterThan: "0")
        .orderBy('passengerrate', descending: true)
        .limit(10)
        .snapshots()
        .listen(_getLeaderBoardPassengerFromSnapshot);
  }

  List<Achievement> _getAchievementFromSnapshot(QuerySnapshot snapshot) {
    var achievementItemsList = List<Achievement>();
    var documents = snapshot.documents;
    var hasDocuments = documents.length > 0;

    if (hasDocuments) {
      for (var document in documents) {
        achievementItemsList.add(Achievement.fromSnapshot(document.data));
      }
    }

    print(" achievements items length is " +
        achievementItemsList.length.toString());

    return achievementItemsList;
  }

  List<User> _getLeaderBoardDriverFromSnapshot(QuerySnapshot snapshot) {
    var leaderBoardListDriver = List<User>();
    var documents = snapshot.documents;

    var hasDocuments = documents.length > 0;

    if (hasDocuments) {
      for (var document in documents) {
        leaderBoardListDriver.add(User.fromSnapshot(document.data));
      }
    }

    print(" leaderBoard items Driver length is " +
        leaderBoardListDriver.length.toString());

    return leaderBoardListDriver;
  }

  List<User> _getLeaderBoardPassengerFromSnapshot(QuerySnapshot snapshot) {
    var leaderBoardListPassenger = List<User>();
    var documents = snapshot.documents;

    var hasDocuments = documents.length > 0;

    if (hasDocuments) {
      for (var document in documents) {
        leaderBoardListPassenger.add(User.fromSnapshot(document.data));
      }
    }

    print(" leaderBoard items Passenger length is " +
        leaderBoardListPassenger.length.toString());

    return leaderBoardListPassenger;
  }
}
