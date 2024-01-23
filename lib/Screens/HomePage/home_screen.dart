import 'package:flutter/material.dart';
import 'package:venkats_portfolio/Screens/HomePage/components/headers/desktop_header.dart';
import 'package:venkats_portfolio/Screens/HomePage/components/headers/mobile_drawer.dart';
import 'package:venkats_portfolio/Screens/HomePage/components/headers/mobile_header.dart';
import 'package:venkats_portfolio/Screens/HomePage/components/image_name_container/image_for_mobile.dart';
import 'package:venkats_portfolio/Screens/HomePage/components/image_name_container/image_name.dart';
import 'package:venkats_portfolio/Screens/HomePage/components/skills/skills_mobile.dart';
import 'package:venkats_portfolio/Screens/HomePage/components/skills/skills_web.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  bool isScrolled = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.offset > 50 && !isScrolled) {
        setState(() {
          isScrolled = true;
        });
      } else if (_scrollController.offset <= 50 && isScrolled) {
        setState(() {
          isScrolled = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          endDrawer:
              constraints.maxWidth >= 600 ? null : const MobileEndDrawer(),
          body: DefaultTabController(
            length: 1,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: SliverAppBar(
                      pinned: true,
                      floating: true,
                      forceElevated: innerBoxIsScrolled,
                      flexibleSpace: constraints.maxWidth >= 600
                          ? DesktopHeader(
                              isScroll: isScrolled,
                            )
                          : MobileHeader(
                              onLogoTap: () {},
                            ),
                      backgroundColor:
                          isScrolled ? Colors.white : Colors.black54,
                    ),
                  ),
                ];
              },
              body: Builder(builder: (BuildContext context) {
                return ListView(
                  controller: _scrollController,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    if (constraints.maxWidth >= 600)
                      ImageAndNameContainer()
                    else
                      const ImageContainerForMobile(),
                    if (constraints.maxWidth >= 800)
                      const SkillsWeb()
                    else
                      const SkillsMobile(),
                  ],
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
