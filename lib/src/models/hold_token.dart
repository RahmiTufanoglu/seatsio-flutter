class HoldToken {
  const HoldToken({
    required this.holdToken,
    required this.expiresAt,
    required this.expiresInSeconds,
  });

  final String? holdToken;
  final DateTime? expiresAt;
  final int? expiresInSeconds;

  factory HoldToken.fromJson(Map<String, dynamic> json) {
    return HoldToken(
      holdToken: json['token'] as String?,
      expiresAt: json['expiresAt'] == null ? null : DateTime.parse(json['expiresAt'] as String),
      expiresInSeconds: json['expiresInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'holdToken': holdToken,
      'expiresAt': expiresAt?.toIso8601String(),
      'expiresInSeconds': expiresInSeconds,
    };
  }

  HoldToken copyWith({
    String? token,
    DateTime? expiresAt,
    int? expiresInSeconds,
  }) {
    return HoldToken(
      holdToken: token ?? this.holdToken,
      expiresAt: expiresAt ?? this.expiresAt,
      expiresInSeconds: expiresInSeconds ?? this.expiresInSeconds,
    );
  }

  @override
  String toString() {
    return 'HoldToken(holdToken: $holdToken, expiresAt: $expiresAt, expiresInSeconds: $expiresInSeconds)';
  }
}
