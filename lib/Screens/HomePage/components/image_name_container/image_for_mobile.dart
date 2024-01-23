import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venkats_portfolio/constants/constants.dart';

class ImageContainerForMobile extends StatefulWidget {
  const ImageContainerForMobile({super.key});

  @override
  State<ImageContainerForMobile> createState() =>
      _ImageContainerForMobileState();
}

class _ImageContainerForMobileState extends State<ImageContainerForMobile> {
  var socialBI;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      height: screenHeight / 1,
      constraints: BoxConstraints(minHeight: 560),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(colors: [
                Colors.black38.withOpacity(0.2),
                Colors.black38.withOpacity(0.2),
              ]).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(10.0), // Add border radius to card
              child: Image.asset(
                'images/my_avatar.jpeg',
                width: screenHeight / 2,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hi,\nI'm Garapati Venkata Kartheek\nA Flutter Developer",
                  style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      'A Flutter Developer',
                      textStyle: GoogleFonts.montserrat(
                        color: Colors.amber,
                        textStyle: TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                  pause: const Duration(milliseconds: 1000),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 48,
                  child: ListView.separated(
                    itemCount: socialButtons.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, child) =>
                        const SizedBox(width: 8.0),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        onHover: (value) {
                          setState(() {
                            if (value) {
                              socialBI = index;
                            } else {
                              socialBI = null;
                            }
                          });
                        },
                        borderRadius: BorderRadius.circular(550.0),
                        hoverColor: const Color.fromARGB(131, 255, 255, 255),
                        splashColor: Colors.white,
                        child: buildSocialButton(
                            asset: socialButtons[index],
                            hover: socialBI == index ? true : false),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 140,
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      primary: Colors.amber,
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    child: Text("Resume"),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Ink buildSocialButton({required String asset, required bool hover}) {
    return Ink(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1.0),
        color: Color.fromARGB(255, 82, 81, 81),
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(6),
      child: Image.asset(
        asset,
        width: 10,
        height: 12,
        color: hover ? Color.fromARGB(255, 1, 6, 12) : Colors.white,
        // fit: BoxFit.fill,
      ),
    );
  }
}
