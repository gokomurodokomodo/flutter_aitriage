import 'package:flutter_aitriage/aitriage_core/util/app_event_channel/core/app_event_channel.dart';

class FinishGettingListLocation implements IAppEvent<bool> {
  @override
  bool data;

  FinishGettingListLocation(this.data);
}