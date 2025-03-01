import 'package:flutter/material.dart';

class AppColors {
  // Cores principais (cores quentes que estimulam o apetite)
  static const Color primary = Color(0xFF2a2a2a); 
  static const Color secondary = Color(0xFFFFA500);
  static const Color accent = Color(0xFFFFD700); 

  // Fundo
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color backgroundDark = primary; 

  // Texto
  static const Color textLight = Color(0xFF000000);
  static const Color textDark = Color(0xFFFFFFFF); 
  static const Color textDarkSecondary = Color(0xFFBFBFBF); 

  // AppBar
  static const Color appBarLight = backgroundLight; 
  static const Color appBarDark = backgroundDark; 

  // Botões
  static const Color buttonBackground = Colors.red; // Amarelo para botões
  static const Color buttonText = Colors.white; // Texto branco para botões

  // Bordas e Destaques
  static const Color borderLight = Color(0xFFD1A87D); // Bege escuro para bordas no tema claro
  static const Color borderDark = Color(0xFF4A4A4A); // Cinza escuro para bordas no tema escuro
}
