class Address {
  final int number;
  final String street;
  final String town;
  final String state;
  final int zip;

  Address(this.number, this.street, this.town, this.state, this.zip);

  Address.fromJson(Map<String, dynamic> json)
      : number = json['number'],
        street = json['street'],
        town = json['town'],
        state = json['state'],
        zip = json['zip'];

  Map<String, dynamic> toJson() => {
        'number': number,
        'street': street,
        'town': town,
        'state': state,
        'zip': zip
      };
}
