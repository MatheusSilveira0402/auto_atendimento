import 'package:auto_atendimento/providers/notifications_provider.dart';
import 'package:auto_atendimento/providers/route_providers.dart';
import 'package:auto_atendimento/screens/notifications_screen.dart';
import 'package:auto_atendimento/theme/theme.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/profile_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
        ChangeNotifierProvider(create: (_) => RouteProvider()),
      ],
      child: AutoAtendimentoApp(),
    ),
  );
}

class AutoAtendimentoApp extends StatelessWidget {
  const AutoAtendimentoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auto Atendimento',
      theme: AppTheme.lightTheme, 
      darkTheme: AppTheme.darkTheme, 
      themeMode: ThemeMode.system,
      home: _MainScreen(),
      initialRoute: '/',
      routes: {
        '/notifications': (context) => NotificationsScreen(),
      },

    );
  }
}

class _MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<_MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [HomeScreen(), CartScreen(), ProfileScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: ScrollBehavior().copyWith(overscroll: false),
        child: _screens[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Início"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Carrinho"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}
