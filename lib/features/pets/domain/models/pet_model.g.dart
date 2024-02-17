// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimalsModel _$AnimalsModelFromJson(Map<String, dynamic> json) => AnimalsModel(
      pets: (json['animals'] as List<dynamic>?)
          ?.map((e) => Pet.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimalsModelToJson(AnimalsModel instance) =>
    <String, dynamic>{
      'animals': instance.pets,
      'pagination': instance.pagination,
    };

Pet _$PetFromJson(Map<String, dynamic> json) => Pet(
      id: json['id'] as int?,
      url: json['url'] as String?,
      type: json['type'] as String?,
      colors: json['colors'] == null
          ? null
          : Colors.fromJson(json['colors'] as Map<String, dynamic>),
      age: json['age'] as String?,
      gender: json['gender'] as String?,
      size: json['size'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      primaryPhotoCropped: json['primaryPhotoCropped'] == null
          ? null
          : Photos.fromJson(
              json['primaryPhotoCropped'] as Map<String, dynamic>),
      contact: json['contact'] == null
          ? null
          : Contact.fromJson(json['contact'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PetToJson(Pet instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'type': instance.type,
      'colors': instance.colors,
      'age': instance.age,
      'gender': instance.gender,
      'size': instance.size,
      'name': instance.name,
      'description': instance.description,
      'primaryPhotoCropped': instance.primaryPhotoCropped,
      'contact': instance.contact,
    };

Colors _$ColorsFromJson(Map<String, dynamic> json) => Colors(
      primary: json['primary'] as String?,
      secondary: json['secondary'] as String?,
      tertiary: json['tertiary'] as String?,
    );

Map<String, dynamic> _$ColorsToJson(Colors instance) => <String, dynamic>{
      'primary': instance.primary,
      'secondary': instance.secondary,
      'tertiary': instance.tertiary,
    };

Photos _$PhotosFromJson(Map<String, dynamic> json) => Photos(
      small: json['small'] as String?,
      medium: json['medium'] as String?,
      large: json['large'] as String?,
      full: json['full'] as String?,
    );

Map<String, dynamic> _$PhotosToJson(Photos instance) => <String, dynamic>{
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large,
      'full': instance.full,
    };

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      address1: json['address1'] as String?,
      address2: json['address2'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      postcode: json['postcode'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'address1': instance.address1,
      'address2': instance.address2,
      'city': instance.city,
      'state': instance.state,
      'postcode': instance.postcode,
      'country': instance.country,
    };

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      countPerPage: json['countPerPage'] as int?,
      totalCount: json['totalCount'] as int?,
      currentPage: json['currentPage'] as int?,
      totalPages: json['totalPages'] as int?,
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'countPerPage': instance.countPerPage,
      'totalCount': instance.totalCount,
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
    };
