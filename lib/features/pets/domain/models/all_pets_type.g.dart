// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_pets_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllpetsType _$AllpetsTypeFromJson(Map<String, dynamic> json) => AllpetsType(
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => Types.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllpetsTypeToJson(AllpetsType instance) =>
    <String, dynamic>{
      'types': instance.types,
    };

Types _$TypesFromJson(Map<String, dynamic> json) => Types(
      name: json['name'] as String?,
      coats:
          (json['coats'] as List<dynamic>?)?.map((e) => e as String).toList(),
      colors:
          (json['colors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      genders:
          (json['genders'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$TypesToJson(Types instance) => <String, dynamic>{
      'name': instance.name,
      'coats': instance.coats,
      'colors': instance.colors,
      'genders': instance.genders,
    };
