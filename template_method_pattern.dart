abstract class IFood {
  //* template
  void makeFood() {
    cutBun();

    if (customerWantsMeat()) {
      addMeat();
    }

    if (customerWantsCheese()) {
      addCheese();
    }
    if (customerWantsVegetables()) {
      addVegetables();
    }

    wrapper();
  }

  void cutBun() {
    print("Food is cutBUn");
  }

  void addMeat();
  bool customerWantsMeat() => true;

  void addCheese();
  bool customerWantsCheese() => true;

  void addVegetables();
  bool customerWantsVegetables() => true;

  wrapper() {
    print("wrapptheFood");
  }
}

class FoodX extends IFood {
  @override
  void addCheese() {
    print("adding the cheese");
  }

  @override
  void addMeat() {
    print("adding the Meat");
  }

  @override
  void addVegetables() {
    print("adding the vege");
  }
}

class FoodVeg extends IFood {
  @override
  bool customerWantsMeat() => false;
  @override
  bool customerWantsCheese() => false;

  @override
  void addCheese() {}

  @override
  void addMeat() {}

  @override
  void addVegetables() {
    print("adding the vege");
  }
}

main(List<String> args) {
  IFood foodx = FoodX();

  foodx.makeFood();

  IFood vegFood = FoodVeg();
  vegFood.makeFood();
}
