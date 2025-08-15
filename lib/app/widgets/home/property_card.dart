// // lib/app/modules/home/widgets/card_view.dart
// import 'package:flutter/material.dart';
// import 'package:realestateapp/app/data/models/property_model.dart';

// class CardView extends StatelessWidget {
//   final PropertyModel card;

//   const CardView({super.key, required this.card});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 160,
//       margin: const EdgeInsets.only(right: 12),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         image: DecorationImage(
//           image: NetworkImage(card.imageUrl),
//           fit: BoxFit.cover,
//         ),
//       ),
//       alignment: Alignment.bottomLeft,
//       padding: const EdgeInsets.all(12),
//       child: Text(
//         "Apartment",
//         style: const TextStyle(
//           color: Colors.white,
//           fontSize: 16,
//           fontWeight: FontWeight.bold,
//           shadows: [
//             Shadow(blurRadius: 4, color: Colors.black54, offset: Offset(1, 1)),
//           ],
//         ),
//       ),
//     );
//   }
// }
