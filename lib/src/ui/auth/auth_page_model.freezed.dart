// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthPageState {
  AuthPageStatus get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthPageStateCopyWith<AuthPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthPageStateCopyWith<$Res> {
  factory $AuthPageStateCopyWith(
          AuthPageState value, $Res Function(AuthPageState) then) =
      _$AuthPageStateCopyWithImpl<$Res, AuthPageState>;
  @useResult
  $Res call({AuthPageStatus status, String? errorMessage});
}

/// @nodoc
class _$AuthPageStateCopyWithImpl<$Res, $Val extends AuthPageState>
    implements $AuthPageStateCopyWith<$Res> {
  _$AuthPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthPageStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthPageStateCopyWith<$Res>
    implements $AuthPageStateCopyWith<$Res> {
  factory _$$_AuthPageStateCopyWith(
          _$_AuthPageState value, $Res Function(_$_AuthPageState) then) =
      __$$_AuthPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthPageStatus status, String? errorMessage});
}

/// @nodoc
class __$$_AuthPageStateCopyWithImpl<$Res>
    extends _$AuthPageStateCopyWithImpl<$Res, _$_AuthPageState>
    implements _$$_AuthPageStateCopyWith<$Res> {
  __$$_AuthPageStateCopyWithImpl(
      _$_AuthPageState _value, $Res Function(_$_AuthPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_AuthPageState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthPageStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AuthPageState with DiagnosticableTreeMixin implements _AuthPageState {
  const _$_AuthPageState(
      {this.status = AuthPageStatus.initial, this.errorMessage});

  @override
  @JsonKey()
  final AuthPageStatus status;
  @override
  final String? errorMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthPageState(status: $status, errorMessage: $errorMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthPageState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('errorMessage', errorMessage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthPageState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthPageStateCopyWith<_$_AuthPageState> get copyWith =>
      __$$_AuthPageStateCopyWithImpl<_$_AuthPageState>(this, _$identity);
}

abstract class _AuthPageState implements AuthPageState {
  const factory _AuthPageState(
      {final AuthPageStatus status,
      final String? errorMessage}) = _$_AuthPageState;

  @override
  AuthPageStatus get status;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_AuthPageStateCopyWith<_$_AuthPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
