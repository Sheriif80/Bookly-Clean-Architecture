import 'package:bookly/features/home/presentation/managers/fetch_featured_books_cubit/fetch_featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_listview_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksListviewBuilderBlocBuilder extends StatelessWidget {
  const BooksListviewBuilderBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchFeaturedBooksCubit, FetchFeaturedBooksState>(
      builder: (context, state) {
        if (state is FetchFeaturedBooksSuccess) {
          return BooksListviewBuilder(books: state.books);
        } else if (state is FetchFeaturedBooksFailure) {
          return Text(state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
