class PricingForCategory {
  const PricingForCategory({
    this.categoryKey,
    required this.category,
    this.price,
    this.ticketTypes,
  });

  final int? categoryKey;
  final String? category;
  final num? price;

  final List<TicketTypePricing>? ticketTypes;

  static PricingForCategory? fromMap(Map? data) {
    if (data == null) return null;

    return PricingForCategory(
      categoryKey: data['categoryKey'],
      category: data['category'],
      price: data['price'],
      ticketTypes: (data['ticketTypes'] as List<dynamic>? ?? []).map((e) => TicketTypePricing.fromMap(e)!).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'category': categoryKey ?? category,
      if (price != null) 'price': price,
      if (ticketTypes != null) 'ticketTypes': ticketTypes?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'PricingForCategory('
        'categoryKey: $categoryKey, '
        'category: $category, '
        'price: $price, '
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
  });

  final String? ticketType;
  final num? price;
  final String? label;
  final String? description;
  final bool? primary;


  static TicketTypePricing? fromMap(Map<String, dynamic>? data) {
    if (data == null) return null;

    return TicketTypePricing(
      ticketType: data['ticketType'],
      price: data['price'],
      label: data['label'],
      description: data['description'],
      primary: data['primary'],
    );
  }

  Map<String, dynamic> toJson() =>
      <String, dynamic>{
        'ticketType': ticketType,
        'price': price,
        if (label != null) 'label': label,
        if (description != null) 'description': description,
        if (primary != null) 'primary': primary,
      };

  @override
  String toString() {
    return 'TicketTypePricing('
        'ticketType: $ticketType, '
        'price: $price, '
        'label: $label, '
        'description: $description, '
        'primary: $primary'
        ')';
  }


}
