import 'dart:async';
import 'package:budupdated/core/enums/viewstate.dart';
import 'package:budupdated/core/models/ride_list.dart';
import 'package:budupdated/core/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../service_locator.dart';
import 'base_model.dart';

class HomeViewModel extends BaseModel {
  FirebaseService _fireBaseService = locator<FirebaseService>();
  List<RideList> homeViewData;
  StreamSubscription homeViewSubscription;
  bool status;
  final user;

  HomeViewModel(this.user) {
    _fireBaseService.getLeaderBoardPassenger();

    homeViewSubscription = _fireBaseService.getRide().listen(_homeViewUpdated);
  }

  @override
  void dispose() {
    print("dispose function is called");
    try {
      homeViewSubscription.cancel();
      print("dispose function is called after cancel is called");
    } catch (exception) {
      print("the exception is " + exception.toString());
    } finally {
      super.dispose();
    }
  }

  void _homeViewUpdated(List<RideList> homeViewListData) {
    homeViewData = homeViewListData; // Set the stats for the UI

    if (homeViewData == null) {
      setState(ViewState.Error); // If null indicate we're still fetching
    } else if (homeViewData.length == null || homeViewData.length == 0) {
      setState(ViewState.NoDataAvailable);
    } else if (homeViewListData.length == 0) {
      setState(ViewState.Error);
    } else {
      setState(ViewState.DataFetched);
    }
  }

  Future checkFirstSeen() async {
    Firestore.instance
        .collection('users')
        .where("email", isEqualTo: user.email)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              if (doc["driverAuthnticated"] == true) {
                print("the current driver status is " +
                    doc["driverAuthnticated"].toString());

                status = true;
              } else {
                status = false;
              }
            }));
  }
}
