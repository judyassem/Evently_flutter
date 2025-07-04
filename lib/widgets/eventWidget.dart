import 'package:evently/core/context_extition.dart';
import 'package:evently/firebase_helpers/firestore_helper.dart';
import 'package:evently/model/eventDM.dart';
import 'package:flutter/material.dart';

import '../model/userDm.dart';

class Eventwidget extends StatelessWidget{
  final EventDM event;
  const Eventwidget({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        buildEventImage(),
        buildEventDate(context),
        Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: context.secondaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildEventDescription(),
              buildFavIcon(context),
            ],
          ),
        )
      ],
    );
  }

  Positioned buildEventDate(BuildContext context) {
    return Positioned(
        top: 20,
        left: 20,
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: context.secondaryColor,
              borderRadius: BorderRadius.circular(8)
          ),
          child: Column(
            children: [
              Text(event.date.day.toString(), style: TextStyle(color: context.primaryColor, fontSize: 24, fontWeight: FontWeight.bold),),
              Text(event.date.month.toString(), style: TextStyle(color: context.primaryColor, fontSize: 24, fontWeight: FontWeight.bold),),
            ],
          )
        ),
        );
  }

  buildEventDescription() {
    return Text(event.description);
  }

  buildEventImage() {
    return Container(
      margin: EdgeInsets.all(8),
      width: double.infinity,
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          event.category.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  buildFavIcon(BuildContext context) {
    bool isFav = event.usersIds?.contains(UserDm.currentUser!.id) ?? false;
    return InkWell(
      onTap: (){
        if(isFav){
          removeEventFromFavorites(event);
        }else{
          addEventToFavorites(event);
        }
      },
      child: Icon(
        isFav? Icons.favorite :Icons.favorite_border,
        color: context.primaryColor,
      ),
    );
  }
}
