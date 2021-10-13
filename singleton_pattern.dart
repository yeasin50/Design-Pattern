//*Always Single🤣, imposible to create multiple instance
//* 🔻 "One man's constant is another man's variable...."

// i prefer Static field with getter, you can find other ways like here https://stackoverflow.com/a/55348216/10157127
class OneManArmy {
  static final OneManArmy _instance = OneManArmy._privateConstructor();

  static OneManArmy get instance => _instance;

  OneManArmy._privateConstructor();

  //* variables
  int? numberOfHands;
  int? numberOfLegs;
}

main(List<String> args) {
  final obj1 = OneManArmy.instance;

  print(obj1.numberOfHands = 2);

  final obj2 = OneManArmy.instance;

  // if this was new instance will provide `null`
  print(obj2.numberOfHands);

  print(obj2 == obj1);
}
