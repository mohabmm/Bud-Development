import 'dart:async';
import 'package:budupdated/core/enums/viewstate.dart';
import 'package:budupdated/core/models/achievement.dart';
import 'package:budupdated/core/models/user.dart';
import 'package:budupdated/core/services/firebase_service.dart';
import '../../service_locator.dart';
import 'base_model.dart';

class AchievementViewModel extends BaseModel {
  var user;
  FirebaseService _fireBaseService = locator<FirebaseService>();
  List<Achievement> achievementData;
  StreamSubscription achievementSubscription;

  AchievementViewModel({this.user}) {
    _fireBaseService.getAchievement(user);

    achievementSubscription =
        _fireBaseService.achievementStream.listen(_achievementUpdated);
  }

  @override
  void dispose() {
    print("dispose function is called");
    try {
      achievementSubscription.cancel();
      print("dispose function is called after cancel is called");
    } catch (exception) {
      print("the exception is " + exception.toString());
    } finally {
      super.dispose();
    }
  }

  void _achievementUpdated(List<Achievement> achievementListData) {
    achievementData = achievementListData; // Set the stats for the UI

    if (achievementData == null) {
      setState(ViewState.Error); // If null indicate we're still fetching
    } else if (achievementData.length == null || achievementData.length == 0) {
      setState(ViewState.NoDataAvailable);
    } else if (achievementData.length == 0) {
      setState(ViewState.Error);
    } else {
      setState(ViewState.DataFetched);
    }
  }
}
