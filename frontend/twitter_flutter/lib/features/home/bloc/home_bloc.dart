import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_flutter/features/home/apis/apis.dart';
import 'package:twitter_flutter/models/post.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeLoadingEvent>(loadingState);
    on<InitialEvent>(initialApiCallState);
  }

  FutureOr<void> loadingState(
      HomeLoadingEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> initialApiCallState(
      InitialEvent event, Emitter<HomeState> emit) async {
    debugPrint("Hello World!");
    emit(HomeLoadingState());
    List<Post>? posts = await ApiService.getAllPosts();
    if (posts == null) {
      emit(HomeLoadingErrorState());
    } else if (posts.isNotEmpty) {
      emit(HomeInitialSuccessState(posts: posts));
    }
  }
}
