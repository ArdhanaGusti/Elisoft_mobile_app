import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget bodyAlert(IconData icon, String message, Color color) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.0),
      color: color,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(
          width: 12.0,
        ),
        Text(
          message,
          style: GoogleFonts.inter(color: Colors.white),
        ),
      ],
    ),
  );
}
