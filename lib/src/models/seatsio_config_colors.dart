class SeatsioConfigColors {
  const SeatsioConfigColors({
    required this.colorSelected,
    required this.colorTitle,
  });

  final String colorSelected;
  final String colorTitle;

  Map<String, dynamic> toMap() {
    return {
      'colorSelected': colorSelected,
      'colorTitle': colorTitle,
    };
  }

  @override
  String toString() {
    return 'SeatsioConfigColors(colorSelected: $colorSelected, colorTitle: $colorTitle)';
  }
}