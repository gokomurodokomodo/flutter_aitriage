import 'dart:async';

// Collecting and cancel all stream
mixin SubscriptionCollector {
  final _streamNeedToDispose = <StreamSubscription>[];

  void addToCollector(StreamSubscription stream) => _streamNeedToDispose.add(stream);

  void disposeAllStreamInCollector() {
    for (var element in _streamNeedToDispose) {
      element.cancel();
    }
  }
}