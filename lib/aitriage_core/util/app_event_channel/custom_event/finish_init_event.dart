import '../core/app_event_channel.dart';

class FinishInitEvent implements IAppEvent<String> {
  @override
  String data;

  FinishInitEvent(this.data);
}