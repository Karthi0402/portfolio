import 'package:flutter/material.dart';
import 'package:venkats_portfolio/constants/const_skills.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: const Color.fromARGB(255, 236, 229, 229),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'What I Can Do',
            style: TextStyle(
                color: Colors.black87,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              children: [
                for (int i = 0; i < platformItems.length; i++)
                  Container(
                    width: double.maxFinite,
                    margin: const EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.shade400),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      leading: Image.asset(
                        platformItems[i]['img'].toString(),
                        width: 26,
                      ),
                      title: Text(
                        platformItems[i]['title'].toString(),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 50,
                ),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: [
                    for (int i = 0; i < skillItems.length; i++)
                      Chip(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        backgroundColor: Colors.grey.shade400,
                        label: Text(skillItems[i]['title'].toString()),
                        avatar: Image.asset(skillItems[i]['img'].toString()),
                      )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
