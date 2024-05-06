import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingsBloc extends Bloc<SettingEvent, SettingState> {
  SettingsBloc() : super(SettingInitial()) {
    on<SettingEvent>((event, emit) {});
  }
}
