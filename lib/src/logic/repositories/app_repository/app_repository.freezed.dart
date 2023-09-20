// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppState {
  User? get authUser => throw _privateConstructorUsedError;
  UserData? get userData => throw _privateConstructorUsedError;
  AppStatus get status => throw _privateConstructorUsedError;
  DateTime? get lastFcmIDUpdatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {User? authUser,
      UserData? userData,
      AppStatus status,
      DateTime? lastFcmIDUpdatedAt});
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authUser = freezed,
    Object? userData = freezed,
    Object? status = null,
    Object? lastFcmIDUpdatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      authUser: freezed == authUser
          ? _value.authUser
          : authUser // ignore: cast_nullable_to_non_nullable
              as User?,
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserData?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppStatus,
      lastFcmIDUpdatedAt: freezed == lastFcmIDUpdatedAt
          ? _value.lastFcmIDUpdatedAt
          : lastFcmIDUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$$_AppStateCopyWith(
          _$_AppState value, $Res Function(_$_AppState) then) =
      __$$_AppStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User? authUser,
      UserData? userData,
      AppStatus status,
      DateTime? lastFcmIDUpdatedAt});
}

/// @nodoc
class __$$_AppStateCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$_AppState>
    implements _$$_AppStateCopyWith<$Res> {
  __$$_AppStateCopyWithImpl(
      _$_AppState _value, $Res Function(_$_AppState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authUser = freezed,
    Object? userData = freezed,
    Object? status = null,
    Object? lastFcmIDUpdatedAt = freezed,
  }) {
    return _then(_$_AppState(
      authUser: freezed == authUser
          ? _value.authUser
          : authUser // ignore: cast_nullable_to_non_nullable
              as User?,
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserData?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppStatus,
      lastFcmIDUpdatedAt: freezed == lastFcmIDUpdatedAt
          ? _value.lastFcmIDUpdatedAt
          : lastFcmIDUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_AppState with DiagnosticableTreeMixin implements _AppState {
  const _$_AppState(
      {this.authUser = null,
      this.userData = null,
      this.status = AppStatus.initial,
      this.lastFcmIDUpdatedAt = null});

  @override
  @JsonKey()
  final User? authUser;
  @override
  @JsonKey()
  final UserData? userData;
  @override
  @JsonKey()
  final AppStatus status;
  @override
  @JsonKey()
  final DateTime? lastFcmIDUpdatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppState(authUser: $authUser, userData: $userData, status: $status, lastFcmIDUpdatedAt: $lastFcmIDUpdatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppState'))
      ..add(DiagnosticsProperty('authUser', authUser))
      ..add(DiagnosticsProperty('userData', userData))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('lastFcmIDUpdatedAt', lastFcmIDUpdatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppState &&
            (identical(other.authUser, authUser) ||
                other.authUser == authUser) &&
            (identical(other.userData, userData) ||
                other.userData == userData) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lastFcmIDUpdatedAt, lastFcmIDUpdatedAt) ||
                other.lastFcmIDUpdatedAt == lastFcmIDUpdatedAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, authUser, userData, status, lastFcmIDUpdatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      __$$_AppStateCopyWithImpl<_$_AppState>(this, _$identity);
}

abstract class _AppState implements AppState {
  const factory _AppState(
      {final User? authUser,
      final UserData? userData,
      final AppStatus status,
      final DateTime? lastFcmIDUpdatedAt}) = _$_AppState;

  @override
  User? get authUser;
  @override
  UserData? get userData;
  @override
  AppStatus get status;
  @override
  DateTime? get lastFcmIDUpdatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      throw _privateConstructorUsedError;
}
