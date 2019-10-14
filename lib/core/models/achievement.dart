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
      : firstRideAsDriver = data['firstRideAsDriver'] ?? false,
        firstRidesAsGuest = data['firstRidesAsGuest'] ?? false,
        thirdRideAsDriver = data['thirdRideAsDriver'] ?? false,
        thirdRideAsGuest = data['thirdRideAsGuest'] ?? false,
        fifthRideAsDriver = data['fifthRideAsGuest'] ?? false,
        fifthRideAsGuest = data['fifthRideAsGuest'] ?? false,
        tenRidesAsDriver = data['tenRidesAsDriver'] ?? false,
        tenRidesAsGuest = data['tenRidesAsGuest'] ?? false,
        twentyRideAsDriver = data['twentyRideAsDriver'] ?? false,
        twentyRideAsGuest = data['twentyRideAsGuest'] ?? false,
        thirtyRideAsDriver = data['thirtyRideAsDriver'] ?? false,
        thirtyRideAsGuest = data['thirtyRideAsGuest'] ?? false,
        fortyRideAsDriver = data['fortyRideAsDriver'] ?? false,
        fortyRideAsGuest = data['fortyRideAsGuest'] ?? false,
        fiftyRideAsDriver = data['fiftyRideAsDriver'] ?? false,
        fiftyRideAsGuest = data['fiftyRideAsGuest'] ?? false,
        sixtyRideAsDriver = data['sixtyRideAsDriver'] ?? false,
        sixtyRideAsGuest = data['sixtyRideAsGuest'] ?? false,
        seventyRideAsDriver = data['seventyRideAsDriver'] ?? false,
        seventyRideAsGuest = data['seventyRideAsDriver'] ?? false,
        eightyRideAsDriver = data['eightyRideAsDriver'] ?? false,
        eightyRideAsGuest = data['eightyRideAsGuest'] ?? false,
        ninetyRideAsDriver = data['ninetyRideAsDriver'] ?? false,
        ninetyRideAsGuest = data['ninetyRideAsGuest'] ?? false,
        hundredRideAsDriver = data['hundredRideAsDriver'] ?? false,
        hundredRideAsGuest = data['hundredRideAsGuest'] ?? false,
        email = data['email'] ?? "null email";
}
