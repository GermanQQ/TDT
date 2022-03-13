class UserModel {
  String? name;
  String? email;
  String? uid;
  UserModel({this.name, this.email, this.uid});

  factory UserModel.fromMap(map) {
    return UserModel(
      email: map['email'],
      name: map['name'],
      uid: map['uid'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'uid': uid,
    };
  }

  UserModel coppyWith({String? name, String? email, String? uid}) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
      uid: uid ?? this.uid,
    );
  }
}
