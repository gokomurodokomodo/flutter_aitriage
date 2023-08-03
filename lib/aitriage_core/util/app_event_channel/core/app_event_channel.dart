import 'dart:async';
part 'app_event.dart';

class AppEventChannel {
  static AppEventChannel? _eventBus;
  final _streamController = StreamController.broadcast(sync: false);

  factory AppEventChannel() => _eventBus ??= AppEventChannel._internal();

  AppEventChannel._internal();

  ///Register listener which listen to custom event that implements IEvent
  Stream<T> on<T extends IAppEvent>() {
    return _streamController.stream.where((event) => event is T).cast<T>();
  }

  ///Fire a custom event that implements IEvent
  void addEvent<T extends IAppEvent>(T event) => _streamController.add(event);

  //avoid destroy, use only if testing
  //void destroy() => _streamController.close();
}


