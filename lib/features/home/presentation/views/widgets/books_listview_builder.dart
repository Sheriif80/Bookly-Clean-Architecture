import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        itemCount: books.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              GoRouter.of(
                context,
              ).push(AppRouter.bookDetailsView, extra: books[index]);
            },
            child: BookItem(imageUrl: books[index].image ?? ''),
          );
        },
      ),
    );
  }
}
