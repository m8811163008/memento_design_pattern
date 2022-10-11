import 'package:flutter/material.dart';
import 'package:memento_design_pattern/command_history.dart';
import 'package:memento_design_pattern/icommand.dart';
import 'package:memento_design_pattern/originator.dart';
import 'package:memento_design_pattern/platform_button.dart';
import 'package:memento_design_pattern/randomise_properties_command.dart';
import 'package:memento_design_pattern/shape_container.dart';

/// [MementoExample] contains [CommandHistory] and [Originator]
/// objects.
/// The client code(UI elements, command history, etc.) is not
/// coupled to any specific command class because it works with it
/// via the [ICommand] interface.
///
/// The Memento design pattern adds an additional layer to the
/// example's state. It is stored inside the [Originator] object,
/// the command itself does not mutate the state directly but
/// through the [Originator].
class MementoExample extends StatefulWidget {
  const MementoExample({Key? key}) : super(key: key);

  @override
  State<MementoExample> createState() => _MementoExampleState();
}

class _MementoExampleState extends State<MementoExample> {
  final CommandHistory _commandHistory = CommandHistory();
  final Originator _originator = Originator();
  // To randomise property values of the shape, used by
  // `PlatformButton` component.After execute command, it is
  // added to the command history list stored in the
  // `CommandHistory` object.
  void _randomiseProperties() {
    final command = RandomisePropertiesCommand(_originator);
    _executeCommand(command);
  }

  void _executeCommand(ICommand command) {
    setState(() {
      command.execute();
      _commandHistory.add(command);
    });
  }

  void _undo() {
    setState(() {
      _commandHistory.undo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: <Widget>[
              ShapeContainer(
                shape: _originator.state,
              ),
              const SizedBox(
                height: 10.0,
              ),
              PlatformButton(
                text: 'Randomise',
                materialColor: Colors.black54,
                materialTextColor: Colors.white,
                onPressed: _randomiseProperties,
              ),
              const Divider(),
              PlatformButton(
                text: 'Undo',
                materialColor: Colors.black,
                materialTextColor: Colors.white,
                onPressed: _commandHistory.isEmpty ? null : _undo,
              ),
              const SizedBox(
                height: 10.0,
              )
            ],
          ),
        ));
  }
}
