class RideList {
  String carColor;
  String carNumber;
  String carType;
  String from;
  String guestUser;
  int numberOfSeats;
  String rideOwner;
  bool rideFinished;
  int rideId;
  bool rideStatus;
  String searchFrom;
  String searchTo;
  String telephone;
  String to;
  String tripDate;
  String userName;
  String description;
  String userImage;

  RideList({
    this.carColor,
    this.carNumber,
    this.carType,
    this.from,
    this.guestUser,
    this.numberOfSeats,
    this.rideOwner,
    this.rideFinished,
    this.rideId,
    this.rideStatus,
    this.searchFrom,
    this.searchTo,
    this.telephone,
    this.to,
    this.tripDate,
    this.userName,
    this.description,
    this.userImage,
  });

  factory RideList.fromMap(Map data) {
    return RideList(
      carColor: data['CarColor'] ?? 'null color',
      carNumber: data['CarNumber'] ?? '',
      carType: data['CarType'] ?? '',
      from: data['From'] ?? 'from',
      guestUser: data['GusestUser'],
      numberOfSeats: data['No Of Seats'] ?? 0,
      rideOwner: data['Ride Owner'],
      rideFinished: data['RideFinished'] ?? false,
      rideId: data['RideId'] ?? 12121,
      rideStatus: data['RideStatus'] ?? false,
      searchFrom: data['SearchFrom'] ?? '',
      searchTo: data['SearchTo'] ?? '',
      telephone: data['Telephone'] ?? '',
      to: data['To'] ?? '',
      tripDate: data['Trip Date'] ?? '',
      userName: data['User name'] ?? '',
      description: data['describtion'] ?? '',
      userImage: data['userimage'] ?? '',
    );
  }
}
