class ListItem {
  String name;
  int size;
  int sheets;
  int date;
  String id;
  bool selfOwned;
  String owner;

  ListItem(this.name, this.size, this.sheets, this.date, this.id, this.selfOwned, this.owner);

  ListItem.fromJson(Map<String, dynamic> json,
      {this.name, this.size, this.sheets, this.date, this.id, this.selfOwned, this.owner}) {
    name ??= json['name'];
    size ??= json['size'];
    sheets ??= json['sheets'];
    date ??= json['date'];
    id ??= json['id'];
    selfOwned ??= json['selfOwned'];
    owner ??= json['owner'];
  }

  Map<String, dynamic> toJson() =>
      {'name': name, 'size': size, 'sheets': sheets, 'date': date, 'id': id, 'selfOwned': selfOwned, 'owner': owner};

  @override
  String toString() {
    return 'ListItem{name: $name, size: $size, sheets: $sheets, date: $date, id: $id, selfOwned: $selfOwned, owner: $owner}';
  }
}