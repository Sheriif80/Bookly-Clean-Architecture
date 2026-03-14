import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:meta/meta.dart';

part 'fetch_newest_books_state.dart';

class FetchNewestBooksCubit extends Cubit<FetchNewestBooksState> {
  FetchNewestBooksCubit(this.fetchNewestBooksUseCase)
    : super(FetchNewestBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks() async {
    emit(FetchNewestBooksLoading());
    final result = await fetchNewestBooksUseCase.call();
    result.fold(
      (failure) {
        emit(FetchNewestBooksFailure(message: failure.message));
      },
      (books) {
        emit(FetchNewestBooksSuccess(books: books));
      },
    );
  }
}
