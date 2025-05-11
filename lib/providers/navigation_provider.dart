import 'package:flutter_riverpod/flutter_riverpod.dart';



class NavigationNotifier extends StateNotifier<int> {
  NavigationNotifier() : super(1); // Start with Home tab (index 1)

  void setIndex(int index) {
    state = index;
  }
}

// Provider for the current navigation index
final navigationIndexProvider = StateNotifierProvider<NavigationNotifier, int>((ref) {
  return NavigationNotifier();
});
