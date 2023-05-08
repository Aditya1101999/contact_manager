class Contact {
  String id;
  String name;
  String email;
  String phone;

  Contact({required this.id, required this.name,required this.email,required this.phone});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
    };
  }

  factory Contact.fromMap(String id, Map<String, dynamic> map) {
    return Contact(
      id: id,
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
    );
  }
}
