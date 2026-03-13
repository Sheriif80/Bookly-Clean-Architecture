import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.amberAccent,
          size: 14,
        ),
        const Gap(6),

        const Text('4.8', style: Styles.textMedium),
        const Gap(7),

        Text('(2390)', style: Styles.caption),
      ],
    );
  }
}
