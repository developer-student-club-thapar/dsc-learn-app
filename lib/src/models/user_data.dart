import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  final String userId;
  final String userName;
  final String email;
  final String profilePicUrl;
  final String? yearOfStudy;
  final String? gender;
  final String? phoneNumber;
  final String? rollNumber;
  final String? fcmId;
  final int roleId;
  final List<String>? events;

  const UserData({
    required this.userId,
    required this.userName,
    required this.email,
    required this.profilePicUrl,
    this.yearOfStudy,
    this.phoneNumber,
    this.gender,
    this.rollNumber,
    this.fcmId,
    required this.roleId,
    this.events,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
