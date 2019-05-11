import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService {
  searchByName(String searchFieldFrom,SerachFieldTo) {
    return Firestore.instance
        .collection('Offer Ride list')
        .where('SearchFrom',
            isEqualTo: searchFieldFrom.substring(0, 1).toUpperCase()).where('SearchTo',
        isEqualTo: SerachFieldTo.substring(0, 1).toUpperCase())
        .getDocuments();
  }
}
