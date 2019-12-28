class ListItem {
  String name;
  int size;
  int sheets;
  int date;
  String id;

  ListItem(this.name, this.size, this.sheets, this.date, this.id);

  ListItem.fromJson(Map<String, dynamic> json,
      {this.name, this.size, this.sheets, this.date, this.id}) {
    name ??= json['name'];
    size ??= json['size'];
    sheets ??= json['sheets'];
    date ??= json['date'];
    id ??= json['id'];
  }

  Map<String, dynamic> toJson() =>
      {'name': name, 'size': size, 'sheets': sheets, 'date': date, 'id': id};

  @override
  String toString() {
    return 'ListItem{name: $name, size: $size, sheets: $sheets, date: $date, id: $id}';
  }
}