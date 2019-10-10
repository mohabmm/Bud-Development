class User {
  final String co2Driver;
  final String co2Passenger;
  final bool driverAuthenticated;
  final String firstName;
  final String lastName;
  final int numberOfRidesAsDriver;
  final int numberOfRidesAsGuest;
  final int distanceCoveredAsDriver;
  final int distanceCoveredAsPassenger;
  final String driverRate;
  final String email;
  final String passengerRate;
  final String photoUrl;
  final String uid;

  User({
    this.co2Driver,
    this.co2Passenger,
    this.driverAuthenticated,
    this.firstName,
    this.lastName,
    this.numberOfRidesAsDriver,
    this.numberOfRidesAsGuest,
    this.distanceCoveredAsDriver,
    this.distanceCoveredAsPassenger,
    this.driverRate,
    this.email,
    this.passengerRate,
    this.photoUrl,
    this.uid,
  });

  User.fromSnapshot(Map<String, dynamic> data)
      : co2Driver = data['CO2driver'] ?? '0',
        co2Passenger = data['CO2passenger'] ?? '0',
        driverAuthenticated = data['Driver authnticated'] ?? false,
        firstName = data['First Name '] ?? 'nullname',
        lastName = data['Last Name'] ?? 'nulllastname',
        numberOfRidesAsDriver = data['Number Of Rides As Driver'] ?? 0,
        numberOfRidesAsGuest = data['Number Of Rides As guest'] ?? 0,
        distanceCoveredAsDriver = data['distance covered as driver'] ?? 0,
        distanceCoveredAsPassenger = data['distance covered as passenger'] ?? 0,
        driverRate = data['driverrate'] ?? '0',
        email = data['email'] ?? "null email",
        passengerRate = data['passengerrate'] ?? '0',
        photoUrl = data['photo_url'] ?? "nullurl",
        uid = data['uid'] ?? '232323';
}
