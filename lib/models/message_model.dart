class MessageModel {
  final String message;
  final String senderUid;
  final String senderName;
  final String profilePicture;

//<editor-fold desc="Data Methods">

  const MessageModel({
    required this.message,
    required this.senderUid,
    required this.senderName,
    required this.profilePicture,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MessageModel &&
          runtimeType == other.runtimeType &&
          message == other.message &&
          senderUid == other.senderUid &&
          senderName == other.senderName &&
          profilePicture == other.profilePicture);

  @override
  int get hashCode =>
      message.hashCode ^
      senderUid.hashCode ^
      senderName.hashCode ^
      profilePicture.hashCode;

  @override
  String toString() {
    return 'MessageModel{' +
        ' message: $message,' +
        ' senderUid: $senderUid,' +
        ' senderName: $senderName,' +
        ' profilePicture: $profilePicture,' +
        '}';
  }

  MessageModel copyWith({
    String? message,
    String? senderUid,
    String? senderName,
    String? profilePicture,
  }) {
    return MessageModel(
      message: message ?? this.message,
      senderUid: senderUid ?? this.senderUid,
      senderName: senderName ?? this.senderName,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': this.message,
      'senderUid': this.senderUid,
      'senderName': this.senderName,
      'profilePicture': this.profilePicture,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      message: map['message'] as String,
      senderUid: map['senderUid'] as String,
      senderName: map['senderName'] as String,
      profilePicture: map['profilePicture'] as String,
    );
  }

//</editor-fold>
}
