import 'package:evently/core/context_extition.dart';
import 'package:evently/screens/home/addEventTab/EventDetails.dart';
import 'package:flutter/material.dart';

import '../../../core/app_routes.dart';
import '../favTab/fav_tab.dart';
import '../mapTab/map_tab.dart';
import '../profileTab/profile_tab.dart';
import 'home_tab.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> tabs = [HomeTab(), MapTab(),FavTab(), ProfileTab()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          //appBar: buildAppBar(),
          floatingActionButton: buildFAB(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: buildBNB(),
          body: tabs[currentIndex],
    ));
  }

  //buildAppBar() {}

  FloatingActionButton buildFAB() {
    return FloatingActionButton(
      onPressed: (){
        setState(() {
          Navigator.push(context, AppRoutes.addEvent);
        });
      },
      backgroundColor: context.primaryColor,
      shape: CircleBorder(side: BorderSide(color: context.secondaryColor, width: 3)),
      child: Icon(Icons.add, color: context.secondaryColor, size: 30,),
    );
  }

  buildBNB() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: context.primaryColor,
      selectedItemColor: context.secondaryColor,
      unselectedItemColor: context.secondaryColor,
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(
                currentIndex == 0 ? Icons.home : Icons.home_outlined),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(currentIndex == 1
                ? Icons.location_on
                : Icons.location_on_outlined),
            label: 'Map'),
        BottomNavigationBarItem(
            icon: Icon(currentIndex == 2
                ? Icons.favorite
                : Icons.favorite_border),
            label: 'Love'),
        BottomNavigationBarItem(
            icon: Icon(
                currentIndex == 3 ? Icons.person : Icons.person_outline),
            label: 'Profile'),
      ],
    );
  }
  // Widget _buildTabItem(IconData icon, String label, int index) {
  //   bool isSelected = index == currentIndex;
  //
  //   return MaterialButton(
  //   onPressed: () {
  //     setState(() {
  //       currentIndex = index;
  //     });
  //   },
  //   minWidth: 40,
  //   child: Column(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       Icon(icon, color: Colors.white),
  //       Text(label, style: TextStyle(color: Colors.white, fontSize: 12)),
  //     ],
  //   ),
  // );}

}


