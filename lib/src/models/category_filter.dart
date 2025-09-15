import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'category_filter.g.dart';

abstract class CategoryFilter implements Built<CategoryFilter, CategoryFilterBuilder> {
  CategoryFilter._();

  factory CategoryFilter([void Function(CategoryFilterBuilder) updates]) = _$CategoryFilter;

  /// Toggles filter visibility (default: false)
  bool? get enabled;

  /// Allows selecting multiple categories (default: true)
  bool? get multiSelect;

  /// Zooms chart to fit filtered objects (default: false)
  bool? get zoomOnSelect;

  /// Determines category sorting method (default: 'price')
  /// Options: 'price', 'priceDescending', 'name', 'none'
  String? get sortBy;

  static Serializer<CategoryFilter> get serializer => _$categoryFilterSerializer;

  Map<String, dynamic> toMap() {
    final filterMap = <String, dynamic>{};
    
    if (enabled != null) {
      filterMap['enabled'] = enabled;
    }
    
    if (multiSelect != null) {
      filterMap['multiSelect'] = multiSelect;
    }
    
    if (zoomOnSelect != null) {
      filterMap['zoomOnSelect'] = zoomOnSelect;
    }
    
    if (sortBy != null) {
      filterMap['sortBy'] = sortBy;
    }
    
    return filterMap;
  }
}