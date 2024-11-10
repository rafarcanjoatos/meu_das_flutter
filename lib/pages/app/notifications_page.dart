import 'package:flutter/material.dart';
import 'package:meuDas/services/cache_manager_service.dart';
import 'package:meuDas/utils/app_colors.dart';
import 'package:meuDas/utils/app_strings.dart';
import 'package:meuDas/utils/snackbar_utils.dart';
import 'package:meuDas/widgets/page/generic_app_page_widget.dart';
import 'package:meuDas/widgets/utils/text_widget.dart';
import 'package:meuDas/models/notification_model.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<NotificationModel>? notifications = [];

  Future<void> _deleteNotification(int id) async {
    await CacheManagerService.deleteNotificationData(id);
    setState(() {
      notifications!.removeWhere((notification) => notification.id == id);
    });
    SnackbarUtils.showSuccessMessage(context, AppStrings.deletedNotification);
  }

  @override
  Widget build(BuildContext context) {
    return GenericAppPageWidget(
      body: FutureBuilder<List<NotificationModel>?>(
        future: CacheManagerService.getNotificationData(),
        builder: (context, snapshot) {
          notifications = snapshot.data ?? [];

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (notifications!.isEmpty) {
            return const Text(AppStrings.noNotification);
          }

          return ListView.builder(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            itemCount: notifications!.length,
            itemBuilder: (context, index) {
              final notification = notifications![index];

              return Dismissible(
                key: Key(notification.id.toString()),
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: AppColors.red,
                  child: const Icon(
                    Icons.delete,
                    color: AppColors.white,
                    size: 30,
                  ),
                ),
                onDismissed: (direction) async {
                  await _deleteNotification(notification.id!);
                },
                child: ListTile(
                  shape: Border.all(color: AppColors.black.withOpacity(0.2)),
                  title: TextWidget.title2(text: notification.title ?? ""),
                  subtitle:
                      TextWidget.description(text: notification.message ?? ""),
                  trailing: TextWidget.description(
                    text:
                        '${DateTime.parse(notification.timestamp!).hour}:${DateTime.parse(notification.timestamp!).minute}',
                  ),
                ),
              );
            },
          );
        },
      ),
      pageIndex: 2,
      paddingBorder: 0,
      paddingCompanyHeader: 0,
      companyHeader: false,
      hasOverlay: true,
    );
  }
}
