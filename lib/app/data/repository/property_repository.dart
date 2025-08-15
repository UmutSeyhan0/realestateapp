import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/property_model.dart';

class PropertyRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addProperty(PropertyModel property) async {
    await _firestore.collection('properties').add(property.toMap());
  }

  Future<List<PropertyModel>> getAllProperties() async {
    final snapshot = await _firestore.collection('properties').get();
    return snapshot.docs
        .map((doc) => PropertyModel.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<List<PropertyModel>> getUserProperties(String userId) async {
    final snapshot = await _firestore
        .collection('properties')
        .where('ownerId', isEqualTo: userId)
        .get();
    return snapshot.docs
        .map((doc) => PropertyModel.fromMap(doc.data(), doc.id))
        .toList();
  }
}
