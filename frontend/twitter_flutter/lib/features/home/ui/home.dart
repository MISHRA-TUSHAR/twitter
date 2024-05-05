import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_flutter/features/home/bloc/home_bloc.dart';
import 'package:twitter_flutter/features/home/utils/post_card.dart';
import 'package:twitter_flutter/models/post.dart';
import 'package:twitter_flutter/widgets/loading.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = HomeBloc();
    homeBloc.add(InitialEvent());
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: homeBloc,
        builder: (context, state) {
          switch (state.runtimeType) {
            case HomeLoadingState:
              return const Loading();
            case HomeLoadingErrorState:
              return const Loading();
            case HomeInitialSuccessState:
              final List<Post> posts = (state as HomeInitialSuccessState).posts;
              debugPrint(posts.length.toString());
              debugPrint(posts.length.toString());
              return ListView.separated(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return PostCardWidget(
                    post: posts[index],
                  );
                },
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(color: Colors.grey[800], thickness: 0.5),
                ),
              );
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
