import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'community_event.dart';
part 'community_state.dart';

class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  CommunityBloc() : super(CommunityInitial()) {
    on<CommunityEvent>((event, emit) {});
  }
}
