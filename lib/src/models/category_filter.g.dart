// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_filter.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CategoryFilter> _$categoryFilterSerializer =
    new _$CategoryFilterSerializer();

class _$CategoryFilterSerializer
    implements StructuredSerializer<CategoryFilter> {
  @override
  final Iterable<Type> types = const [CategoryFilter, _$CategoryFilter];
  @override
  final String wireName = 'CategoryFilter';

  @override
  Iterable<Object?> serialize(Serializers serializers, CategoryFilter object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.enabled;
    if (value != null) {
      result
        ..add('enabled')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.multiSelect;
    if (value != null) {
      result
        ..add('multiSelect')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.zoomOnSelect;
    if (value != null) {
      result
        ..add('zoomOnSelect')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.sortBy;
    if (value != null) {
      result
        ..add('sortBy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CategoryFilter deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoryFilterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'multiSelect':
          result.multiSelect = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'zoomOnSelect':
          result.zoomOnSelect = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'sortBy':
          result.sortBy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$CategoryFilter extends CategoryFilter {
  @override
  final bool? enabled;
  @override
  final bool? multiSelect;
  @override
  final bool? zoomOnSelect;
  @override
  final String? sortBy;

  factory _$CategoryFilter([void Function(CategoryFilterBuilder)? updates]) =>
      (new CategoryFilterBuilder()..update(updates))._build();

  _$CategoryFilter._(
      {this.enabled, this.multiSelect, this.zoomOnSelect, this.sortBy})
      : super._();

  @override
  CategoryFilter rebuild(void Function(CategoryFilterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoryFilterBuilder toBuilder() =>
      new CategoryFilterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoryFilter &&
        enabled == other.enabled &&
        multiSelect == other.multiSelect &&
        zoomOnSelect == other.zoomOnSelect &&
        sortBy == other.sortBy;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, multiSelect.hashCode);
    _$hash = $jc(_$hash, zoomOnSelect.hashCode);
    _$hash = $jc(_$hash, sortBy.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CategoryFilter')
          ..add('enabled', enabled)
          ..add('multiSelect', multiSelect)
          ..add('zoomOnSelect', zoomOnSelect)
          ..add('sortBy', sortBy))
        .toString();
  }
}

class CategoryFilterBuilder
    implements Builder<CategoryFilter, CategoryFilterBuilder> {
  _$CategoryFilter? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  bool? _multiSelect;
  bool? get multiSelect => _$this._multiSelect;
  set multiSelect(bool? multiSelect) => _$this._multiSelect = multiSelect;

  bool? _zoomOnSelect;
  bool? get zoomOnSelect => _$this._zoomOnSelect;
  set zoomOnSelect(bool? zoomOnSelect) => _$this._zoomOnSelect = zoomOnSelect;

  String? _sortBy;
  String? get sortBy => _$this._sortBy;
  set sortBy(String? sortBy) => _$this._sortBy = sortBy;

  CategoryFilterBuilder();

  CategoryFilterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _multiSelect = $v.multiSelect;
      _zoomOnSelect = $v.zoomOnSelect;
      _sortBy = $v.sortBy;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoryFilter other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CategoryFilter;
  }

  @override
  void update(void Function(CategoryFilterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CategoryFilter build() => _build();

  _$CategoryFilter _build() {
    final _$result = _$v ??
        new _$CategoryFilter._(
          enabled: enabled,
          multiSelect: multiSelect,
          zoomOnSelect: zoomOnSelect,
          sortBy: sortBy,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
