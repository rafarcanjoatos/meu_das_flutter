import 'package:flutter/material.dart';
import 'package:meu_das_flutter/pages/app/dashboard_page.dart';
import 'package:meu_das_flutter/pages/app/home_page.dart';
import 'package:meu_das_flutter/pages/app/notifications_page.dart';
import 'package:meu_das_flutter/utils/app_strings.dart';

// ignore: must_be_immutable
class BottomNavigationBarWidget extends StatefulWidget {
  int currentPageIndex;
  BottomNavigationBarWidget({super.key, required this.currentPageIndex});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DasboardPage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => NotificationsPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        setState(() {
          widget.currentPageIndex = index;
        });
        _navigateToPage(index);
      },
      selectedIndex: widget.currentPageIndex,
      destinations: const <Widget>[
        NavigationDestination(
          icon: Icon(Icons.signal_cellular_alt),
          label: AppStrings.menuDashboard,
        ),
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          label: AppStrings.menuHome,
        ),
        NavigationDestination(
          icon: Badge(
            label: Text('2'),
            child: Icon(Icons.notifications_sharp),
          ),
          label: AppStrings.menuNotifications,
        ),
      ],
    );
  }
}
