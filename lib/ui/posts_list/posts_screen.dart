import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/domain/models/post.dart';
import 'package:test_flutter/router/app_router.gr.dart';
import 'package:test_flutter/ui/posts_list/widgets/post_card.dart';

import '../../app/di/get_it.dart';
import 'bloc/posts_list_bloc.dart';

@RoutePage()
class PostsListScreen extends StatefulWidget {
  const PostsListScreen({super.key});

  @override
  State<PostsListScreen> createState() => _PostsListScreenState();
}

class _PostsListScreenState extends State<PostsListScreen> {
  final PostsListBloc _postsBloc = getIt<PostsListBloc>();

  @override
  void initState() {
    _loadPosts();
    super.initState();
  }

  void _loadPosts({Completer? completer}) {
    _postsBloc.add(LoadPostsListEvent(completer: completer));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Записи')),
      body: RefreshIndicator(
        onRefresh: () async {
          final Completer completer = Completer();
          _loadPosts(completer: completer);
          return completer.future;
        },
        child: BlocBuilder<PostsListBloc, PostsListState>(
          bloc: _postsBloc,
          builder: (BuildContext context, PostsListState state) {
            if (state is LoadingPostsListState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is LoadedPostsListState) {
              return ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                itemCount: state.post.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (_, index) {
                  final Post post = state.post[index];
                  return PostCard(
                    post: post,
                    onTap: () {
                      context.router.push(DetailPostRoute(postId: post.id));
                    },
                  );
                },
              );
            }
            return Center(
              child: GestureDetector(
                onTap: () => _loadPosts(),
                child: Icon(Icons.refresh),
              ),
            );
          },
        ),
      ),
    );
  }
}
