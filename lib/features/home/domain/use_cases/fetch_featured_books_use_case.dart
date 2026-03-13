import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBookUseCase {
  final HomeRepo homeRepo;

  FetchFeaturedBookUseCase({required this.homeRepo});
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() {
    // For example : Should check for a permission if needed

    return homeRepo.fetchFeaturedBooks();
  }
}
