import 'dart:async';
import 'package:budupdated/core/enums/viewstate.dart';
import 'package:budupdated/core/models/user.dart';
import 'package:budupdated/core/services/firebase_service.dart';
import '../../service_locator.dart';
import 'base_model.dart';

class DriverLeaderBoardViewModel extends BaseModel {
  FirebaseService _fireBaseService = locator<FirebaseService>();
  List<User> driverData;

  StreamSubscription driverLeaderBoardSubscription;

  DriverLeaderBoardViewModel() {
    _fireBaseService.getLeaderBoardDriver();
    driverLeaderBoardSubscription = _fireBaseService
        .leaderBoardDriverItemsStream
        .listen(_driverOnLeaderBoardUpdated);
  }

  @override
  void dispose() {
    print("dispose function is called");
    try {
      driverLeaderBoardSubscription.cancel();
      print("dispose function is called after cancel is called");
    } catch (exception, stackTrace) {
      print("the exception is " + exception.toString());
    } finally {
      super.dispose();
    }
  }

  void _driverOnLeaderBoardUpdated(List<User> driversListData) {
    driverData = driversListData; // Set the stats for the UI

    if (driverData == null) {
      setState(ViewState.Error); // If null indicate we're still fetching
    } else if (driverData.length == null || driverData.length == 0) {
      setState(ViewState.NoDataAvailable);
    } else if (driversListData.length == 0) {
      setState(ViewState.Error);
    } else {
      setState(ViewState.DataFetched);
    }
  }
}
