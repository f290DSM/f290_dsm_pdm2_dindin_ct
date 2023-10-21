import 'dart:convert' as json;

class CurrencyModel {
  String? name;
  double? buy;
  double? sell;
  double? variation;

  CurrencyModel({
    required this.name,
    required this.buy,
    required this.sell,
    required this.variation,
  });

  factory CurrencyModel.fromMap(Map<String, dynamic> map) {
    return CurrencyModel(
        name: map['name'] ?? '',
        buy: map['buy'] ?? 0.0,
        sell: map['sell'] ?? 0.0,
        variation: map['variation'] ?? 0.0);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'buy': buy,
      'sell': sell,
      'variation': variation,
    };
  }

  String toJson() => json.jsonEncode(toMap());

  factory CurrencyModel.fromJson(String pJson) =>
      CurrencyModel.fromMap(json.jsonDecode(pJson));
}
