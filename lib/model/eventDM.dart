import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/model/categoryDM.dart';

class EventDM {
  static final collectionName = "events";
  late String id;
  late String name;
  late DateTime date;
  late String ownerId;
  late int? lat;
  late int? lng;
  late CategoryDM category;
  late String description;
  late List<String>? usersIds;

  EventDM({
    this.id = "",
    required this.name,
    required this.date,
    required this.ownerId,
    this.lat,
    this.lng,
    required this.category,
    required this.description,
    this.usersIds,
  });

  EventDM.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    name = json['name'];
    Timestamp time = json['date'];
    date = time.toDate();
    ownerId = json['ownerId'];
    lat = json['lat'];
    lng = json['lng'];
    category = CategoryDM.getCategoryByName(json['category']);
    description = json['description'];
    List<dynamic>? users = json['usersIds'];
    usersIds = users?.map((id) => id.toString()).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'date': date,
      'ownerId': ownerId,
      'lat': lat,
      'lng': lng,
      'category': category.name,
      'description': description,
      'usersIds': usersIds,
    };
  }
}
