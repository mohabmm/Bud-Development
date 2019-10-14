import 'dart:async';
import 'package:budupdated/core/models/achievement.dart';
import 'package:budupdated/core/models/ride_list.dart';
import 'package:budupdated/core/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseService {
  final Firestore _db = Firestore.instance;
  StreamController<List<User>> leaderBoardDriverItemsController =
      new BehaviorSubject();
  StreamController<List<User>> leaderBoardPassengerItemsController =
      new BehaviorSubject();

  Stream<List<User>> get leaderBoardDriverItemsStream =>
      leaderBoardDriverItemsController.stream;

  Stream<List<User>> get leaderBoardPassengerItemsStream =>
      leaderBoardPassengerItemsController.stream;

  StreamController<List<Achievement>> achievementController =
      new BehaviorSubject();

  Stream<List<Achievement>> get achievementStream =>
      achievementController.stream;

  FirebaseService() {}

  getLeaderBoardDriver() {
    print("get Leaderboard Driver is called");
    return _db
        .collection("user")
        .where("driverRate", isGreaterThan: "0")
        .orderBy('driverRate', descending: true)
        .limit(10)
        .snapshots()
        .listen(_leaderBoardDriverItemsUpdated);
  }

  getLeaderBoardPassenger() {
    print("get Leaderboard Passenger is called");

    return _db
        .collection("user")
        .where("passengerRate", isGreaterThan: "0")
        .orderBy('passengerRate', descending: true)
        .limit(10)
        .snapshots()
        .listen(_leaderBoardPassengerItemsUpdated);
  }

  void _leaderBoardDriverItemsUpdated(QuerySnapshot snapshot) {
    // used to get the list of menu items from snapshot
    var item = _getLeaderBoardDriverFromSnapshot(snapshot);

    leaderBoardDriverItemsController.add(item);
  }

  void _leaderBoardPassengerItemsUpdated(QuerySnapshot snapshot) {
    // used to get the list of menu items from snapshot
    var passengerItem = _getLeaderBoardPassengerFromSnapshot(snapshot);

    leaderBoardPassengerItemsController.add(passengerItem);
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

  getAchievement(FirebaseUser user) {
    print("get achievements is called");
    return _db
        .collection("Achievements")
        .where("email", isEqualTo: user.email)
        .snapshots()
        .listen(_achievementItemsUpdated);
  }

  void _achievementItemsUpdated(QuerySnapshot snapshot) {
    // used to get the list of menu items from snapshot
    var passengerItem = _getAchievementFromSnapshot(snapshot);

    achievementController.add(passengerItem);
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

  Future<RideList> getRide() {
    print("get ride is called from the start");
    return _db
        .collection('Offer Ride list')
        .document()
        .get()
        .then((snap) => RideList.fromMap(snap.data));
  }
}
