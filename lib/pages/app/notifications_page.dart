import 'package:flutter/material.dart';
import 'package:meu_das_flutter/services/notification_service.dart';
import 'package:meu_das_flutter/utils/app_colors.dart';
import 'package:meu_das_flutter/widgets/page/generic_app_page_widget.dart';
import 'package:meu_das_flutter/widgets/utils/text_widget.dart';
import 'package:meu_das_flutter/models/notification_model.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final NotificationService notifications = NotificationService();

  @override
  Widget build(BuildContext context) {
    return GenericAppPageWidget(
      body: FutureBuilder<List<NotificationModel>?>(
        future: notifications.consumerApi(),
        builder: (context, notification) {
          final notifications = notification.data ?? [];

          return ListView.builder(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final notification = notifications[index];
              return ListTile(
                shape: Border.all(color: AppColors.black.withOpacity(0.2)),
                title: TextWidget.title2(text: notification.title ?? ""),
                subtitle:
                    TextWidget.description(text: notification.message ?? ""),
                trailing: TextWidget.description(
                  text:
                      '${DateTime.parse(notification.timestamp!).hour}:${DateTime.parse(notification.timestamp!).minute}',
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
