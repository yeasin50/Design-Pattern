abstract class ITarget {
  void request();
}

class Adapter implements ITarget {
  Adaptee _adaptee;

  Adapter(
    this._adaptee,
  );
  @override
  void request() {
    this._adaptee.specifiqRequest();
  }
}

class Adaptee {
  void specifiqRequest() {
    ///... ulala logic
    print("Adaptee: Specifiq Request ");
  }
}

class Client {}

main(List<String> args) {
  ITarget target = new Adapter(Adaptee());
  target.request();
}
