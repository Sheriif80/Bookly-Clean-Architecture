import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/managers/fetch_featured_books_cubit/fetch_featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BooksListviewBuilder extends StatefulWidget {
  const BooksListviewBuilder({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<BooksListviewBuilder> createState() => _BooksListviewBuilderState();
}

late ScrollController _controller;
int nextPage = 1;
bool isLoading = false;

class _BooksListviewBuilderState extends State<BooksListviewBuilder> {
  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() async {
    if (_controller.position.pixels >=
        0.7 * _controller.position.maxScrollExtent) {
      if (isLoading == false) {
        isLoading = true;
        await context.read<FetchFeaturedBooksCubit>().fetchFeaturedBooks(
          pageNumber: nextPage,
        );
        nextPage++;
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.builder(
        controller: _controller,
        physics: const BouncingScrollPhysics(),
        scrollDirection: .horizontal,
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              GoRouter.of(
                context,
              ).push(AppRouter.bookDetailsView, extra: widget.books[index]);
            },
            child: BookItem(imageUrl: widget.books[index].image ?? ''),
          );
        },
      ),
    );
  }
}
