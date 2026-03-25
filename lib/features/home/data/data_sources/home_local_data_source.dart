import 'package:bookly/constants.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:hive_ce/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    final int startIndex = pageNumber * 10;
    final int endIndex =
        (1 + pageNumber) * 10; // The item that will not be included
    final box = Hive.box<BookEntity>(kFeaturedBooksBox);
    final length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }

    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    final box = Hive.box<BookEntity>(kNewestBooksBox);
    return box.values.toList();
  }
}
