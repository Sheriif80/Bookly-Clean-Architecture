class BookEntity {
  final String bookID;
  final String title;
  final String? image;
  final String? authorName;
  final num? price;
  final num? rating;

  BookEntity({
    required this.bookID,
    required this.title,
    required this.image,
    required this.authorName,
    required this.price,
    required this.rating,
  });
}
