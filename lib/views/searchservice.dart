import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService {
  Serachto(String searchFieldFrom) {
    return Firestore.instance
        .collection('Offer Ride list')
        .where('SearchTo',
            isEqualTo: searchFieldFrom.substring(0, 1).toUpperCase())
//        .where('SearchTo',
//        isEqualTo: SerachFieldTo.substring(0, 1).toUpperCase())
        .getDocuments();
  }

  Serachfrom(String searchFieldFrom) {
    return Firestore.instance
        .collection('Offer Ride list')
        .where('SearchFrom',
            isEqualTo: searchFieldFrom.substring(0, 1).toUpperCase())
//        .where('SearchTo',
//        isEqualTo: SerachFieldTo.substring(0, 1).toUpperCase())
        .getDocuments();
  }
}
