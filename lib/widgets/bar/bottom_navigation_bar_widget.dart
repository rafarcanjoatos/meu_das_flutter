import 'package:flutter/material.dart';
import 'package:meu_das_flutter/pages/app/dashboard_page.dart';
import 'package:meu_das_flutter/pages/app/home_page.dart';
import 'package:meu_das_flutter/pages/app/notifications_page.dart';
import 'package:meu_das_flutter/services/notification_service.dart';
import 'package:meu_das_flutter/utils/app_strings.dart';

// ignore: must_be_immutable
class BottomNavigationBarWidget extends StatefulWidget {
  int currentPageIndex;
  BottomNavigationBarWidget({
    super.key,
    this.currentPageIndex = 1,
  });

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  final NotificationService notificationService = NotificationService();
  int notificationCount = 0;

  @override
  void initState() {
    super.initState();
    _fetchNotificationCount();
  }

  Future<void> _fetchNotificationCount() async {
    final notifications = await notificationService.consumerApi();
    setState(() {
      notificationCount = notifications?.length ?? 0;
    });
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DashboardPage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const NotificationsPage()),
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
        if (index == 2) {
          _fetchNotificationCount();
        }
      },
      selectedIndex: widget.currentPageIndex,
      destinations: <Widget>[
        const NavigationDestination(
          icon: Icon(Icons.signal_cellular_alt),
          label: AppStrings.menuDashboard,
        ),
        const NavigationDestination(
          icon: Icon(Icons.home_outlined),
          label: AppStrings.menuHome,
        ),
        NavigationDestination(
          icon: Badge(
            label: Text('$notificationCount'),
            child: const Icon(Icons.notifications_sharp),
          ),
          label: AppStrings.menuNotifications,
        ),
      ],
    );
  }
}
