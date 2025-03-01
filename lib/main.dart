import 'package:auto_atendimento/providers/notifications_provider.dart';
import 'package:auto_atendimento/providers/route_providers.dart';
import 'package:auto_atendimento/screens/main_screen.dart';
import 'package:auto_atendimento/theme/theme.dart';
import 'package:flutter/material.dart';
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
      home: MainScreen(),
      initialRoute: '/',

    );
  }
}