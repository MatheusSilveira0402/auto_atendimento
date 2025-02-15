import 'package:auto_atendimento/providers/notifications_provider.dart';
import 'package:auto_atendimento/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationProvider = context.watch<NotificationProvider>();

    return Scaffold(
      appBar: CustomAppBar(
        title: "Notificações",
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              notificationProvider.clearNotifications();
            },
          )
        ],
      ),
      body: notificationProvider.notifications.isEmpty
          ? Center(child: Text("Nenhuma notificação encontrada."))
          : ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: notificationProvider.notifications.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(
                      notificationProvider.notifications[index]["title"]!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(notificationProvider.notifications[index]["message"]!),
                    leading: Icon(Icons.notifications, color: Colors.red),
                  ),
                );
              },
            ),
    );
  }
}
