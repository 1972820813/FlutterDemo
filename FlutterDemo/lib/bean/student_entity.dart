import 'package:json_annotation/json_annotation.dart';

part 'student_entity.g.dart';

/// 1.创建实体列
/// 2.先手动输入".g.dart"指定库名，然后使用命令行生成指定的".g.dart"
/// 3.添加序列化标注
//json转换库
@JsonSerializable()
class StudentEntity {
  @JsonKey(name: 'name')

  ///这里的name 与数据解析key相同
  String? name;

  /// 这里的name，是自定义的name，可以与数据解析的不同
  @JsonKey(name: 'age', defaultValue: 2)
  int? age;

  StudentEntity({this.name, this.age});

  /// 4.添加反序列化方法(格式：factory 类名.fromJson(Map<String, dynamic> json) => _$类名FromJson(json);)
  factory StudentEntity.fromJson(Map<String, dynamic> json) =>
      _$StudentEntityFromJson(json);

  /// 5.添加序列化方法(格式：Map<String, dynamic> toJson() => _$类名ToJson(this);)
  Map<String, dynamic> toJson() => _$StudentEntityToJson(this);
}
