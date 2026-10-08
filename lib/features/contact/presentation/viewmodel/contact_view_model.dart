import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teknolup/features/contact/data/repositories/contact_repository_impl.dart';
import 'package:teknolup/features/contact/presentation/viewmodel/contact_state.dart';

class ContactViewModel extends Notifier<ContactState> {
  @override
  ContactState build() => const ContactState();

  Future<void> submitForm(String name, String email, String message) async {
    state = state.copyWith(isLoading: true, isSuccess: false);
    try {
      final success = await ref
          .read(contactRepositoryProvider)
          .sendMessage(name: name, email: email, message: message);
      state = state.copyWith(isLoading: false, isSuccess: success);
    } catch (_) {
      state = state.copyWith(isLoading: false, isSuccess: false);
    }
  }

  void resetSuccess() {
    state = state.copyWith(isSuccess: false);
  }
}

final contactViewModelProvider =
    NotifierProvider<ContactViewModel, ContactState>(ContactViewModel.new);
