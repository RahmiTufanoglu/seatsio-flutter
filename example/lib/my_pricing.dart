class MyPricing {
  const MyPricing(
    this.name,
    this.grossPrice,
  );

  final String name;
  final double grossPrice;

  @override
  String toString() {
    return 'MyPricing('
        'name: $name, '
        'grossPrice: $grossPrice'
        ')';
  }
}
