import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:memento_design_pattern/icommand.dart';
import 'package:memento_design_pattern/imemento.dart';
import 'package:memento_design_pattern/originator.dart';

/// A specific implementation of the command that sets all the
/// properties of the [Shape] object stored in the [Originator]
/// to random value.
/// Also, the class implements the `undo` operation.
class RandomisePropertiesCommand implements ICommand {
  final Originator originator;
  late final IMemento _backup;

  RandomisePropertiesCommand(this.originator) {
    _backup = originator.createMemento();
  }

  @override
  void execute() {
    final shape = originator.state;
    shape.color = Color.fromRGBO(
      random.integer(255),
      random.integer(255),
      random.integer(255),
      1.0,
    );
    shape.height = random.integer(150, min: 50).toDouble();
    shape.width = random.integer(150, min: 50).toDouble();
  }

  @override
  void undo() {
    originator.restore(_backup);
  }
}
