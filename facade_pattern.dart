//* simply create handler
/**
 * Law of the demeter
 * Principle of least knowledge
 * `Object should talk to his firend, not his friend's friend`
 */
class A {
  void call() {
    print("A: Call method");
  }

  void dataReceiver(String data) {
    print("A: data Received $data");
  }
}

class B {
  void call() {
    print("B: Call method");
  }
}

class C {
  //* we can use interface in this case
  void call() {
    print("C: Call method");
  }

  void sendDataToA(A a) {
    print("C: sending data to A");
    a.dataReceiver("secret text: **********");
  }
}

//* simplify others call
class Facade {
  final a = A();
  final b = B();
  final c = C();

  void callEveryOne() {
    a.call();
    b.call();
    c.call();
  }

  void sendDataCtoA() {
    c.sendDataToA(a);
  }
}

main(List<String> args) {
  Facade f = Facade();

  f.callEveryOne();
  f.sendDataCtoA();
}
