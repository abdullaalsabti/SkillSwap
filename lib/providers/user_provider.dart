import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillwap/models/user_model.dart';
import 'package:skillwap/utils/dummy_data.dart';



class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.user);

  void increasePoints() {
    state = User(
      id: state.id,
      name: state.name,
      email: state.email,
      avatarUrl: state.avatarUrl,
      skillsOffered: state.skillsOffered,
      skillsWanted: state.skillsWanted,
      points: state.points + 1,
      location: state.location,
    );
  }

  void decreasePoints() {
    if (state.points > 0) {
      state = User(
        id: state.id,
        name: state.name,
        email: state.email,
        avatarUrl: state.avatarUrl,
        skillsOffered: state.skillsOffered,
        skillsWanted: state.skillsWanted,
        points: state.points - 1,
        location: state.location,
      );
    }
  }
}

// State Notifier Provider for the current user (dynamic)
final currentUserProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier(DummyData.currentUser);
});

// Provider for all users (for search and recommendations - this is static)
final allUsersProvider = Provider<List<User>>((ref) {
  return DummyData.users;
});

// Provider for past interactions (this is also static)
final pastInteractionsProvider = Provider<List<Interaction>>((ref) {
  return DummyData.pastInteractions;
});
