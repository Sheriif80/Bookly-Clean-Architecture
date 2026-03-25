import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:meta/meta.dart';

part 'fetch_featured_books_state.dart';

class FetchFeaturedBooksCubit extends Cubit<FetchFeaturedBooksState> {
  FetchFeaturedBooksCubit(this.fetchFeaturedBooksUseCase)
    : super(FetchFeaturedBooksInitial());
  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FetchFeaturedBooksLoading());
    } else {
      emit(FetchFeaturedBooksPaginationLoading());
    }
    final result = await fetchFeaturedBooksUseCase.call(pageNumber);
    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(FetchFeaturedBooksFailure(failure.message));
        } else {
          emit(FetchFeaturedBooksPaginationFailure(failure.message));
        }
      },
      (books) {
        emit(FetchFeaturedBooksSuccess(books));
      },
    );
  }
}
