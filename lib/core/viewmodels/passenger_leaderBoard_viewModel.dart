import 'dart:async';
import 'package:budupdated/core/enums/viewstate.dart';
import 'package:budupdated/core/models/user.dart';
import 'package:budupdated/core/services/firebase_service.dart';
import '../../service_locator.dart';
import 'base_model.dart';

class PassengerLeaderBoardViewModel extends BaseModel {
  FirebaseService _fireBaseService = locator<FirebaseService>();
  List<User> passengerData;
  StreamSubscription passengerLeaderBoardSubscription;

  PassengerLeaderBoardViewModel() {
    _fireBaseService.getLeaderBoardPassenger();

    passengerLeaderBoardSubscription = _fireBaseService
        .leaderBoardPassengerItemsStream
        .listen(_passengerOnLeaderBoardUpdated);
  }

  @override
  void dispose() {
    print("dispose function is called");
    try {
      passengerLeaderBoardSubscription.cancel();
      print("dispose function is called after cancel is called");
    } catch (exception, stackTrace) {
      print("the exception is " + exception.toString());
    } finally {
      super.dispose();
    }
  }

  void _passengerOnLeaderBoardUpdated(List<User> passengersListData) {
    passengerData = passengersListData; // Set the stats for the UI

    if (passengerData == null) {
      setState(ViewState.Error); // If null indicate we're still fetching
    } else if (passengerData.length == null || passengerData.length == 0) {
      setState(ViewState.NoDataAvailable);
    } else if (passengersListData.length == 0) {
      setState(ViewState.Error);
    } else {
      setState(ViewState.DataFetched);
    }
  }
}
