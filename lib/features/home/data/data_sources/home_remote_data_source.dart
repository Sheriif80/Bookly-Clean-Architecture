import 'package:bookly/constants.dart';
import 'package:bookly/core/functions/save_local_data.dart';
import 'package:bookly/core/services/api_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    final response = await apiService.get(
      endPoint:
          'volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNumber * 10}&maxResults=10',
    );
    final List<BookEntity> books = getBooksList(response);
    saveLocalData(books, kFeaturedBooksBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    final response = await apiService.get(
      endPoint: 'volumes?Filtering=free-ebooks&q=programming&sorting=newest',
    );
    final List<BookEntity> books = getBooksList(response);
    saveLocalData(books, kNewestBooksBox);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> response) {
    final List<BookEntity> books = [];
    for (var item in response['items']) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }
}
