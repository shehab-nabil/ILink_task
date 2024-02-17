import 'package:json_annotation/json_annotation.dart';
part 'all_pets_type.g.dart';

@JsonSerializable()
class AllpetsType {
  List<Types>? types;

  AllpetsType({this.types});
  factory AllpetsType.fromJson(Map<String, dynamic> json) =>
      _$AllpetsTypeFromJson(json);

  Map<String, dynamic> toJson() => _$AllpetsTypeToJson(this);
}

@JsonSerializable()
class Types {
  String? name;
  List<String>? coats;
  List<String>? colors;
  List<String>? genders;

  Types({
    this.name,
    this.coats,
    this.colors,
    this.genders,
  });

  factory Types.fromJson(Map<String, dynamic> json) => _$TypesFromJson(json);

  Map<String, dynamic> toJson() => _$TypesToJson(this);
}
