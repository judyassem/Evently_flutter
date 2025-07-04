import 'package:evently/model/eventDM.dart';

class UserDm{
  static final collectionName = "users";
  static UserDm? currentUser;
  late String id;
  late String email;
  late String name;
  late List<String> favoriteEvents;

  UserDm({
    required this.id,
    required this.email,
    required this.name,
    this.favoriteEvents = const [],
  });


  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "email": email,
      "name": name,
      "favoriteEvents": favoriteEvents,
    };
  }

  UserDm.fromJson(Map<String, dynamic> json){
    id = json["id"];
    email = json["email"];
    name = json["name"];
    List<dynamic> favorites = json["favoriteEvents"];
    favoriteEvents = favorites.map((id) => id.toString()).toList();
  }
}