import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  const PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  final int userId;
  final int id;
  final String title;
  final String body;

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: (json['title'] as String).trim(),
      body: (json['body'] as String).trim(),
    );
  }

  @override
  List<Object?> get props => [userId, id, title, body];
}
