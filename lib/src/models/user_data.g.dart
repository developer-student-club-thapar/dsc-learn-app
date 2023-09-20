// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
      profilePicUrl: json['profilePicUrl'] as String,
      yearOfStudy: json['yearOfStudy'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      gender: json['gender'] as String?,
      rollNumber: json['rollNumber'] as String?,
      fcmId: json['fcmId'] as String?,
      roleId: json['roleId'] as int,
      events:
          (json['events'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'email': instance.email,
      'profilePicUrl': instance.profilePicUrl,
      'yearOfStudy': instance.yearOfStudy,
      'gender': instance.gender,
      'phoneNumber': instance.phoneNumber,
      'rollNumber': instance.rollNumber,
      'fcmId': instance.fcmId,
      'roleId': instance.roleId,
      'events': instance.events,
    };
