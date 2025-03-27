// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seatsio_ticket_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SeatsioTicketType> _$seatsioTicketTypeSerializer =
    new _$SeatsioTicketTypeSerializer();

class _$SeatsioTicketTypeSerializer
    implements StructuredSerializer<SeatsioTicketType> {
  @override
  final Iterable<Type> types = const [SeatsioTicketType, _$SeatsioTicketType];
  @override
  final String wireName = 'SeatsioTicketType';

  @override
  Iterable<Object?> serialize(Serializers serializers, SeatsioTicketType object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'selectedTicketType',
      serializers.serialize(object.selectedTicketType,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  SeatsioTicketType deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SeatsioTicketTypeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'selectedTicketType':
          result.selectedTicketType = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$SeatsioTicketType extends SeatsioTicketType {
  @override
  final String selectedTicketType;

  factory _$SeatsioTicketType(
          [void Function(SeatsioTicketTypeBuilder)? updates]) =>
      (new SeatsioTicketTypeBuilder()..update(updates))._build();

  _$SeatsioTicketType._({required this.selectedTicketType}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        selectedTicketType, r'SeatsioTicketType', 'selectedTicketType');
  }

  @override
  SeatsioTicketType rebuild(void Function(SeatsioTicketTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SeatsioTicketTypeBuilder toBuilder() =>
      new SeatsioTicketTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SeatsioTicketType &&
        selectedTicketType == other.selectedTicketType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, selectedTicketType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SeatsioTicketType')
          ..add('selectedTicketType', selectedTicketType))
        .toString();
  }
}

class SeatsioTicketTypeBuilder
    implements Builder<SeatsioTicketType, SeatsioTicketTypeBuilder> {
  _$SeatsioTicketType? _$v;

  String? _selectedTicketType;
  String? get selectedTicketType => _$this._selectedTicketType;
  set selectedTicketType(String? selectedTicketType) =>
      _$this._selectedTicketType = selectedTicketType;

  SeatsioTicketTypeBuilder();

  SeatsioTicketTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _selectedTicketType = $v.selectedTicketType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SeatsioTicketType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SeatsioTicketType;
  }

  @override
  void update(void Function(SeatsioTicketTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SeatsioTicketType build() => _build();

  _$SeatsioTicketType _build() {
    final _$result = _$v ??
        new _$SeatsioTicketType._(
          selectedTicketType: BuiltValueNullFieldError.checkNotNull(
              selectedTicketType, r'SeatsioTicketType', 'selectedTicketType'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
