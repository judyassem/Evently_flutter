import 'package:evently/core/app_assets.dart';
import 'package:evently/core/context_extition.dart';
import 'package:evently/firebase_helpers/firestore_helper.dart';
import 'package:evently/model/eventDM.dart';
import 'package:evently/model/userDm.dart';
import 'package:evently/widgets/categories_tab.dart';
import 'package:flutter/material.dart';

import '../../../model/categoryDM.dart';
import '../../../widgets/eventWidget.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  CategoryDM selectedCategory = CategoryDM.allCategories[0];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          buildAppBar(),
          buildEventListView(),
        ],
      ),
    );
  }

  buildAppBar() {
    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      decoration:  BoxDecoration(
        color: context.primaryColor,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
      ),
      child: Column(
        children: [
          Row(
              children: [
                buildWelcomeText(context),
                Spacer(),
                InkWell(child: Icon(Icons.sunny,color: context.secondaryColor,),onTap: (){},),
                SizedBox(width: 10,),
                InkWell(child: Icon(Icons.language,color: context.secondaryColor,),onTap: (){},),
              ],
          ),
          CategoriesTab(
            categories: CategoryDM.allCategories,
            onCategoryClicked: (newCategory){
              setState(() {
                selectedCategory = newCategory;
              });
            },)
        ],
      ),
    );
  }

  Widget buildEventListView() {
    return Expanded(
      child: StreamBuilder(
        stream: getEventFromFirestore(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }
          else if(snapshot.hasData){
            List<EventDM> events = snapshot.data!;
            if(selectedCategory != CategoryDM.allCategories[0]){
              events = events.where((event)
              => event.category.name == selectedCategory.name)
                  .toList();}

            return ListView.builder(
              itemBuilder:
                  (context, index) => Eventwidget(
                event: events[index],),
               itemCount: events.length,
            );
          }
          else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  buildWelcomeText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Welcome Back", style: TextStyle(color: context.secondaryColor),),
          Text(UserDm.currentUser!.name,style: TextStyle(color: context.secondaryColor, fontSize: 24, fontWeight: FontWeight.bold)),
          buildLocationText(),
        ],
      ),
    );
  }

  buildLocationText() {
    return Row(
      children: [
        Icon(Icons.location_on_outlined, color: context.secondaryColor,),
        Text("Cairo, Egypt", style: TextStyle(color: context.secondaryColor),),
      ],
    );
  }
}
