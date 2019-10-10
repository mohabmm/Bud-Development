import 'package:budupdated/core/enums/viewstate.dart';
import 'package:budupdated/core/models/user.dart';
import 'package:budupdated/core/viewmodels/driver_leaderBoard_viewModel.dart';
import 'package:budupdated/core/viewmodels/passenger_leaderBoard_viewModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'base_widget.dart';

class LeaderBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<FirebaseUser>(context);

    return BaseWidget<DriverLeaderBoardViewModel>(
        model: DriverLeaderBoardViewModel(),
        builder: (
          context,
          model,
          child,
        ) =>
            MaterialApp(
              home: DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    bottom: TabBar(
                      tabs: [
                        Tab(text: "Heroes"),
                        Tab(text: "Buds"),
                      ],
                    ),
                    leading: new IconButton(
                      icon: new Icon(
                        Icons.arrow_back,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    centerTitle: true,
                    title: Text('LeaderBoard'),
                  ),
                  body: TabBarView(children: [
                    _getBodyUiDriver(context, model),
//            new Text("a7a"),
                    BaseWidget<PassengerLeaderBoardViewModel>(
                        onModelReady: (model) => model.getPassengerData(),
                        builder: (
                          context,
                          model,
                          child,
                        ) =>
                            _getBodyUiPassenger(context, model))
                  ]),
                ),
              ),
            ));
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

  Widget _getBodyUiDriver(
      BuildContext context, DriverLeaderBoardViewModel model) {
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

  Widget _getBodyUiPassenger(
      BuildContext context, PassengerLeaderBoardViewModel model) {
    switch (model.state) {
      case ViewState.Busy:
        return _getLoadingUi(context);
      case ViewState.NoDataAvailable:
        return _noDataUi(context);
      case ViewState.Error:
        return _errorUi(context);
      case ViewState.DataFetched:
      default:
        return _getListUiPassenger(model);
    }
  }

  Widget _getListUiDriver(DriverLeaderBoardViewModel model) {
    return new ListView.builder(
        itemExtent: 220.0,
        itemCount: model.users.length,
        itemBuilder: (BuildContext context, int index) {
          String name = model.users[index].firstName;
          int numberofridesdriver = model.users[index].numberOfRidesAsDriver;
          String co2driver = model.users[index].co2Driver;
          String driverrate = model.users[index].driverRate;
          String image = model.users[index].photoUrl;
          return SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                        child: Material(
                            color: Colors.white,
                            elevation: 14.0,
                            borderRadius: BorderRadius.circular(18.0),
                            shadowColor: Color(0x802196F3),
                            child: ListTile(
                                title: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              new Container(
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: new BoxDecoration(
                                                  color:
                                                      const Color(0xff7c94b6),
                                                  image: new DecorationImage(
                                                    image:
                                                        new NetworkImage(image),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  borderRadius:
                                                      new BorderRadius.all(
                                                          new Radius.circular(
                                                              50.0)),
                                                  border: new Border.all(
                                                    color: Colors.white,
                                                    width: 4.0,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: new Text(driverrate),
                                              ),
                                            ],
                                          ),
                                          Column(children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 30.0, left: 7.0),
                                              child: Center(
                                                child: new Text(
                                                  name,
                                                  style: new TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 23.0,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Center(
                                                child: new Text(
                                                    numberofridesdriver
                                                            .toString() +
                                                        " " +
                                                        "rides ")),
                                            Center(
                                              child: new Text(co2driver +
                                                  " " +
                                                  "KG C02 saved "),
                                            ),
                                          ])
                                        ]))))))
              ]));
        });
  }

  Widget _getListUiPassenger(PassengerLeaderBoardViewModel model) {
    return new ListView.builder(
        itemExtent: 220.0,
        itemCount: model.users.length,
        itemBuilder: (BuildContext context, int index) {
          String name = model.users[index].firstName;
          int numberofridesPassenger = model.users[index].numberOfRidesAsGuest;
          String co2Passenger = model.users[index].co2Passenger;
          String passengerRate = model.users[index].passengerRate;
          String image = model.users[index].photoUrl;
          return SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                        child: Material(
                            color: Colors.white,
                            elevation: 14.0,
                            borderRadius: BorderRadius.circular(18.0),
                            shadowColor: Color(0x802196F3),
                            child: ListTile(
                                title: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              new Container(
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: new BoxDecoration(
                                                  color:
                                                      const Color(0xff7c94b6),
                                                  image: new DecorationImage(
                                                    image:
                                                        new NetworkImage(image),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  borderRadius:
                                                      new BorderRadius.all(
                                                          new Radius.circular(
                                                              50.0)),
                                                  border: new Border.all(
                                                    color: Colors.white,
                                                    width: 4.0,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: new Text(passengerRate),
                                              ),
                                            ],
                                          ),
                                          Column(children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 30.0, left: 7.0),
                                              child: Center(
                                                child: new Text(
                                                  name,
                                                  style: new TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 23.0,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Center(
                                                child: new Text(
                                                    numberofridesPassenger
                                                            .toString() +
                                                        " " +
                                                        "rides ")),
                                            Center(
                                              child: new Text(co2Passenger +
                                                  " " +
                                                  "KG C02 saved "),
                                            ),
                                          ])
                                        ]))))))
              ]));
        });
  }
}
