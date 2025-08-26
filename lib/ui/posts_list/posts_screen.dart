import 'dart:async';

import 'package:auto_route/auto_route.dart';
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

  final ScrollPhysics physics = const BouncingScrollPhysics();
  late ScrollPhysics mergedPhysics =
      physics.applyTo(const AlwaysScrollableScrollPhysics());
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _loadPosts();
    super.initState();
  }

  void _loadPosts({Completer? completer}) {
    if (_searchController.text.isEmpty) {
      _postsBloc.add(LoadPostsListEvent(completer: completer));
    } else {
      _postsBloc.add(SearchPostsListEvent(
        _searchController.text,
        completer: completer,
      ));
    }
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
        child: CustomScrollView(
          physics: mergedPhysics,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  onChanged: (String value) {
                    _postsBloc.add(SearchPostsListEvent(value));
                  },
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Поиск...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            BlocBuilder<PostsListBloc, PostsListState>(
              bloc: _postsBloc,
              builder: (BuildContext context, PostsListState state) {
                if (state is LoadingPostsListState) {
                  return SliverToBoxAdapter(
                      child: const Center(child: CircularProgressIndicator()));
                }
                if (state is EmptyPostsListState) {
                  return SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3),
                        Text(
                          state.message,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )
                      ],
                    ),
                  );
                }
                if (state is LoadedPostsListState) {
                  return SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    sliver: SliverList.builder(
                      itemCount: state.post.length,
                      itemBuilder: (_, index) {
                        final Post post = state.post[index];
                        return PostCard(
                          post: post,
                          onTap: () {
                            context.router
                                .push(DetailPostRoute(postId: post.id));
                          },
                        );
                      },
                    ),
                  );
                }
                return SliverToBoxAdapter(
                  child: Center(
                    child: GestureDetector(
                      onTap: () => _loadPosts(),
                      child: const Icon(Icons.refresh),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
