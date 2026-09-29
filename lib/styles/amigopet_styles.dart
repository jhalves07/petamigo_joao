import 'package:flutter/material.dart';

class AmigoPetStyles {
  static const Color verde = Color(0xFF4CAF50);
  static const Color verdeEscuro = Color(0xFF2E7D32);
  static const Color fundo = Color(0xFFF5F9F5);
  static const Color branco = Colors.white;

  static const TextStyle titulo = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: verdeEscuro,
  );

  static const TextStyle subtitulo = TextStyle(
    fontSize: 16,
    color: Colors.black87,
  );

  static final ButtonStyle botaoPrincipal = ElevatedButton.styleFrom(
    backgroundColor: verde,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(
      horizontal: 35,
      vertical: 15,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}