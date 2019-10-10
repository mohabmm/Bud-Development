import 'dart:async';
import 'package:budupdated/core/enums/viewstate.dart';
import 'package:budupdated/core/models/user.dart';
import 'package:budupdated/core/services/firebase_service.dart';
import '../../service_locator.dart';
import 'base_model.dart';

class DriverLeaderBoardViewModel extends BaseModel {
  FirebaseService _firebaseService = locator<FirebaseService>();
  List<User> users;

  StreamSubscription LeaderBoardSubscription;

  DriverLeaderBoardViewModel() {
    LeaderBoardSubscription =
        _firebaseService.menuItems.listen(_onStatsUpdateds);
  }

  @override
  void dispose() {
    print("dispose function is called");
    try {
      LeaderBoardSubscription.cancel();
      print("dispose function is called after cancel is called");
    } catch (exception, stackTrace) {
      print("the exception is " + exception.toString());
    } finally {
      super.dispose();
    }
  }

  void _onStatsUpdateds(List<User> usersData) {
    users = usersData; // Set the stats for the UI

    if (users == null) {
      setState(ViewState.Error); // If null indicate we're still fetching
    } else if (users.length == null || users.length == 0) {
      setState(ViewState.NoDataAvailable);
    } else if (usersData.length == 0) {
      setState(ViewState.Error);
    } else {
      setState(ViewState.DataFetched);
    }
  }
}
