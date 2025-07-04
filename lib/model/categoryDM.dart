import 'package:evently/core/app_assets.dart';
import 'package:flutter/material.dart';

class CategoryDM{
  String name;
  IconData icon;
  String image;

  CategoryDM({required this.name,required this.icon, required this.image});

  static CategoryDM allCat = CategoryDM(name: "All", icon: Icons.all_inclusive, image: "");
  static CategoryDM sport = CategoryDM(name: "Sport", icon: Icons.directions_bike, image: AppAssets.sports);
  static CategoryDM bookClub = CategoryDM(name: "bookClub", icon: Icons.menu_book_outlined, image: AppAssets.bookClub);
  static CategoryDM birthday = CategoryDM(name: "birthday", icon: Icons.cake_outlined, image: AppAssets.birthday);
  static CategoryDM exhibition = CategoryDM(name: "exhibition", icon: Icons.grass_outlined, image: AppAssets.exhibition);
  static CategoryDM gaming = CategoryDM(name: "gaming", icon: Icons.games_outlined, image: AppAssets.gaming);
  static CategoryDM holiday = CategoryDM(name: "holiday", icon: Icons.beach_access, image: AppAssets.holiday);
  static CategoryDM meeting = CategoryDM(name: "meeting", icon: Icons.laptop_mac, image: AppAssets.meeting);
  static CategoryDM eating = CategoryDM(name: "eating", icon: Icons.fastfood, image: AppAssets.eating);
  static CategoryDM workshop = CategoryDM(name: "workshop", icon: Icons.work, image: AppAssets.workshop);

  static final allCategories = [allCat, sport, bookClub, birthday, exhibition, gaming, holiday, meeting, eating, workshop];
  static final categories = [sport, bookClub, birthday, exhibition, gaming, holiday, meeting, eating, workshop];

  static CategoryDM getCategoryByName(String name){
    return categories.firstWhere((category) => category.name == name);
  }
}