import 'package:budupdated/core/enums/viewstate.dart';
import 'package:budupdated/core/viewmodels/driver_leaderBoard_viewModel.dart';
import 'package:budupdated/core/viewmodels/passenger_leaderBoard_viewModel.dart';
import 'package:budupdated/ui/views/passenger_leaderboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'base_widget.dart';
import 'driver_leaderboard.dart';

class LeaderBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
            DriverLeaderBoard(),
            PassengerLeaderBoard(),
          ]),
        ),
      ),
    );
  }
}
