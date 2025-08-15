import 'package:cloud_firestore/cloud_firestore.dart';

class PropertyModel {
  final String id;
  final String title;
  final String description;
  final String type; // home, apartment, office, land
  final double price;
  final String location;
  final String ownerId;
  final List<String> images;
  final DateTime createdAt;

  // Tip bazlı alanlar (opsiyonel)
  final int? bedrooms;
  final int? bathrooms;
  final int? floor;
  final double? size;
  final int? buildingAge;
  final bool? hasElevator;
  final int? rooms;
  final bool? hasParking;
  final double? landSize;
  final String? zoningType;

  PropertyModel({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.price,
    required this.location,
    required this.ownerId,
    required this.images,
    required this.createdAt,
    this.bedrooms,
    this.bathrooms,
    this.floor,
    this.size,
    this.buildingAge,
    this.hasElevator,
    this.rooms,
    this.hasParking,
    this.landSize,
    this.zoningType,
  });

  factory PropertyModel.fromMap(Map<String, dynamic> map, String documentId) {
    return PropertyModel(
      id: documentId,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      type: map['type'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      location: map['location'] ?? '',
      ownerId: map['ownerId'] ?? '',
      images: List<String>.from(map['images'] ?? []),
      createdAt: (map['createdAt'] as Timestamp).toDate(),

      // Opsiyonel alanlar
      bedrooms: map['bedrooms'],
      bathrooms: map['bathrooms'],
      floor: map['floor'],
      size: map['size']?.toDouble(),
      buildingAge: map['buildingAge'],
      hasElevator: map['hasElevator'],
      rooms: map['rooms'],
      hasParking: map['hasParking'],
      landSize: map['landSize']?.toDouble(),
      zoningType: map['zoningType'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'type': type,
      'price': price,
      'location': location,
      'ownerId': ownerId,
      'images': images,
      'createdAt': createdAt,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'floor': floor,
      'size': size,
      'buildingAge': buildingAge,
      'hasElevator': hasElevator,
      'rooms': rooms,
      'hasParking': hasParking,
      'landSize': landSize,
      'zoningType': zoningType,
    };
  }
}
