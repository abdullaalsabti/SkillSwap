class User {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final List<Skill> skillsOffered;
  final List<Skill> skillsWanted;
  final int points;
  final String location;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.skillsOffered,
    required this.skillsWanted,
    required this.points,
    required this.location,
  });
}

class Skill {
  final String id;
  final String name;
  final String description;
  final String category;

  Skill({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
  });
}

class Interaction {
  final String id;
  final User teacher;
  final User learner;
  final Skill skill;
  final DateTime date;
  final bool isCompleted;

  Interaction({
    required this.id,
    required this.teacher,
    required this.learner,
    required this.skill,
    required this.date,
    required this.isCompleted,
  });
}
