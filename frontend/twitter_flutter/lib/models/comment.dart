class Comment {
  final int? id;
  final int? userId;
  final String? commentTitle;
  final String? userName;
  final int? commentsCount;
  final String? description;

  Comment(
      {required this.id,
      required this.userId,
      required this.commentTitle,
      required this.userName,
      required this.commentsCount,
      required this.description});
}
