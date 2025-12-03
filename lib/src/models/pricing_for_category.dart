class PricingForCategory {
  const PricingForCategory({
    this.categoryKey,
    required this.category,
    this.price,
    this.ticketTypes,
    this.description,
  });

  final int? categoryKey;
  final String? category;
  final num? price;
  final String? description;

  final List<TicketTypePricing>? ticketTypes;

  static PricingForCategory? fromMap(Map? data) {
    if (data == null) return null;

    return PricingForCategory(
      categoryKey: data['categoryKey'],
      category: data['category'],
      price: data['price'],
      description: data['description'],
      ticketTypes: (data['ticketTypes'] as List<dynamic>? ?? []).map((e) => TicketTypePricing.fromMap(e)!).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final categoryValue = categoryKey ?? category;
    return <String, dynamic>{
      if (categoryValue != null && categoryValue.toString().isNotEmpty) 'category': categoryValue,
      if (price != null) 'price': price,
      'description': description ?? '',
      if (ticketTypes != null) 'ticketTypes': ticketTypes?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'PricingForCategory('
        'categoryKey: $categoryKey, '
        'category: $category, '
        'price: $price, '
        'description: $description, '
        'ticketTypes: $ticketTypes'
        ')';
  }
}

class TicketTypePricing {
  const TicketTypePricing({
    required this.ticketType,
    required this.price,
    this.label,
    this.description,
    this.primary,
    this.originalPrice,
    this.fee,
  });

  final String? ticketType;
  final num? price;
  final String? label;
  final String? description;
  final bool? primary;
  final num? originalPrice;
  final num? fee;

  static TicketTypePricing? fromMap(Map<String, dynamic>? data) {
    if (data == null) return null;

    return TicketTypePricing(
      ticketType: data['ticketType'],
      price: data['price'],
      label: data['label'],
      description: data['description'],
      primary: data['primary'],
      originalPrice: data['originalPrice'],
      fee: data['fee'],
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'ticketType': ticketType,
        'price': price,
        if (label != null && label!.isNotEmpty) 'label': label,
        'description': description ?? '',
        if (primary != null) 'primary': primary,
        if (originalPrice != null) 'originalPrice': originalPrice,
        if (fee != null) 'fee': fee,
      };

  @override
  String toString() {
    return 'TicketTypePricing('
        'ticketType: $ticketType, '
        'price: $price, '
        'label: $label, '
        'description: $description, '
        'primary: $primary, '
        'originalPrice: $originalPrice, '
        'fee: $fee'
        ')';
  }
}
