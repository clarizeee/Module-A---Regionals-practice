import 'package:flutter/material.dart';
import 'newTicket.dart';
import 'ticketDetails.dart';
class tickets extends StatefulWidget {
  const tickets({super.key});

  @override
  State<tickets> createState() => _ticketsState();
}

class _ticketsState extends State<tickets> {
  //TODO: SORT THE OPENING 
  //TODO: SORT THE CLOSING CEREM




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Tickets"))
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child:             
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ticketCreate()),
                  );
                },
                child: Container(child: Text("Create new ticket")),
              )
            ),
                        SliverToBoxAdapter(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TicketDownloadPage()),
                  );
                },
                child: Container(child: Text("Create new ticket")),
              ),
            )
          ],
        ),
      )
    );
  }
}