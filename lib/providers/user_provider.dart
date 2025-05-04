import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillwap/models/user_model.dart';
import 'package:skillwap/utils/dummy_data.dart';

// Provider for the current user
final currentUserProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier(DummyData.currentUser);
});

class UserNotifier extends StateNotifier<User> {
  UserNotifier(User user) : super(user);

  // Increase points when teaching
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

  // Decrease points when learning
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

// Provider for all users (for search and recommendations)
final allUsersProvider = Provider<List<User>>((ref) {
  return DummyData.users;
});

// Provider for past interactions
final pastInteractionsProvider = Provider<List<Interaction>>((ref) {
  return DummyData.pastInteractions;
});
