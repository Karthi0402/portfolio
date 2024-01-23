import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  final VoidCallback? onTap;
  const Logo({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        "GVK",
        style: GoogleFonts.lora(
            textStyle: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.lineThrough,
                color: Colors.amber.shade400)),
      ),
    );
  }
}
