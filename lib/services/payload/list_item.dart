class ListItem {
  String name;
  int size;
  int sheets;
  int date;
  String id;
  bool selfOwned;
  String owner;
  String driveLink;

  ListItem(this.name, this.size, this.sheets, this.date, this.id, this.selfOwned, this.owner, this.driveLink);

  ListItem.fromJson(Map<String, dynamic> json,
      {this.name, this.size, this.sheets, this.date, this.id, this.selfOwned, this.owner, this.driveLink}) {
    name ??= json['name'];
    size ??= json['size'];
    sheets ??= json['sheets'];
    date ??= json['date'];
    id ??= json['id'];
    selfOwned ??= json['selfOwned'];
    owner ??= json['owner'];
    driveLink ??= json['driveLink'];
  }

  Map<String, dynamic> toJson() =>
      {'name': name, 'size': size, 'sheets': sheets, 'date': date, 'id': id, 'selfOwned': selfOwned, 'owner': owner, 'driveLink': driveLink};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListItem && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'ListItem{name: $name, size: $size, sheets: $sheets, date: $date, id: $id, selfOwned: $selfOwned, owner: $owner, driveLink: $driveLink}';
  }
}