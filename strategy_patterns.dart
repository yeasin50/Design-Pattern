abstract class IFlyBehaviour {
  void fly() {
    print("default fly");
  }
}

abstract class IQuackBehaviour {
  void quack() {
    print("default quack");
  }
}

abstract class IDisplayBehavior {
  void display() {
    print("default display");
  }
}

///* differents type of activity
class SimpleFlyBehaviour implements IFlyBehaviour {
  @override
  void fly() {
    print("simple fly");
  }
}

class WildFlyBehaviour implements IFlyBehaviour {
  @override
  void fly() {
    print("wild fly:FFFLY");
  }
}

class SimpleQuackBehaviour implements IQuackBehaviour {
  @override
  void quack() {
    print("simple Quack");
  }
}

class WildQuackBehaviour implements IQuackBehaviour {
  @override
  void quack() {
    print("WildQuack Qua-Quack");
  }
}

class SimpleDisplayBehaviour implements IDisplayBehavior {
  @override
  void display() {
    print("Simple display");
  }
}

class Duck {
  IFlyBehaviour flyBehaviour;
  IQuackBehaviour quackBehaviour;
  IDisplayBehavior displayBehavior;

  Duck({
    required this.flyBehaviour,
    required this.quackBehaviour,
    required this.displayBehavior,
  });

  void fly() {
    this.flyBehaviour.fly();
  }

  void quack() {
    this.quackBehaviour.quack();
  }

  void display() {
    this.displayBehavior.display();
  }
}

void main() {
  Duck simpleDuck = Duck(
    flyBehaviour: SimpleFlyBehaviour(),
    quackBehaviour: SimpleQuackBehaviour(),
    displayBehavior: SimpleDisplayBehaviour(),
  );

  //* simple duck
  simpleDuck.fly();
  simpleDuck.quack();

  //* wild-duck
  Duck wildDuck = Duck(
    flyBehaviour: WildFlyBehaviour(),
    quackBehaviour: WildQuackBehaviour(),
    displayBehavior: SimpleDisplayBehaviour(),
  );

  wildDuck.fly();
  wildDuck.quack();
}
