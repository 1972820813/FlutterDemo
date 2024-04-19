import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'network_entity.g.dart';

// {
// "id":28,
// "content":"这是一篇主题区测试文章1",
// "admiration_num":1,
// "collect_num":1,
// "comment_num":0,
// "block":1,
// "member_id":1,
// "content_pic":"[{\"type\":\"image\",\"url\":\"https://storage.googleapis.com/mr486/topic/image/2022042020/62600304d24fd--compress.jpeg\"},{\"type\":\"video\",\"cover_url\":\"https://storage.googleapis.com/mr486/topic/video_cover/2022042020/62600304aa34e--compress.jpeg\",\"url\":\"https://storage.googleapis.com/mr486/topic/video/2022042020/6260030614271--1645415153.609362_o_IMG_0277.mp4\"}]"
// }

@JsonSerializable()
class NetworkEntity {
  @JsonKey(name: 'id', defaultValue: -1)
  int? id;

  @JsonKey(name: 'content_pic')
  @_ArticleAssetConverter()
  List<ContentPicModel>? contentPic;

  NetworkEntity({this.id, this.contentPic});

  factory NetworkEntity.fromJson(Map<String, dynamic> json) =>
      _$NetworkEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkEntityToJson(this);
}

class _ArticleAssetConverter
    implements JsonConverter<List<ContentPicModel>?, String?> {
  const _ArticleAssetConverter();

  @override
  List<ContentPicModel>? fromJson(String? value) {
    final List<ContentPicModel> models = [];
    if (value!.isNotEmpty) {
      final json = jsonDecode(value);
      if (json is List) {
        /// 格式不对的数据剔除掉
        for (final element in json) {
          if (element is Map<String, dynamic>) {
            models.add(ContentPicModel.fromJson(element));
          }
        }
      }
    }
    return models;
  }

  @override
  String? toJson(List<ContentPicModel>? object) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

@JsonSerializable()
class ContentPicModel {
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'url')
  String? url;
  @JsonKey(name: 'cover_url')
  String? coverUrl;

  ContentPicModel({this.url, this.type});

  /// 4.添加反序列化方法(格式：factory 类名.fromJson(Map<String, dynamic> json) => _$类名FromJson(json);)
  factory ContentPicModel.fromJson(Map<String, dynamic> json) =>
      _$ContentPicModelFromJson(json);

  /// 5.添加序列化方法(格式：Map<String, dynamic> toJson() => _$类名ToJson(this);)
  Map<String, dynamic> toJson() => _$ContentPicModelToJson(this);
}
