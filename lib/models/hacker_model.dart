class HackerModel {
  final String name;
  final String uid;
  final String phoneNumber;
  final String email;
  final String password;
  final String profilePicture;
  final String age;
  final String totalProjects;

//<editor-fold desc="Data Methods">

  const HackerModel({
    required this.name,
    required this.uid,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.profilePicture,
    required this.age,
    required this.totalProjects,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HackerModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          uid == other.uid &&
          phoneNumber == other.phoneNumber &&
          email == other.email &&
          password == other.password &&
          profilePicture == other.profilePicture &&
          age == other.age &&
          totalProjects == other.totalProjects);

  @override
  int get hashCode =>
      name.hashCode ^
      uid.hashCode ^
      phoneNumber.hashCode ^
      email.hashCode ^
      password.hashCode ^
      profilePicture.hashCode ^
      age.hashCode ^
      totalProjects.hashCode;

  @override
  String toString() {
    return 'HackerModel{' +
        ' name: $name,' +
        ' uid: $uid,' +
        ' phoneNumber: $phoneNumber,' +
        ' email: $email,' +
        ' password: $password,' +
        ' profilePicture: $profilePicture,' +
        ' age: $age,' +
        ' totalProjects: $totalProjects,' +
        '}';
  }

  HackerModel copyWith({
    String? name,
    String? uid,
    String? phoneNumber,
    String? email,
    String? password,
    String? profilePicture,
    String? age,
    String? totalProjects,
  }) {
    return HackerModel(
      name: name ?? this.name,
      uid: uid ?? this.uid,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      password: password ?? this.password,
      profilePicture: profilePicture ?? this.profilePicture,
      age: age ?? this.age,
      totalProjects: totalProjects ?? this.totalProjects,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'uid': this.uid,
      'phoneNumber': this.phoneNumber,
      'email': this.email,
      'password': this.password,
      'profilePicture': this.profilePicture,
      'age': this.age,
      'totalProjects': this.totalProjects,
    };
  }

  factory HackerModel.fromMap(Map<String, dynamic> map) {
    return HackerModel(
      name: map['name'] as String,
      uid: map['uid'] as String,
      phoneNumber: map['phoneNumber'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      profilePicture: map['profilePicture'] as String,
      age: map['age'] as String,
      totalProjects: map['totalProjects'] as String,
    );
  }

//</editor-fold>
}
