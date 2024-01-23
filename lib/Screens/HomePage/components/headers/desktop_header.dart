import 'package:flutter/material.dart';
import 'package:venkats_portfolio/Screens/HomePage/components/headers/logo.dart';
import 'package:venkats_portfolio/constants/constants.dart';

class DesktopHeader extends StatefulWidget {
  final bool isScroll;
  const DesktopHeader({super.key, required this.isScroll});

  @override
  State<DesktopHeader> createState() => _DesktopHeaderState();
}

class _DesktopHeaderState extends State<DesktopHeader> {
  @override
  Widget build(BuildContext context) {
    print("isScroll: ${widget.isScroll}");
    return Container(
      height: 60,
      width: double.maxFinite,
      decoration: BoxDecoration(
          gradient: widget.isScroll
              ? LinearGradient(
                  colors: [Colors.grey, Colors.white],
                )
              : LinearGradient(
                  colors: [Colors.transparent, Colors.black54],
                )),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Logo(
            onTap: () {},
          ),
          const Spacer(),
          for (int i = 0; i < navTitles.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  navTitles[i],
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: widget.isScroll ? Colors.black : Colors.white),
                ),
              ),
            )
        ],
      ),
    );
  }
}
