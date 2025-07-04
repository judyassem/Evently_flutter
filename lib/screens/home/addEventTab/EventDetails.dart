import 'package:evently/common/custom_elevated_button.dart';
import 'package:evently/common/custom_input_field.dart';
import 'package:evently/core/app_assets.dart';
import 'package:evently/core/app_colors.dart';
import 'package:evently/core/app_routes.dart';
import 'package:evently/core/context_extition.dart';
import 'package:evently/core/dialog_utils.dart';
import 'package:evently/firebase_helpers/firestore_helper.dart';
import 'package:evently/model/eventDM.dart';
import 'package:evently/model/userDm.dart';
import 'package:evently/widgets/categories_tab.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../model/categoryDM.dart';
import '../mapTab/location_picker.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({super.key});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  CategoryDM selectedCategory = CategoryDM.categories[0];
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  late int selectedLng;
  late int selectedLat;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCategoriesImage(),
              SizedBox(height: 8),
              buildCategoriesList(),
              SizedBox(height: 8),
              Text(context.locale.title),
              buildTitleField(),
              SizedBox(height: 8),
              Text(context.locale.description),
              buildDescriptionField(),
              SizedBox(height: 8),
              buildEventTime(),
              SizedBox(height: 8),
              buildEventDate(),
              SizedBox(height: 16),
              buildLocationButton(),
              SizedBox(height: 8),
              buildAddEventButton(),
            ],
          ),
        ),
      ),
    );
  }

  buildAppBar() =>
      AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: AppColors.blue),
        ),
        centerTitle: true,
        title: Text(
          context.locale.createEvent,
          style: context.theme.textTheme.displaySmall,
        ),
        //backgroundColor: AppColors.pureWhite,
      );

  buildCategoriesImage() =>
      Container(
        margin: EdgeInsets.symmetric(vertical: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(selectedCategory.image),
        ),
      );

  buildCategoriesList() =>
      CategoriesTab(
        categories: CategoryDM.categories,
        onCategoryClicked: (newCategory) {
          setState(() {
            selectedCategory = newCategory;
          });
        },
      );

  buildTitleField() =>
      CustomInputField(
        //label: context.locale.title,
        prefixIcon: Icon(Icons.edit),
        controller: titleController,
        hintText: context.locale.title,
      );

  buildDescriptionField() =>
      CustomInputField(
        //label: context.locale.description,
        controller: descriptionController,
        hintText: context.locale.description,
      );

  buildEventTime() =>
      Row(
        children: [
          Icon(Icons.access_time),
          Text(selectedTime.format(context), style: TextStyle(fontSize: 18),),
          Spacer(),
          InkWell(
            onTap: () async {
              selectedTime =
                  await showTimePicker(
                    context: context,
                    initialTime: selectedTime,
                  ) ??
                      selectedTime;
            },
            child: Text(
              context.locale.chooseTime,
              style: TextStyle(color: context.theme.primaryColor, fontSize: 18),
            ),
          ),
        ],
      );

  buildEventDate() =>
      Row(
        children: [
          Icon(Icons.calendar_month),
          Text(
            "${selectedDate.day}/ ${selectedDate.month}/ ${selectedDate.year}",
            style: TextStyle(fontSize: 18),),
          Spacer(),
          InkWell(
            onTap: () async {
              selectedDate =
                  await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 365)),
                    initialDate: selectedDate,
                  ) ??
                      selectedDate;

              setState(() {});
            },
            child: Text(
              context.locale.chooseDate,
              style: TextStyle(color: context.theme.primaryColor, fontSize: 18),
            ),
          ),
        ],
      );

  buildLocationButton() =>
      CustomElevatedButton(
        text: "${selectedLat}, ${selectedLng}",
        foregroundColor: context.theme.primaryColor,
        backgroundColor: Colors.transparent,
        icon: Icon(Icons.location_on,),
        elevation: 0,
        onClick: () async {
          LatLng? result = await Navigator.push(
            context,
            AppRoutes.locationPicker,
          );

          if (result != null) {
            setState(() {
              selectedLat = result.latitude.toInt();
              selectedLng = result.longitude.toInt();
            });
          }
        },

      );

  buildAddEventButton() =>
      CustomElevatedButton(
          text: context.locale.addEvent,
          onClick: () async {
            EventDM event = EventDM(name: titleController.text,
                date: selectedDate.copyWith(
                    hour: selectedTime.hour,
                    minute: selectedTime.minute),
                lat: selectedLat,
                lng: selectedLng,
                ownerId: UserDm.currentUser!.id,
                category: selectedCategory,
                description: descriptionController.text
            );
            showLoading(context);
            await addEventToFirestore(event);
            hideLoading(context);
            Navigator.pop(context);
          });
}
