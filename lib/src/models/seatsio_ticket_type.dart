import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'seatsio_ticket_type.g.dart';

abstract class SeatsioTicketType implements Built<SeatsioTicketType, SeatsioTicketTypeBuilder> {
  const SeatsioTicketType._();

  factory SeatsioTicketType([updates(SeatsioTicketTypeBuilder b)]) = _$SeatsioTicketType;

  String get selectedTicketType;

  static Serializer<SeatsioTicketType> get serializer => _$seatsioTicketTypeSerializer;

  static SeatsioTicketType? fromJson(String jsonString) {
    final data = json.decode(jsonString);
    if (data != null) return SeatsioTicketType.fromMap(data);
    return null;
  }

  static SeatsioTicketType? fromMap(Map? data) {
    if (data?["selectedTicketType"] == null) return null;
    return SeatsioTicketType(
      (b) => b..selectedTicketType = data!["selectedTicketType"],
    );
  }

  static List<SeatsioTicketType>? arrayFromJson(String jsonString) {
    final data = json.decode(jsonString);
    if (data is List) {
      final List<SeatsioTicketType> objects = [];
      data.forEach((e) {
        final object = SeatsioTicketType.fromMap(e);
        if (object != null) {
          objects.add(object);
        }
      });
      return objects;
    }
    return null;
  }
}
