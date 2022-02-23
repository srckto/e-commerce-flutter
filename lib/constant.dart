import 'package:flutter/material.dart';

const Color k_primary = Color(0xFF00C569);

const Color k_orange = Color(0xFFFFB900);

const Color k_fontGrey = Color(0xFF929292);

const MaterialColor k_primaryBlack = MaterialColor(
  k_blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(k_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
const int k_blackPrimaryValue = 0xFF000000;

// Cart details
const String k_tableCart = "CartTable";
const String k_columnid = "id";
const String k_columnTitle = "title";
const String k_columnImage = "image";
const String k_columnQuantity = "quantity";
const String k_columnPrice = "price";

// Local storage
const String k_keyUserStorage = "user";

const Color k_grey = Color(0xFFDDDDDD);

const k_kTileHeight = 50.0;
const k_inProgressColor = Colors.black87;
const k_todoColor = Color(0xffd1d2d7);
