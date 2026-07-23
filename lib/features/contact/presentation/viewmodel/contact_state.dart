import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_state.freezed.dart';

@freezed
abstract class ContactState with _$ContactState {
  const factory ContactState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
  }) = _ContactState;
}
