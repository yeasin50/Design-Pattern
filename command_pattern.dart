//* Invoker... 0..*
abstract class ICommand {
  void execute();
  void unexecute();
}

class LightOnCommand implements ICommand {
  Light light;

  LightOnCommand({
    required this.light,
  });

  @override
  void execute() {
    this.light.turnOn();
  }

  @override
  void unexecute() {
    this.light.turnOff();
  }
}

class LightOffCommand implements ICommand {
  Light light;
  LightOffCommand({
    required this.light,
  });
  @override
  void execute() {
    this.light.turnOff();
  }

  @override
  void unexecute() {
    this.light.turnOn();
  }
}

class LightDimUpCommand implements ICommand {
  Light light;

  LightDimUpCommand({
    required this.light,
  });

  @override
  void execute() {
    this.light.dimOn();
  }

  @override
  void unexecute() {
    this.light.dimOff();
  }
}

class LightDimdownCommand implements ICommand {
  Light light;

  LightDimdownCommand({
    required this.light,
  });

  @override
  void execute() {
    this.light.dimOff();
  }

  @override
  void unexecute() {
    this.light.dimOn();
  }
}

//* We have 4btns on Controller
class Invoker {
  ICommand on;
  ICommand off;
  ICommand dimUp;
  ICommand dimOff;

  Invoker({
    required this.on,
    required this.off,
    required this.dimUp,
    required this.dimOff,
  });

  //* we can include `unexecute` inside click
  void clickOn() {
    this.on.execute();
  }

  void clickOff() {
    this.off.execute();
  }

  void clickDimUp() {
    this.dimUp.execute();
  }

  void clickDimOff() {
    this.dimOff.execute();
  }
}

//* we must have two switch for onOFF
abstract class IReceiver {
  void turnOn();
  void turnOff();
}

//* Things will be controlled
class Light implements IReceiver {
  @override
  void turnOn() {
    print("Light ON");
  }

  @override
  void turnOff() {
    print("Light OFF");
  }

  void dimOn() {
    print("Light dimOn");
  }

  void dimOff() {
    print("Light dimOFF");
  }
}

main(List<String> args) {
  final light = Light();

  Invoker invoker = Invoker(
    on: LightOnCommand(light: light),
    off: LightOffCommand(light: light),
    dimUp: LightDimUpCommand(light: light),
    dimOff: LightDimdownCommand(light: light),
  );

  invoker.clickOn();
  invoker.clickOff();
  invoker.clickDimUp();
  invoker.clickDimOff();
}
