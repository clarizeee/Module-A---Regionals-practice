import 'package:flutter/material.dart';

class ticketCreate extends StatefulWidget {
  const ticketCreate({super.key});

  @override
  State<ticketCreate> createState() => _ticketCreateState();
}

class _ticketCreateState extends State<ticketCreate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create new ticket"),),
      body: Container(),
    );
  }
}