import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

abstract class Styles {
  static const headlineText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.8),
    fontFamily: 'SF-Pro-Text',
    fontSize: 32.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const minorText = TextStyle(
    color: Color.fromRGBO(128, 128, 128, 1.0),
    fontFamily: 'SF-Pro-Text',
    fontSize: 16.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const headlineName = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'SF-Pro-Text',
    fontSize: 15.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const headlineAuthor = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.8),
    fontFamily: 'SF-Pro-Text',
    fontSize: 13.5,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const headlineDate = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.8),
    fontFamily: 'SF-Pro-Text',
    fontSize: 13.5,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const headlineNothingness = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.8),
    fontFamily: 'SF-Pro-Text',
    fontSize: 15.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const detailsTitleText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'SF-Pro-Text',
    height: 1.5,
    fontSize: 18.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
  );

  static const detailsAuthorText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'SF-Pro-Text',
    fontSize: 14.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const detailsDescriptionText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'SF-Pro-Text',
    height: 1.5,
    fontSize: 14.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const cardTitleText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'SF-Pro-Text',
    fontSize: 32.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const cardCategoryText = TextStyle(
    color: Color.fromRGBO(255, 255, 255, 0.9),
    fontFamily: 'SF-Pro-Text',
    fontSize: 16.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const cardDescriptionText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'SF-Pro-Text',
    fontSize: 16.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const appBackground = Color(0xffd0d0d0);

  static const scaffoldBackground = Color(0xfff0f0f0);

  static const searchBackground = Color(0xffe0e0e0);

  static const frostedBackground = Color(0xccf8f8f8);

  static const TextStyle searchText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1.0),
    fontFamily: 'SF-Pro-Text',
    fontSize: 14.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const Color searchCursorColor = Color.fromRGBO(0, 122, 255, 1.0);

  static const Color searchIconColor = Color.fromRGBO(128, 128, 128, 1.0);
}
