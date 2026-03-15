import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';

class BooksListviewBuilder extends StatelessWidget {
  const BooksListviewBuilder({super.key, required this.books});

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,

      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: .horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return BookItem(imageUrl: books[index].image ?? '');
        },
      ),
    );
  }
}
