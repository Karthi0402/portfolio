import 'package:flutter/material.dart';
import 'package:venkats_portfolio/Screens/HomePage/components/headers/logo.dart';

class MobileHeader extends StatelessWidget {
  final VoidCallback? onLogoTap;
  const MobileHeader({super.key, required this.onLogoTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, Colors.black54],
        ),
      ),
      padding: const EdgeInsets.only(left: 40, right: 25),
      child: Row(
        children: [
          Logo(
            onTap: onLogoTap,
          ),
        ],
      ),
    );
  }
}
