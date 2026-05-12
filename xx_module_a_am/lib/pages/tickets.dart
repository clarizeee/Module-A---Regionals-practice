import 'package:flutter/material.dart';
import 'newTicket.dart';
class tickets extends StatefulWidget {
  const tickets({super.key});

  @override
  State<tickets> createState() => _ticketsState();
}

class _ticketsState extends State<tickets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Tickets"))
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ticketCreate()));
                },
                child: Container(child: Text("Create new ticket"),),
                )
            ],
          ),
        ),
      ),
    );
  }
}