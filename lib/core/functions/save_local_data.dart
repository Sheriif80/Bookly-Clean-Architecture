import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:hive_ce/hive.dart';

void saveLocalData(List<BookEntity> books, String boxName) {
  final box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}
