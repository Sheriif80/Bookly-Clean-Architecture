import 'package:bookly/features/home/presentation/views/widgets/bestseller_listview_book.dart';
import 'package:flutter/material.dart';

class SerachResultListView extends StatelessWidget {
  const SerachResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10), // Add spacing here
          child: BestsellerListviewBook(),
        );
      }, childCount: 10),
    );
  }
}
