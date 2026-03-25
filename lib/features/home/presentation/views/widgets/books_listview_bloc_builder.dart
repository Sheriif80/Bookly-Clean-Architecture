import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/managers/fetch_featured_books_cubit/fetch_featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_listview_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksListviewBuilderBlocConsumer extends StatefulWidget {
  const BooksListviewBuilderBlocConsumer({super.key});

  @override
  State<BooksListviewBuilderBlocConsumer> createState() =>
      _BooksListviewBuilderBlocConsumerState();
}

class _BooksListviewBuilderBlocConsumerState
    extends State<BooksListviewBuilderBlocConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchFeaturedBooksCubit, FetchFeaturedBooksState>(
      listener: (context, state) {
        if (state is FetchFeaturedBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is FetchFeaturedBooksPaginationFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        if (state is FetchFeaturedBooksSuccess ||
            state is FetchFeaturedBooksPaginationLoading ||
            state is FetchFeaturedBooksPaginationFailure) {
          return BooksListviewBuilder(books: books);
        } else if (state is FetchFeaturedBooksFailure) {
          return Text(state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
