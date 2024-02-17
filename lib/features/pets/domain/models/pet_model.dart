import 'package:json_annotation/json_annotation.dart';

part 'pet_model.g.dart';

@JsonSerializable()
class AnimalsModel {
  @JsonKey(
    name: "animals",
  )
  List<Pet>? pets;
  Pagination? pagination;

  AnimalsModel({this.pets, this.pagination});

  factory AnimalsModel.fromJson(Map<String, dynamic> json) =>
      _$AnimalsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnimalsModelToJson(this);
}

@JsonSerializable()
class Pet {
  int? id;
  String? url;
  String? type;
  Colors? colors;
  String? age;
  String? gender;
  String? size;
  String? name;
  String? description;
  Photos? primaryPhotoCropped;
  Contact? contact;

  Pet({
    this.id,
    this.url,
    this.type,
    this.colors,
    this.age,
    this.gender,
    this.size,
    this.name,
    this.description,
    this.primaryPhotoCropped,
    this.contact,
  });

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);

  Map<String, dynamic> toJson() => _$PetToJson(this);
}

@JsonSerializable()
class Colors {
  String? primary;
  String? secondary;
  String? tertiary;

  Colors({this.primary, this.secondary, this.tertiary});

  factory Colors.fromJson(Map<String, dynamic> json) => _$ColorsFromJson(json);

  Map<String, dynamic> toJson() => _$ColorsToJson(this);
}

@JsonSerializable()
class Photos {
  String? small;
  String? medium;
  String? large;
  String? full;

  Photos({this.small, this.medium, this.large, this.full});

  factory Photos.fromJson(Map<String, dynamic> json) => _$PhotosFromJson(json);

  Map<String, dynamic> toJson() => _$PhotosToJson(this);
}

@JsonSerializable()
class Contact {
  String? email;
  String? phone;
  Address? address;

  Contact({this.email, this.phone, this.address});

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}

@JsonSerializable()
class Address {
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? postcode;
  String? country;

  Address(
      {this.address1,
      this.address2,
      this.city,
      this.state,
      this.postcode,
      this.country});

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class Pagination {
  int? countPerPage;
  int? totalCount;
  int? currentPage;
  int? totalPages;

  Pagination(
      {this.countPerPage, this.totalCount, this.currentPage, this.totalPages});

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
