import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:vision_gallery_saver/vision_gallery_saver.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class TicketDownloadPage extends StatefulWidget {
  const TicketDownloadPage({super.key});

  @override
  State<TicketDownloadPage> createState() => _TicketDownloadPageState();
}

class _TicketDownloadPageState extends State<TicketDownloadPage> {
  // CONTROLLER
  final WidgetsToImageController controller = WidgetsToImageController();

  Future<void> downloadTicket() async {
    // CAPTURE WIDGET
    Uint8List? bytes = await controller.capture();

    if (bytes == null) return;

    // SAVE TO GALLERY
    await VisionGallerySaver.saveImage(
      bytes,
      quality: 100,
      name: "event_ticket",
      skipIfExists: true,
    );

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Ticket downloaded")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Download Ticket")),

      body: Column(
        children: [
          const SizedBox(height: 20),
          // WIDGET TO EXPORT
          WidgetsToImage(
            controller: controller,

            child: Container(
              width: 320,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),

              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "VIP EVENT TICKET",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Audience Type: Premium",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 30),

          // DOWNLOAD BUTTON
          ElevatedButton(
            onPressed: downloadTicket,
            child: const Text("Download"),
          ),
        ],
      ),
    );
  }
}
