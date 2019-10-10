import 'package:budupdated/core/services/firebase_service.dart';
import 'package:budupdated/core/viewmodels/driver_leaderBoard_viewModel.dart';
import 'package:get_it/get_it.dart';

import 'core/services/scaffold_service.dart';
import 'core/viewmodels/authntication_model.dart';
import 'core/viewmodels/passenger_leaderBoard_viewModel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => FirebaseService());
  locator.registerSingleton(ScaffoldService());
  locator.registerFactory<DriverLeaderBoardViewModel>(
      () => DriverLeaderBoardViewModel());
  locator.registerFactory<PassengerLeaderBoardViewModel>(
      () => PassengerLeaderBoardViewModel());

//  locator.registerSingleton(DriverLeaderBoardViewModel());
//  locator.registerSingleton(PassengerLeaderBoardViewModel());
  locator.registerSingleton(AuthServiceModel());
}
