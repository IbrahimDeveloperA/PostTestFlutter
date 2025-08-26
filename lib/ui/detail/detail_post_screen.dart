import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/domain/models/post.dart';

import '../../app/di/get_it.dart';
import 'bloc/detail_post_bloc.dart';

@RoutePage()
class DetailPostScreen extends StatefulWidget {
  const DetailPostScreen({super.key, required this.postId});

  final int postId;

  @override
  State<DetailPostScreen> createState() => _DetailPostScreenState();
}

class _DetailPostScreenState extends State<DetailPostScreen> {
  final DetailPostBloc _detailPostBloc = getIt<DetailPostBloc>();
  final ScrollPhysics physics = const BouncingScrollPhysics();
  late ScrollPhysics mergedPhysics =
      physics.applyTo(const AlwaysScrollableScrollPhysics());

  @override
  void initState() {
    _loadPost();
    super.initState();
  }

  void _loadPost({Completer? completer}) {
    _detailPostBloc
        .add(LoadPostEvent(postId: widget.postId, completer: completer));
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Детали записи'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final Completer completer = Completer();
          _loadPost(completer: completer);
          return completer.future;
        },
        child: BlocBuilder<DetailPostBloc, DetailPostState>(
          bloc: _detailPostBloc,
          builder: (BuildContext context, DetailPostState state) {
            if (state is LoadedPostsState) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
                child: CustomScrollView(
                  physics: mergedPhysics,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                state.post.title,
                                style: theme.textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  Chip(
                                    avatar: const Icon(Icons.person, size: 18),
                                    label: Text('User ${state.post.userId}'),
                                  ),
                                  Chip(
                                    avatar: const Icon(Icons.tag, size: 18),
                                    label: Text('Post #${state.post.id}'),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              const Divider(height: 1),
                              const SizedBox(height: 16),
                              SelectableText(
                                state.post.body,
                                style: theme.textTheme.bodyLarge,
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                child: OutlinedButton.icon(
                                  onPressed: () async {
                                    await Clipboard.setData(
                                      ClipboardData(text: state.post.body),
                                    );
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('Скопировано')),
                                      );
                                    }
                                  },
                                  icon: const Icon(Icons.copy),
                                  label: const Text('Копировать'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }

            if (state is LoadingPostState) {
              return Center(child: CircularProgressIndicator());
            }
            return Center(
              child: GestureDetector(
                onTap: () => _loadPost(),
                child: Icon(Icons.refresh),
              ),
            );
          },
        ),
      ),
    );
  }
}
