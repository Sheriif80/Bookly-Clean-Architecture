// lib/core/utils/styles.dart
import 'package:flutter/material.dart';

abstract class Styles {
  // HEADERS
  static const TextStyle headerLarge = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w900, // Extra Bold
  );

  static const TextStyle headerMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700, // Bold
  );

  static const TextStyle bookTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600, // SemiBold
    fontFamily: 'GT Sectra Fine',
  );

  static const TextStyle bookTitleLarge = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w600, // SemiBold
    fontFamily: 'GT Sectra Fine',
  );

  // BODY TEXT
  static const TextStyle textLarge = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600, // SemiBold
  );

  static const TextStyle textMedium = TextStyle(
    fontSize: 16, // Standard reading size
    fontWeight: FontWeight.w500, // Medium
  );

  static const TextStyle textSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400, // Regular
  );

  // CAPTIONS (Grey text usually)
  static TextStyle caption = TextStyle(
    fontSize: 14,
    color: Colors.grey.shade500,
    fontWeight: .w600,
  );
}
