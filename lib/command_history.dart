import 'dart:collection';

import 'package:memento_design_pattern/icommand.dart';

/// A simple class that stores a list of already executed
/// commands.
class CommandHistory {
  final ListQueue<ICommand> _commandList = ListQueue<ICommand>();

  /// A getter that returns true is commandList isEmpty
  bool get isEmpty => _commandList.isEmpty;

  /// Add a new command to the command history list.
  void add(ICommand command) {
    _commandList.add(command);
  }

  /// Last command could be undone using the `undo()` method if
  /// the commandList is not empty.
  void undo() {
    if (_commandList.isNotEmpty) {
      final command = _commandList.removeLast();
      command.undo();
    }
  }
}
