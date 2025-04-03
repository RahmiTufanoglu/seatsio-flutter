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
    required this.label,
  });

  final String? ticketType;
  final num? price;
  final String? label;


  static TicketTypePricing? fromMap(Map<String, dynamic>? data) {
    if (data == null) return null;

    return TicketTypePricing(
      ticketType: data['ticketType'],
      price: data['price'],
      label: data['label'],
    );
  }

  Map<String, dynamic> toJson() =>
      <String, dynamic>{
        'ticketType': ticketType,
        'price': price,
        'label': label,
      };

  @override
  String toString() {
    return 'TicketTypePricing('
        'ticketType: $ticketType, '
        'price: $price, '
        'label: $label'
        ')';
  }


}
