import 'package:skillwap/models/user_model.dart';

class DummyData {
  static List<Skill> skills = [
    Skill(
      id: '1',
      name: 'Guitar',
      description: 'Learn to play guitar from beginner to intermediate',
      category: 'Music',
    ),
    Skill(
      id: '2',
      name: 'Python Programming',
      description: 'Learn Python programming for beginners',
      category: 'Technology',
    ),
    Skill(
      id: '3',
      name: 'Yoga',
      description: 'Basic yoga poses and meditation techniques',
      category: 'Fitness',
    ),
    Skill(
      id: '4',
      name: 'French Language',
      description: 'Learn conversational French',
      category: 'Languages',
    ),
    Skill(
      id: '5',
      name: 'Digital Photography',
      description: 'Learn composition and editing techniques',
      category: 'Arts',
    ),
    Skill(
      id: '6',
      name: 'Cooking',
      description: 'Learn to cook various cuisines',
      category: 'Food',
    ),
  ];

  static List<User> users = [
    User(
      id: '1',
      name: 'Abdulla Al-Sabti',
      email: 'abdulla.sabti@example.com',
      avatarUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
      skillsOffered: [skills[0], skills[3]],
      skillsWanted: [skills[1], skills[2]],
      points: 5,
      location: 'Baghdad',
    ),
    User(
      id: '2',
      name: 'Saad Alnobani',
      email: 'saad.alnobani@example.com',
      avatarUrl: 'https://randomuser.me/api/portraits/men/2.jpg',
      skillsOffered: [skills[1], skills[4]],
      skillsWanted: [skills[0], skills[5]],
      points: 3,
      location: 'Amman',
    ),
    User(
      id: '3',
      name: 'Omar Tahboub',
      email: 'Omar.tahboub@example.com',
      avatarUrl: 'https://randomuser.me/api/portraits/men/3.jpg',
      skillsOffered: [skills[2], skills[5]],
      skillsWanted: [skills[3], skills[4]],
      points: 7,
      location: 'Amman',
    ),
    User(
      id: '4',
      name: 'Ahmad Mahmoud',
      email: 'Ahmad@example.com',
      avatarUrl: 'https://randomuser.me/api/portraits/men/4.jpg',
      skillsOffered: [skills[3], skills[1]],
      skillsWanted: [skills[0], skills[2]],
      points: 2,
      location: 'Irbid',
    ),
    User(
      id: '5',
      name: 'Lara Mahameed',
      email: 'Lara.M@example.com',
      avatarUrl: 'https://randomuser.me/api/portraits/women/5.jpg',
      skillsOffered: [skills[4], skills[0]],
      skillsWanted: [skills[1], skills[5]],
      points: 4,
      location: 'Amman',
    ),
  ];

  static List<Interaction> pastInteractions = [
    Interaction(
      id: '1',
      teacher: users[0],
      learner: users[1],
      skill: skills[0],
      date: DateTime.now().subtract(const Duration(days: 5)),
      isCompleted: true,
    ),
    Interaction(
      id: '2',
      teacher: users[2],
      learner: users[0],
      skill: skills[2],
      date: DateTime.now().subtract(const Duration(days: 10)),
      isCompleted: true,
    ),
    Interaction(
      id: '3',
      teacher: users[1],
      learner: users[3],
      skill: skills[1],
      date: DateTime.now().subtract(const Duration(days: 15)),
      isCompleted: true,
    ),
    Interaction(
      id: '4',
      teacher: users[3],
      learner: users[4],
      skill: skills[3],
      date: DateTime.now().subtract(const Duration(days: 20)),
      isCompleted: true,
    ),
  ];

  // Current logged in user (for simulation)
  static User currentUser = users[0];
}
