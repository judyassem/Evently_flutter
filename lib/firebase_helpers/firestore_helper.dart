import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/model/userDm.dart';
import 'package:firebase_core/firebase_core.dart';

import '../model/eventDM.dart';

Future<void> addUserToFirestore(UserDm user) async {
  var usersCollectionRef = FirebaseFirestore.instance.collection(
    UserDm.collectionName,
  );
  usersCollectionRef.doc(user.id).set(user.toJson());
}

Future<UserDm> getUserFromFirestore(String id) async {
  var usersCollectionRef = FirebaseFirestore.instance.collection(
    UserDm.collectionName,
  );
  var userDoc = usersCollectionRef.doc(id);
  var userDocSnapshot = await userDoc.get();
  var json = userDocSnapshot.data();
  return UserDm.fromJson(json!);
}

CollectionReference<EventDM> getEventCollectionRef() => FirebaseFirestore
    .instance
    .collection(EventDM.collectionName)
    .withConverter(
      fromFirestore: (docSnapshot, _) => EventDM.fromJson(docSnapshot.data()!),
      toFirestore: (event, _) {
        return event.toJson();
      },
    );

Future<void> addEventToFirestore(EventDM event) async {
  var eventsCollectionRef = getEventCollectionRef();
  var emptyDoc = eventsCollectionRef.doc();
  event.id = emptyDoc.id;
  emptyDoc.set(event);
}

Stream<List<EventDM>> getEventFromFirestore() {
  var eventCollectionRef = getEventCollectionRef();
  var snapShot = eventCollectionRef.snapshots();
  return snapShot.map((querySnapshot) {
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  });
}

Future<void> addEventToFavorites(EventDM event) async {
  var eventsCollectionRef = getEventCollectionRef();
  var eventDoc = eventsCollectionRef.doc(event.id);
  eventDoc.update({
    'usersIds': FieldValue.arrayUnion([UserDm.currentUser!.id]),
  });

  var usersCollectionRef = FirebaseFirestore.instance.collection(
    UserDm.collectionName,
  );
  var userDoc = usersCollectionRef.doc(UserDm.currentUser!.id);
  userDoc.update({
    'favEventsIds': FieldValue.arrayUnion([event.id]),
  });
}

Future<void> removeEventFromFavorites(EventDM event) async {
  var eventsCollectionRef = getEventCollectionRef();
  var eventDoc = eventsCollectionRef.doc(event.id);
  eventDoc.update({
    'usersIds': FieldValue.arrayRemove([UserDm.currentUser!.id]),
  });

  var usersCollectionRef = FirebaseFirestore.instance.collection(
    UserDm.collectionName,
  );
  var userDoc = usersCollectionRef.doc(UserDm.currentUser!.id);
  userDoc.update({
    'favEventsIds': FieldValue.arrayRemove([event.id]),
  });
}


Stream<List<EventDM>> getFavoriteFromFirestore() {
  var eventCollectionRef = getEventCollectionRef();
  var snapShot = eventCollectionRef.
  where("usersIds",arrayContains: UserDm.currentUser!.id ).
  snapshots();
  
  return snapShot.map((querySnapshot) {
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  });
}

///Future<void> updateEventToFirestore(EventDM event) async{}
