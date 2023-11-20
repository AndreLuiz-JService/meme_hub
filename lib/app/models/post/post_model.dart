// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostModel {
  final String id;
  final String title;
  final String imageUrl;
  final String ownerUsername;
  final int ratingLike;
  final int ratingDislike;
  final int commentCount;
  final String createdBy;
  final DateTime createdOn;
  PostModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.ownerUsername,
    required this.ratingLike,
    required this.ratingDislike,
    required this.commentCount,
    required this.createdBy,
    required this.createdOn,
  });

  String get differenceTimePost {
    final duration = DateTime.now().difference(createdOn);

    final durationInMinutes = duration.inMinutes;
    if (durationInMinutes <= 1) {
      return 'Postado agora';
    }

    if (durationInMinutes <= 60) {
      return "$durationInMinutes Minutos";
    }

    final durationInHours = duration.inHours;
    if (durationInHours <= 24) {
      return '$durationInHours Horas';
    }

    final durationInDays = duration.inDays;
    if (durationInDays <= 30) {
      return '$durationInDays dias';
    }

    final durationInMonths = duration.inDays ~/ 30;
    if (durationInMonths <= 12) {
      return '$durationInMonths meses';
    }

    final durationInYears = duration.inDays ~/ 365;
    return '$durationInYears anos';
  }

  PostModel copyWith({
    String? id,
    String? title,
    String? imageUrl,
    String? ownerUsername,
    int? ratingLike,
    int? ratingDislike,
    int? commentCount,
    String? createdBy,
    DateTime? createdOn,
  }) {
    return PostModel(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      ownerUsername: ownerUsername ?? this.ownerUsername,
      ratingLike: ratingLike ?? this.ratingLike,
      ratingDislike: ratingDislike ?? this.ratingDislike,
      commentCount: commentCount ?? this.commentCount,
      createdBy: createdBy ?? this.createdBy,
      createdOn: createdOn ?? this.createdOn,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'ownerUsername': ownerUsername,
      'ratingLike': ratingLike,
      'ratingDislike': ratingDislike,
      'commentCount': commentCount,
      'createdBy': createdBy,
      'createdOn': createdOn.millisecondsSinceEpoch,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'] as String,
      title: map['title'] as String,
      imageUrl: map['imageUrl'] as String,
      ownerUsername: map['ownerUsername'] as String,
      ratingLike: map['ratingLike'] as int,
      ratingDislike: map['ratingDislike'] as int,
      commentCount: map['commentCount'] as int,
      createdBy: map['createdBy'] as String,
      createdOn: DateTime.parse(map['createdOn'] as String).toLocal(),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostModel(id: $id, title: $title, imageUrl: $imageUrl, ownerUsername: $ownerUsername, ratingLike: $ratingLike, ratingDislike: $ratingDislike, commentCount: $commentCount, createdBy: $createdBy, createdOn: $createdOn)';
  }

  @override
  bool operator ==(covariant PostModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.imageUrl == imageUrl &&
        other.ownerUsername == ownerUsername &&
        other.ratingLike == ratingLike &&
        other.ratingDislike == ratingDislike &&
        other.commentCount == commentCount &&
        other.createdBy == createdBy &&
        other.createdOn == createdOn;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        imageUrl.hashCode ^
        ownerUsername.hashCode ^
        ratingLike.hashCode ^
        ratingDislike.hashCode ^
        commentCount.hashCode ^
        createdBy.hashCode ^
        createdOn.hashCode;
  }
}
