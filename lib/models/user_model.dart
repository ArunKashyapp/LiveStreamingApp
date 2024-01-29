import 'dart:convert';

class User {
  final String uid;
  final String userName;
  final String email;
  User({
    required this.uid,
    required this.userName,
    required this.email,
  });
  

  User copyWith({
    String? uid,
    String? userName,
    String? email,
  }) {
    return User(
      uid: uid ?? this.uid,
      userName: userName ?? this.userName,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'uid': uid});
    result.addAll({'userName': userName});
    result.addAll({'email': email});
  
    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] ?? '',
      userName: map['userName'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(uid: $uid, userName: $userName, email: $email)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
      other.uid == uid &&
      other.userName == userName &&
      other.email == email;
  }

  @override
  int get hashCode => uid.hashCode ^ userName.hashCode ^ email.hashCode;
}
