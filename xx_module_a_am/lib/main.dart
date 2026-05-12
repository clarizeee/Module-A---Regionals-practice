import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'handlers.dart';
import 'pages/events.dart';
import 'pages/records.dart';
import 'pages/tickets.dart';

void main() {
  runApp(    ChangeNotifierProvider(
      create: (_) => ProviderClass(),
      child: NavigatedHomepage()) );
}

class NavigatedHomepage extends StatefulWidget {
  const NavigatedHomepage({super.key});

  @override
  State<NavigatedHomepage> createState() => _HomePageState();
}

class _HomePageState extends State<NavigatedHomepage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [events(), tickets(), records()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pages[_selectedIndex],
      
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Events"),
            BottomNavigationBarItem(icon: Icon(Icons.event), label: "Tickets"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Records"),
          ],
        ),
      ),
    );
  }
}
