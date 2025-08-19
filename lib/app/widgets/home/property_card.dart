import 'package:flutter/material.dart';

class PropertyCard extends StatelessWidget {
  final Map<String, dynamic> property;

  const PropertyCard({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Resim kısmı
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Stack(
              children: [
                Image.network(
                  property['url'] ?? '',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 180,
                      color: colorScheme.surfaceVariant,
                      child: Icon(
                        Icons.image_not_supported,
                        color: colorScheme.onSurfaceVariant,
                        size: 50,
                      ),
                    );
                  },
                ),
                // Tip etiketi
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _getTypeColor(property['type']).withOpacity(0.9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      _getPropertyTypeName(property['type']),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Favori butonu
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.favorite_border,
                      color: _getTypeColor(property['type']),
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // İçerik kısmı
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Başlık
                Text(
                  property['title'] ?? 'Başlıksız',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 4),

                // Konum
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 14,
                      color: colorScheme.outline,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        property['location'] ?? 'Konum belirtilmemiş',
                        style: TextStyle(
                          fontSize: 12,
                          color: colorScheme.outline,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Özellikler (sadece ev ve daire için)
                if (property['type'] == 'home' ||
                    property['type'] == 'apartment')
                  Row(
                    children: [
                      if (property['bedrooms']?.toString().isNotEmpty ==
                          true) ...[
                        Icon(Icons.bed, size: 16, color: colorScheme.outline),
                        const SizedBox(width: 4),
                        Text(
                          '${property['bedrooms']} yatak',
                          style: TextStyle(
                            fontSize: 12,
                            color: colorScheme.outline,
                          ),
                        ),
                        const SizedBox(width: 12),
                      ],
                      if (property['bathrooms']?.toString().isNotEmpty ==
                          true) ...[
                        Icon(
                          Icons.bathroom,
                          size: 16,
                          color: colorScheme.outline,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${property['bathrooms']} banyo',
                          style: TextStyle(
                            fontSize: 12,
                            color: colorScheme.outline,
                          ),
                        ),
                      ],
                    ],
                  ),

                // Arazi için alan bilgisi
                if (property['type'] == 'land' &&
                    property['landSize']?.toString().isNotEmpty == true)
                  Row(
                    children: [
                      Icon(
                        Icons.square_foot,
                        size: 16,
                        color: colorScheme.outline,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${property['landSize']} m²',
                        style: TextStyle(
                          fontSize: 12,
                          color: colorScheme.outline,
                        ),
                      ),
                    ],
                  ),

                // Ofis için alan bilgisi
                if (property['type'] == 'office' &&
                    property['size']?.toString().isNotEmpty == true)
                  Row(
                    children: [
                      Icon(
                        Icons.square_foot,
                        size: 16,
                        color: colorScheme.outline,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${property['size']} m²',
                        style: TextStyle(
                          fontSize: 12,
                          color: colorScheme.outline,
                        ),
                      ),
                    ],
                  ),

                const SizedBox(height: 12),

                // Fiyat
                Text(
                  _formatPrice(property['price']),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: _getTypeColor(property['type']),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getPropertyTypeName(String? type) {
    switch (type) {
      case 'home':
        return 'Ev';
      case 'apartment':
        return 'Daire';
      case 'office':
        return 'Ofis';
      case 'land':
        return 'Arazi';
      default:
        return type ?? '';
    }
  }

  Color _getTypeColor(String? type) {
    switch (type) {
      case 'home':
        return const Color(0xFF3B82F6); // mavi
      case 'apartment':
        return const Color(0xFF10B981); // yeşil
      case 'office':
        return const Color(0xFFF59E0B); // turuncu
      case 'land':
        return const Color(0xFFEF4444); // kırmızı
      default:
        return const Color(0xFF6B7280);
    }
  }

  String _formatPrice(dynamic price) {
    if (price == null) return '0 ₺';

    int priceInt = price is int ? price : int.tryParse(price.toString()) ?? 0;

    if (priceInt >= 1000000) {
      double million = priceInt / 1000000.0;
      return '${million.toStringAsFixed(1)}M ₺';
    } else if (priceInt >= 1000) {
      double thousand = priceInt / 1000.0;
      return '${thousand.toStringAsFixed(0)}K ₺';
    }

    return '$priceInt ₺';
  }
}
