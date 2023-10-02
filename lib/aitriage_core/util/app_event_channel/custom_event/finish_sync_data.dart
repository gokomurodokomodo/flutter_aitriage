import 'package:flutter_aitriage/aitriage_core/util/app_event_channel/core/app_event_channel.dart';

class FinishSyncData implements IAppEvent<bool> {
  @override
  bool data;

  FinishSyncData(this.data);
}