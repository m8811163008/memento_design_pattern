import 'package:memento_design_pattern/imemento.dart';
import 'package:memento_design_pattern/memento.dart';
import 'package:memento_design_pattern/shape.dart';

/// A class that defines a `createMemento()` method to save
/// the current internal state to a [Memento] object.
class Originator {
  late Shape state;

  Originator() {
    state = Shape.initial();
  }

  IMemento createMemento() {
    return Memento(state);
  }

  void restore(IMemento memento) {
    state = memento.getState();
  }
}
