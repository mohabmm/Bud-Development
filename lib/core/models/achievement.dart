class Achievement {
  bool firstRideAsDriver;
  bool firstRidesAsGuest;
  bool thirdRideAsDriver;
  bool thirdRideAsGuest;
  bool fifthRideAsDriver;
  bool fifthRideAsGuest;
  bool tenRidesAsDriver;
  bool tenRidesAsGuest;
  bool twentyRideAsDriver;
  bool twentyRideAsGuest;
  bool thirtyRideAsDriver;
  bool thirtyRideAsGuest;
  bool fortyRideAsDriver;
  bool fortyRideAsGuest;
  bool fiftyRideAsDriver;
  bool fiftyRideAsGuest;
  bool sixtyRideAsDriver;
  bool sixtyRideAsGuest;
  bool seventyRideAsDriver;
  bool seventyRideAsGuest;
  bool eightyRideAsDriver;
  bool eightyRideAsGuest;
  bool ninetyRideAsDriver;
  bool ninetyRideAsGuest;
  bool hundredRideAsDriver;
  bool hundredRideAsGuest;
  String email;

  Achievement(
      {this.firstRideAsDriver,
      this.firstRidesAsGuest,
      this.thirdRideAsDriver,
      this.thirdRideAsGuest,
      this.fifthRideAsDriver,
      this.fifthRideAsGuest,
      this.tenRidesAsDriver,
      this.tenRidesAsGuest,
      this.twentyRideAsDriver,
      this.twentyRideAsGuest,
      this.thirtyRideAsDriver,
      this.thirtyRideAsGuest,
      this.fortyRideAsDriver,
      this.fortyRideAsGuest,
      this.fiftyRideAsGuest,
      this.fiftyRideAsDriver,
      this.sixtyRideAsDriver,
      this.sixtyRideAsGuest,
      this.seventyRideAsDriver,
      this.seventyRideAsGuest,
      this.eightyRideAsDriver,
      this.eightyRideAsGuest,
      this.ninetyRideAsDriver,
      this.ninetyRideAsGuest,
      this.hundredRideAsDriver,
      this.hundredRideAsGuest,
      this.email});

  Achievement.fromSnapshot(Map<String, dynamic> data)
      : firstRideAsDriver = data['first ride as driver'] ?? false,
        firstRidesAsGuest = data['first ride as guest'] ?? false,
        thirdRideAsDriver = data['third ride as driver'] ?? false,
        thirdRideAsGuest = data['third ride as guest'] ?? false,
        fifthRideAsDriver = data['fifth ride as driver'] ?? false,
        fifthRideAsGuest = data['fifth ride as guest'] ?? false,
        tenRidesAsDriver = data['10 ride as driver'] ?? false,
        tenRidesAsGuest = data['10 ride as guest'] ?? false,
        twentyRideAsDriver = data['20 ride as driver'] ?? false,
        twentyRideAsGuest = data['20 ride as guest'] ?? false,
        thirtyRideAsDriver = data['30 ride as driver'] ?? false,
        thirtyRideAsGuest = data['30 ride as guest'] ?? false,
        fortyRideAsDriver = data['40 ride as driver'] ?? false,
        fortyRideAsGuest = data['40 ride as guest'] ?? false,
        fiftyRideAsDriver = data['50 ride as driver'] ?? false,
        fiftyRideAsGuest = data['50 ride as guest'] ?? false,
        sixtyRideAsDriver = data['60 ride as driver'] ?? false,
        sixtyRideAsGuest = data['60 ride as guest'] ?? false,
        seventyRideAsDriver = data['70 ride as driver'] ?? false,
        seventyRideAsGuest = data['70 ride as guest'] ?? false,
        eightyRideAsDriver = data['80 ride as driver'] ?? false,
        eightyRideAsGuest = data['80 ride as guest'] ?? false,
        ninetyRideAsDriver = data['90 ride as driver'] ?? false,
        ninetyRideAsGuest = data['90 ride as guest'] ?? false,
        hundredRideAsDriver = data['100 ride as driver'] ?? false,
        hundredRideAsGuest = data['100 ride as guest'] ?? false,
        email = data['email'] ?? "null email";
}
