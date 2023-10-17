import 'package:json_annotation/json_annotation.dart';

part 'income.g.dart';

@JsonSerializable()
class Income {
  const Income({
    required this.amount,
    required this.description,
  });
  final int amount;
  final String description;

  factory Income.fromJson(Map<String, dynamic> json) => _$IncomeFromJson(json);

  Map<String, dynamic> toJson() => _$IncomeToJson(this);
}
