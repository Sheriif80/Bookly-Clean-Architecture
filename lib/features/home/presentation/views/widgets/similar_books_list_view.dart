import 'package:bookly/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,

      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: .horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const BookItem();
        },
      ),
    );
  }
}
