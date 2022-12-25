class ProjectModel {
  final String name;
  final String description;
  final bool award;
  final String githubLink;
  final String image;
  final String userUid;
  final String upvotes;
  final String userName;
  final String email;
  final String profilePicture;

//<editor-fold desc="Data Methods">

  const ProjectModel({
    required this.name,
    required this.description,
    required this.award,
    required this.githubLink,
    required this.image,
    required this.userUid,
    required this.upvotes,
    required this.userName,
    required this.email,
    required this.profilePicture,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          description == other.description &&
          award == other.award &&
          githubLink == other.githubLink &&
          image == other.image &&
          userUid == other.userUid &&
          upvotes == other.upvotes &&
          userName == other.userName &&
          email == other.email &&
          profilePicture == other.profilePicture);

  @override
  int get hashCode =>
      name.hashCode ^
      description.hashCode ^
      award.hashCode ^
      githubLink.hashCode ^
      image.hashCode ^
      userUid.hashCode ^
      upvotes.hashCode ^
      userName.hashCode ^
      email.hashCode ^
      profilePicture.hashCode;

  @override
  String toString() {
    return 'ProjectModel{' +
        ' name: $name,' +
        ' description: $description,' +
        ' award: $award,' +
        ' githubLink: $githubLink,' +
        ' image: $image,' +
        ' userUid: $userUid,' +
        ' upvotes: $upvotes,' +
        ' userName: $userName,' +
        ' email: $email,' +
        ' profilePicture: $profilePicture,' +
        '}';
  }

  ProjectModel copyWith({
    String? name,
    String? description,
    bool? award,
    String? githubLink,
    String? image,
    String? userUid,
    String? upvotes,
    String? userName,
    String? email,
    String? profilePicture,
  }) {
    return ProjectModel(
      name: name ?? this.name,
      description: description ?? this.description,
      award: award ?? this.award,
      githubLink: githubLink ?? this.githubLink,
      image: image ?? this.image,
      userUid: userUid ?? this.userUid,
      upvotes: upvotes ?? this.upvotes,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'description': this.description,
      'award': this.award,
      'githubLink': this.githubLink,
      'image': this.image,
      'userUid': this.userUid,
      'upvotes': this.upvotes,
      'userName': this.userName,
      'email': this.email,
      'profilePicture': this.profilePicture,
    };
  }

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      name: map['name'] as String,
      description: map['description'] as String,
      award: map['award'] as bool,
      githubLink: map['githubLink'] as String,
      image: map['image'] as String,
      userUid: map['userUid'] as String,
      upvotes: map['upvotes'] as String,
      userName: map['userName'] as String,
      email: map['email'] as String,
      profilePicture: map['profilePicture'] as String,
    );
  }

//</editor-fold>
}
