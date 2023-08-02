import 'dart:async';

// Collecting and cancel all stream
mixin StreamCollector {
  final _streamNeedToDispose = <StreamSubscription>[];

  void _addToCollector(StreamSubscription stream) => _streamNeedToDispose.add(stream);

  void _disposeAllStreamInCollector() {
    for (var element in _streamNeedToDispose) {
      element.cancel();
    }
  }
}