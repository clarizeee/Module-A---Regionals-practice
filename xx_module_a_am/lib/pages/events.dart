import 'package:flutter/material.dart';
import 'package:xx_module_a_am/handlers.dart';
import 'package:xx_module_a_am/widgets.dart';
import 'package:xx_module_a_am/models.dart';
import 'package:provider/provider.dart';
class events extends StatefulWidget {
  const events({super.key});

  @override
  State<events> createState() => _eventState();
}

class _eventState extends State<events> {
  String selectedCategory = "All";
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ProviderClass>().getEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List eventList = context.watch<ProviderClass>().events;

    

    final categories = {
      "All": eventList,
      "Unread": eventList.where((e) => e.viewCount == 0).toList(),
      "Read": eventList.where((e) => e.viewCount > 0).toList(),
    };

    final filteredList = categories[selectedCategory] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Events List"),),
      ),
      body: Column(
    children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories.keys.map((category) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(category),
                    selected: selectedCategory == category,
                    onSelected: (selected) {
                      setState(() {
                        selectedCategory = category;
                        print(selectedCategory);
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),
    SizedBox(height: 10,),
    SizedBox(
      width: width,
      height: height * 0.7,
      child: ListView.builder(
        itemCount: filteredList.length,
        itemBuilder: (context, index) => eventItem(event: filteredList[index])),
    )
    ],
      )
    );
  }
}