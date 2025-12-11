import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter/data/services/api_service.dart';

// State to hold loading status
class ContactState {
  final bool isLoading;
  final bool isSuccess;

  ContactState({this.isLoading = false, this.isSuccess = false});

  ContactState copyWith({bool? isLoading, bool? isSuccess}) {
    return ContactState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}

// Notifier to handle logic
class ContactNotifier extends StateNotifier<ContactState> {
  final Ref ref;

  ContactNotifier(this.ref) : super(ContactState());

  Future<void> submitForm(String name, String email, String message) async {
    state = state.copyWith(isLoading: true, isSuccess: false);

    try {
      final apiService = ref.read(apiServiceProvider);
      // Simulate/Make API call
      bool success = await apiService.sendContactMessage({
        'name': name,
        'email': email,
        'message': message,
      });

      if (success) {
        state = state.copyWith(isLoading: false, isSuccess: true);
      } else {
        state = state.copyWith(isLoading: false, isSuccess: false);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, isSuccess: false);
    }
  }

  void resetSuccess() {
    state = state.copyWith(isSuccess: false);
  }
}

// Provider definition
final contactProvider = StateNotifierProvider<ContactNotifier, ContactState>((
  ref,
) {
  return ContactNotifier(ref);
});
