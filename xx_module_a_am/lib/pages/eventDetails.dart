import 'package:flutter/material.dart';
import 'package:xx_module_a_am/models.dart';
import 'package:xx_module_a_am/styles.dart';
import 'package:gallery_image_viewer/gallery_image_viewer.dart';
import 'package:xx_module_a_am/handlers.dart';
import 'package:provider/provider.dart';


class eventDetails extends StatefulWidget {
  final Event event;
  const eventDetails({super.key, required this.event});

  @override
  State<eventDetails> createState() => _eventDetailState();
}

//TODO: IMPLEMENT THE VIEW COUNT ADDITION

class _eventDetailState extends State<eventDetails> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ProviderClass>().addViewCount(widget.event);
    });
  }


  @override
  Widget build(BuildContext context) {
    final List<ImageProvider> images = widget.event.images.map((e)=> Image.asset(e).image).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Event details"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget.event.title, style: AppTextStyles.heading1,),
              Text("View count: ${widget.event.viewCount}", textAlign: TextAlign.center,),
              GalleryImageView(
                            listImage: images,
                            width: 200,
                            height: 200,
                            imageDecoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                            ),
                          ),
              Text(widget.event.text, style: AppTextStyles.bodyMedium, textAlign: TextAlign.center,)
            ],
          ),
        )
      ),
    );
  }
}