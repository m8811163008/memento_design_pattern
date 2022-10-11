import 'package:memento_design_pattern/shape.dart';

/// An interface that defines the `getState()`
/// method to be implemented by the specific
/// [Memento] class
abstract class IMemento {
  Shape getState();
}
