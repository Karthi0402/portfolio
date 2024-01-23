import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:venkats_portfolio/constants/constants.dart';

class ImageAndNameContainer extends StatefulWidget {
  const ImageAndNameContainer({super.key});

  @override
  State<ImageAndNameContainer> createState() => _ImageAndNameContainerState();
}

class _ImageAndNameContainerState extends State<ImageAndNameContainer> {
  var socialBI;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: screenSize.height / 1.2,
      width: double.maxFinite,
      constraints: BoxConstraints(minHeight: 350),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hi,\nI'm Garapati Venkata Kartheek",
                  style: TextStyle(
                      fontSize: 24,
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
                            fontSize: 24,
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
                        onTap: () async {
                          if (index >= 0 && index < socialButtonsLinks.length) {
                            String url = socialButtonsLinks[index];
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              print('Could not launch $url');
                            }
                          }
                        },
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
                  width: 250,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      primary: Colors.amber,
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    child: Text("Download Resume"),
                  ),
                )
              ],
            ),
          ),
          Card(
            elevation: 20, // Add elevation for shadow
            shadowColor: Colors.white, // Set shadow color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.white,
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(10.0), // Add border radius to card
              child: Image.asset(
                'images/my_avatar.jpeg',
                width: screenWidth / 6,
                fit: BoxFit.cover,
              ),
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
