import 'package:flutter/material.dart';
import 'package:venkats_portfolio/constants/constants.dart';

class MobileEndDrawer extends StatelessWidget {
  const MobileEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black45,
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close)),
            ),
          ),
          for (int i = 0; i < navIcons.length; i++)
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 30),
              titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
              onTap: () {},
              leading: Icon(
                navIcons[i],
              ),
              title: Text(
                navTitles[i],
              ),
            )
        ],
      ),
    );
  }
}
