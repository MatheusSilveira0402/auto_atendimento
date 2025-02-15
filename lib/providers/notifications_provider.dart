import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  final List<Map<String, String>> _notifications = [
    {"title": "Pedido confirmado", "message": "Seu pedido foi aceito pelo restaurante."},
    {"title": "Pedido a caminho", "message": "Seu pedido está sendo entregue."},
  ];

  List<Map<String, String>> get notifications => _notifications;

  int get notificationCount => _notifications.length;

  void addNotification(String title, String message) {
    _notifications.insert(0, {"title": title, "message": message});
    notifyListeners(); // Atualiza o estado do app
  }

  void clearNotifications() {
    _notifications.clear();
    notifyListeners();
  }
}
