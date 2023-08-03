import '../custom_event/finish_init_event.dart';
import '../core/app_event_channel.dart';

void example()  {
  final appEventChannel = AppEventChannel();

  appEventChannel.on<FinishInitEvent>().listen((event) {
  });

  appEventChannel.addEvent(FinishInitEvent('login'));

  appEventChannel.on<IAppEvent>().listen((event) {
  });
}