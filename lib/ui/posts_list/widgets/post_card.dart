import 'package:flutter/material.dart';
import 'package:test_flutter/domain/models/post.dart';

class PostCard extends StatelessWidget {
  final VoidCallback? onTap;
  final Post post;

  const PostCard({super.key, this.onTap, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue.withOpacity(0.2),
            child: Icon(Icons.event_note, color: Colors.blue),
          ),
          title: Text(
            post.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Text(
            post.body,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: const Icon(Icons.chevron_right),
          onTap: onTap,
        ),
      ),
    );
  }
}
