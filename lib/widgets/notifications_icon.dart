import 'package:auto_atendimento/providers/notifications_provider.dart';
import 'package:auto_atendimento/providers/route_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationCount = context.watch<NotificationProvider>().notificationCount;

    return Stack(
      children: [
        IconButton(
          icon: Icon(
            Icons.notifications,
            size: 26,
          ),
          onPressed: () {
            context.read<RouteProvider>().changeRoute('/notifications', context);
          },
        ),
        if (notificationCount > 0)
          Positioned(
            right: 5,
            top: 5,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                "$notificationCount",
                style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
          ),
      ],
    );
  }
}
