import 'package:flutter/material.dart';

class RouteProvider extends ChangeNotifier {
  String _currentRoute = '/';

  String get currentRoute => _currentRoute;

  void changeRoute(String newRoute, BuildContext context) {
    if (_currentRoute != newRoute) {
      _currentRoute = newRoute;
      Navigator.pushNamed(context, newRoute).then((_) {
        // Quando voltar da rota, redefinir para '/'
        _currentRoute = '/';
        notifyListeners();
      });
      notifyListeners();
    }
  }

  void goBack(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
      _currentRoute = '/'; // Garante que voltamos para a Home
      notifyListeners();
    }
  }
}
