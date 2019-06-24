import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService {
  Serachto(String searchFieldFrom) {
    return Firestore.instance
        .collection('Offer Ride list')
        .where('SearchTo',
            // start at o and end at 1-1
            // 3lshan ageb awl klma
//        https://beginnersbook.com/2013/12/java-string-substring-method-example/
            isEqualTo: searchFieldFrom.substring(0, 1).toUpperCase())
        .getDocuments();
  }

  Serachfrom(String searchFieldFrom) {
    return Firestore.instance
        .collection('Offer Ride list')
        .where('SearchFrom',
            isEqualTo: searchFieldFrom.substring(0, 1).toUpperCase())
        .getDocuments();
  }
}
