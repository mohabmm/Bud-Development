import 'package:budupdated/core/enums/viewstate.dart';
import 'package:budupdated/core/viewmodels/achievement_viewModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'base_widget.dart';

class DriverAchievement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<FirebaseUser>(context);

    return BaseWidget<AchievementViewModel>(
        model: AchievementViewModel(user: user),
        builder: (
          context,
          model,
          child,
        ) =>
            Scaffold(body: _getBodyUi(context, model)));
  }

  Widget _getListUiDriver(AchievementViewModel model) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: model.achievementData.length,
        itemBuilder: (BuildContext context, int index) {
          bool firstRideAsDriver =
              model.achievementData[index].firstRideAsDriver;

          return Row(
//              mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: [
                    new Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: new BoxDecoration(
                        color: const Color(0xff7c94b6),
                        image: (firstRideAsDriver == false)
                            ? new DecorationImage(
                                image: new NetworkImage(
                                    'https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
                                fit: BoxFit.cover,
                              )
                            : new DecorationImage(
                                image: new NetworkImage(
                                    'https://4.imimg.com/data4/EH/CI/MY-29481057/winner-trophy-cup-500x500.jpg'),
                                fit: BoxFit.cover,
                              ),
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(50.0)),
                        border: new Border.all(
                          color: Colors.white,
                          width: 4.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              new Text(
                "Reaches First  Ride as driver in The app",
//                overflow: TextOverflow.clip,
//                maxLines: 3,
//                overflow: TextOverflow.ellipsis,
//                softWrap: true,
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
//                  fontSize: 23.0,
                  color: Colors.black,
                ),
              ),
            ],
          );
        });
  }

  Widget _getLoadingUi(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
        Text('Fetching data ...')
      ],
    ));
  }

  Widget _noDataUi(BuildContext context) {
    return _getCenteredViewMessage(context, "No data available yet");
  }

  Widget _errorUi(
    BuildContext context,
  ) {
    return _getCenteredViewMessage(
        context, "Error retrieving your data. Tap to try again",
        error: true);
  }

  Widget _getCenteredViewMessage(BuildContext context, String message,
      {bool error = false}) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  message,
                  textAlign: TextAlign.center,
                ),
                error
                    ? Icon(
                        // WWrap in gesture detector and call you refresh future here
                        Icons.refresh,
                        color: Colors.white,
                        size: 45.0,
                      )
                    : Container()
              ],
            )));
  }

  Widget _getBodyUi(BuildContext context, AchievementViewModel model) {
    switch (model.state) {
      case ViewState.Busy:
        return _getLoadingUi(context);
      case ViewState.NoDataAvailable:
        return _noDataUi(context);
      case ViewState.Error:
        return _errorUi(context);
      case ViewState.DataFetched:
      default:
        return _getListUiDriver(model);
    }
  }
}
