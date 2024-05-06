import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationsBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationsBloc() : super(NotificationInitial()) {
    on<NotificationEvent>((event, emit) {});
  }
}
