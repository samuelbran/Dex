import 'default_model.dart';

class Ability extends DefaultModel {
  bool isHidden;

  Ability(
    super.name,
    super.url,
    this.isHidden,
  );

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      json['ability']['name'],
      json['ability']['url'],
      json['is_hidden'],
    );
  }
}
