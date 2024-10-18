import 'package:flutter/material.dart';
import 'package:meu_das_flutter/pages/app/dashboard_page.dart';
import 'package:meu_das_flutter/pages/app/home_page.dart';
import 'package:meu_das_flutter/pages/app/notifications_page.dart';
import 'package:meu_das_flutter/services/notification_service.dart';
import 'package:meu_das_flutter/utils/app_colors.dart';
import 'package:meu_das_flutter/utils/app_strings.dart';

// ignore: must_be_immutable
class BottomNavigationBarWidget extends StatefulWidget {
  int currentPageIndex;
  bool hasOverlay;
  BottomNavigationBarWidget({
    super.key,
    this.currentPageIndex = 1,
    this.hasOverlay = false,
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
      indicatorColor: widget.hasOverlay
          ? AppColors.purple.withOpacity(0.1)
          : Colors.transparent,
      destinations: <Widget>[
        NavigationDestination(
          icon: widget.currentPageIndex == 0
              ? const Icon(Icons.pie_chart_sharp)
              : const Icon(Icons.pie_chart_outline),
          label: AppStrings.menuDashboard,
        ),
        NavigationDestination(
          icon: widget.currentPageIndex == 1
              ? const Icon(Icons.home_sharp)
              : const Icon(Icons.home_outlined),
          label: AppStrings.menuHome,
        ),
        NavigationDestination(
          icon: Badge(
            label: Text('$notificationCount'),
            child: widget.currentPageIndex == 2
                ? const Icon(Icons.notifications_sharp)
                : const Icon(Icons.notifications_outlined),
          ),
          label: AppStrings.menuNotifications,
        ),
      ],
    );
  }
}
