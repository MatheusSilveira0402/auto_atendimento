import 'package:flutter/material.dart';
import '../ui/animated_page_route.dart';
import '../screens/notifications_screen.dart';
import '../screens/product_details_screen.dart';

class RouteProvider extends ChangeNotifier {
  String _currentRoute = '/';

  String get currentRoute => _currentRoute;

  void changeRoute(String newRoute, BuildContext context, {Map<String, dynamic>? arguments}) {
    if (_currentRoute != newRoute) {
      _currentRoute = newRoute;

      Navigator.push(
        context,
        AnimatedPageRoute(page: _getPage(newRoute, arguments)), 
      ).then((_) {
        _currentRoute = '/'; 
        notifyListeners();
      });

      notifyListeners();
    }
  }

  void goBack(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
      _currentRoute = '/';
      notifyListeners();
    }
  }

  Widget _getPage(String route, Map<String, dynamic>? arguments) {
    switch (route) {

      case '/notifications':
        return NotificationsScreen();

      case '/productDetails':
        return ProductDetailsScreen(
          name: arguments?['name'] ?? 'Produto',
          image: arguments?['image'] ?? '',
        );

      default:
        return Scaffold(body: Center(child: Text('Tela não encontrada')));
    }
  }
}
