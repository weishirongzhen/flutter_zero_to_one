import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

///对EventBus重新做简单封装
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

  void destroy() {
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

mixin WtfBusEventMixin<T extends StatefulWidget> on State<T> {
  StreamSubscription _subscription;

  @mustCallSuper
  @override
  void initState() {
    super.initState();
    _subscription = WtfBus().on<Event>().listen((event) {
      onEvent(event);
    })
      ..onError((error) {});
  }

  void onEvent(Event event);

  @mustCallSuper
  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
