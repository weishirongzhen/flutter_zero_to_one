import 'package:event_bus/event_bus.dart';
import 'package:rxdart/rxdart.dart';

class WtfBus {
  factory WtfBus() => _getInstance();
  static WtfBus _instance;
  static EventBus _eventBus;

  WtfBus._() {
    _eventBus = EventBus.customController(PublishSubject());
  }

  static WtfBus _getInstance() {
      _instance ??= WtfBus._();
    return _instance;
  }

  void postEvent(dynamic event) {
    _eventBus.fire(Event(event));
  }

  void destroy(){
    _eventBus.destroy();
  }

  Stream<T> on<T>() {
    return _eventBus.on<T>();
  }
}

class Event<T> {
  T body;
  Event(this.body);
}
