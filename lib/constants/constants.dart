import 'package:flutter/material.dart';

class AppAssets {
  static String facebook = 'images/face.png';
  static String github = 'images/git.png';
  static String linkedIn = 'images/in.png';
  static String insta = 'images/insta.png';
  static String twitter = 'images/twit.png';
  static String share = 'images/share.png';
  static String whatsapp = 'images/whatsapp.png';
}

List<String> navTitles = [
  'Home',
  'About',
  'Skills',
  'Projects',
  'Certificates',
  'Contact'
];

List<IconData> navIcons = [
  Icons.home,
  Icons.person,
  Icons.handyman_outlined,
  Icons.laptop,
  Icons.quick_contacts_mail,
  Icons.contact_page
];

final socialButtons = <String>[
  AppAssets.facebook,
  AppAssets.twitter,
  AppAssets.linkedIn,
  AppAssets.insta,
  AppAssets.github,
  AppAssets.whatsapp
];

final socialButtonsLinks = <String>[
  'https://www.facebook.com/venkatakarthik.garapati',
  'https://twitter.com/Karthi04_',
  'https://www.linkedin.com/in/karthi0402/',
  'https://www.instagram.com/__karthiiii____?igsh=MXdoOGQwcXdwMXAyZA==',
  'https://github.com/Karthi0402',
  'https://wa.me/7075140004'
];
