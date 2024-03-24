class Tariff {
  String? id;
  String? name;
  bool? isSelected;
  List<Characteristic>? characteristics;
  List<Note>? notes;

  Tariff({this.id, this.name, this.isSelected, this.characteristics, this.notes});
}

class Note {
  String? title;
  String? description;

  Note({this.title, this.description});
}

class Characteristic {
  String? name;
  String? label;
  String? value;

  Characteristic({this.name, this.label, this.value});
}