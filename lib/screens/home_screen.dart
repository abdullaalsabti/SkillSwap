import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:skillwap/models/user_model.dart';
import 'package:skillwap/providers/user_provider.dart';
import 'package:skillwap/theme/app_theme.dart';
import 'package:skillwap/utils/dummy_data.dart';
import 'package:intl/intl.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pastInteractions = ref.watch(pastInteractionsProvider);
    final recommendedTeachers = DummyData.users.where((user) => 
      user.id != DummyData.currentUser.id).toList();
    
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App Bar
            SliverAppBar(
              floating: true,
              pinned: true,
              title: const Text(
                'SkillSwap',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.notifications_outlined),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.message_outlined),
                  onPressed: () {},
                ),
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for skills or teachers',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    ),
                  ),
                ),
              ),
            ),
            
            // Content
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // Welcome message
                  Text(
                    'Welcome back, ${DummyData.currentUser.name.split(' ')[0]}!',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'You have ${DummyData.currentUser.points} points to spend on learning',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Past Interactions
                  const Text(
                    'Past Interactions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Past Interactions List
                  pastInteractions.isEmpty
                      ? const Center(
                          child: Text(
                            'No past interactions yet',
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      : Column(
                          children: pastInteractions.map((interaction) {
                            return _buildInteractionCard(interaction);
                          }).toList(),
                        ),
                  
                  const SizedBox(height: 24),
                  
                  // Recommended Teachers
                  const Text(
                    'Recommended Teachers',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                ]),
              ),
            ),
            
            // Recommended Teachers Grid
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return _buildTeacherCard(recommendedTeachers[index]);
                  },
                  childCount: recommendedTeachers.length,
                ),
              ),
            ),
            
            const SliverToBoxAdapter(
              child: SizedBox(height: 24),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInteractionCard(Interaction interaction) {
    final dateFormat = DateFormat('MMM d, yyyy');
    final formattedDate = dateFormat.format(interaction.date);
    
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: CachedNetworkImageProvider(
                interaction.teacher.id == DummyData.currentUser.id
                    ? interaction.learner.avatarUrl
                    : interaction.teacher.avatarUrl,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    interaction.teacher.id == DummyData.currentUser.id
                        ? 'You taught ${interaction.learner.name}'
                        : 'You learned from ${interaction.teacher.name}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    interaction.skill.name,
                    style: TextStyle(
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    formattedDate,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              interaction.teacher.id == DummyData.currentUser.id
                  ? Icons.arrow_upward
                  : Icons.arrow_downward,
              color: interaction.teacher.id == DummyData.currentUser.id
                  ? Colors.green
                  : Colors.red,
            ),
            const SizedBox(width: 4),
            Text(
              interaction.teacher.id == DummyData.currentUser.id ? '+1' : '-1',
              style: TextStyle(
                color: interaction.teacher.id == DummyData.currentUser.id
                    ? Colors.green
                    : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeacherCard(User teacher) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Teacher image
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(teacher.avatarUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          
          // Teacher info
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    teacher.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    teacher.skillsOffered.map((s) => s.name).join(', '),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${(3.5 + teacher.id.hashCode % 15 / 10).toStringAsFixed(1)}/5.0',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
