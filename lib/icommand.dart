/// An interface that defines methods to be
/// implemented by the specific command
/// classes.
abstract class ICommand {
  void execute();
  void undo();
}
