import 'package:rxdart/rxdart.dart';
import 'dart:async';

class MainController  {

  // ignore: non_constant_identifier_names
  static final MainController _mainController = MainController.private();

  MainController.private() {
    print('Create MainController');
  }

  factory MainController() {
    return _mainController;
  }

  static const int _initCounterValue = 1;
  int _counter = _initCounterValue;

  BehaviorSubject<int> counter = new BehaviorSubject<int>.seeded(_initCounterValue);
  Stream<int> get counterStream => counter.stream;

  void plusCounter() => counter.add(++_counter);

}