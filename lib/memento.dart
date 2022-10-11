import 'package:memento_design_pattern/imemento.dart';
import 'package:memento_design_pattern/shape.dart';

/// An implementation of the [IMemento] interface which
/// stores the snapshot of [Originator]'s internal state([Shape]
/// object).
class Memento extends IMemento {
  late final Shape _state;
  Memento(Shape shape) {
    _state = Shape.copy(shape);
  }

  /// The state of the [Originator] is accessible via `getState`.
  @override
  Shape getState() {
    return _state;
  }
}
