import 'package:evently/core/context_extition.dart';
import 'package:evently/model/categoryDM.dart';
import 'package:flutter/material.dart';

class CategoriesTab extends StatefulWidget {
  final List<CategoryDM> categories;
  final Function(CategoryDM) onCategoryClicked;

  const CategoriesTab({
    super.key,
    required this.categories,
    required this.onCategoryClicked,
  });

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  late CategoryDM selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.categories[0];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.categories.length,
      child: TabBar(
        dividerColor: Colors.transparent,
        tabs: widget.categories.map(DmToWidget).toList(),
        isScrollable: true,
        indicatorColor: Colors.transparent,
        onTap: (index) {
          setState(() {
            selectedCategory = widget.categories[index];
            widget.onCategoryClicked(selectedCategory);
          });
        },
        tabAlignment: TabAlignment.start,
      ),
    );
  }

  Widget DmToWidget(CategoryDM model) {
    var isSelected = model == selectedCategory;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: isSelected ? context.theme.primaryColor: context.theme.colorScheme.secondary,
      ),
      child: Row(
        children: [
          Icon(model.icon, color: isSelected? context.theme.colorScheme.secondary: context.theme.primaryColor,),
          SizedBox(width: 8),
          Text(model.name, style: TextStyle(color: isSelected? context.theme.colorScheme.secondary: context.theme.primaryColor),)],
      ),
    );
  }
}
