import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color(0xFF685BFF); // this is primary color
const canvasColor = Color(0xFF2E2E48); // this is whole canvas color
const scaffoldBackgroundColor =
    Color(0xFF464667); // this is scaffold background color
const accentCanvasColor = Color(0xFF3E3E61); // select index highlight colors
const white = Colors.white;
const actionColor = Color(0xffa2d2ff);
const textColor = Color(0xffbde0fe);
const textPinkCOlor = Color(0xffffafcc);
const textPinkDarkColor = Color(0xfff28482);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
const title = "HyperBass";

TextStyle kLoginTitleStyle(Size size) => GoogleFonts.ubuntu(
      fontSize: size.height * 0.060,
      fontWeight: FontWeight.bold,
    );

TextStyle kLoginSubtitleStyle(Size size) => GoogleFonts.ubuntu(
      fontSize: size.height * 0.030,
    );

TextStyle kLoginTermsAndPrivacyStyle(Size size) =>
    GoogleFonts.ubuntu(fontSize: 15, color: Colors.grey, height: 1.5);

TextStyle kHaveAnAccountStyle(Size size) =>
    GoogleFonts.ubuntu(fontSize: size.height * 0.022, color: Colors.black);

TextStyle kLoginOrSignUpTextStyle(
  Size size,
) =>
    GoogleFonts.ubuntu(
      fontSize: size.height * 0.022,
      fontWeight: FontWeight.w500,
      color: Colors.deepPurpleAccent,
    );

TextStyle kTextFormFieldStyle() => const TextStyle(color: Colors.black);

const BASE_URL =
    "https://kiridharan-fuzzy-space-meme-4vpgw55j6w7c5xp6-3000.preview.app.github.dev";
    // "https://3000-kiridharan-fabricsample-sj30i8a5sge.ws-us94.gitpod.io";
