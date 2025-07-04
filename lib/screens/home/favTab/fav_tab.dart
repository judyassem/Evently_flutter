import 'package:evently/core/context_extition.dart';
import 'package:evently/model/userDm.dart';
import 'package:flutter/material.dart';

import '../../../firebase_helpers/firestore_helper.dart';
import '../../../widgets/eventWidget.dart';

class FavTab extends StatefulWidget {
  const FavTab({super.key});

  @override
  State<FavTab> createState() => _FavTabState();
}

class _FavTabState extends State<FavTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: TextFormField(
            style: Theme.of(context).textTheme.bodyLarge,
            cursorColor: context.primaryColor,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: "search for Event",
              prefixIconColor: context.primaryColor,
              hintStyle: TextStyle(color: context.primaryColor),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: context.primaryColor, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: context.primaryColor),
              )
            ),
          ),
        ),
        buildFavEventsList(),
      ],
    ));
  }

  Widget buildFavEventsList() {
    return Expanded(
        child: StreamBuilder(
          stream: getFavoriteFromFirestore(),
          builder: (context, snapshot){
            if(snapshot.hasError){
              return Text(snapshot.error.toString());
            }
            else if(snapshot.hasData){
              List events = snapshot.data!;
              return ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    return Eventwidget(event: events[index]);
                  }
              );
            }
            else{
              return Center(child: CircularProgressIndicator());
            }
          },
        )
    );
  }
}
