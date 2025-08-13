import '../../../core/base/ibase_model.dart';

class CharacterModel extends IBaseModel<CharacterModel> {
  int? id;
  String? name;
  String? status;
  String? species;
  String? image;

  CharacterModel({this.id, this.name, this.status, this.species, this.image});

  @override
  CharacterModel fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      image: json['image'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'image': image,
    };
  }
}
