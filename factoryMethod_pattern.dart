//** String / data just too random, &  could be miskate on writting pattern */

enum PizzaType { cheese, veggie }

//* product
abstract class IPizza {
  PizzaType type;
  String dough;
  String sauce;

  List<String> toppings;

  IPizza({
    required this.type,
    required this.dough,
    required this.sauce,
    required this.toppings,
  });

  void prepare() {
    print("Preparing ${type.toString()}");

    toppings.forEach((element) {
      print("topping $element");
    });
  }

  void bake() {
    print("Baking.....Pizza");
  }

  void cut() {
    print("Cut Pizza");
  }

  void box() {
    print("boxing pizza");
  }
}

//* creator > FactoryMethod
abstract class IPizzaStore {
  IPizza orderPizza(PizzaType type) {
    IPizza pizza;

    pizza = createPizza(type);
    pizza.prepare();
    pizza.bake();
    pizza.cut();
    pizza.box();

    return pizza;
  }

  IPizza createPizza(PizzaType type);
}

abstract class IPizzaIngredientFactory {
  // void Dough createDough();
}

//* product will be made
class NYStyleCheesePizza extends IPizza {
  NYStyleCheesePizza()
      : super(
          dough: "d",
          type: PizzaType.cheese,
          sauce: 'Marinara Sauce',
          toppings: ["A", "B"],
        );
}

class NYStyleVeggiePizza extends IPizza {
  NYStyleVeggiePizza()
      : super(
          dough: "NYStyleVeggiePizza",
          type: PizzaType.veggie,
          sauce: 'Marinara Sauce',
          toppings: ["As", "B"],
        );
}

class ChicagoStykeCheesePizza extends IPizza {
  ChicagoStykeCheesePizza()
      : super(
          type: PizzaType.cheese,
          dough: 'Extra Thick Crust Dough',
          sauce: 'Plum Tomato Sauce',
          toppings: ["X", "3"],
        );

  @override
  void cut() {
    print("Cutting ChicagoStykeCheesePizza pizza");
  }
}

class ChicagoStykeVeggiePizza extends IPizza {
  ChicagoStykeVeggiePizza()
      : super(
          type: PizzaType.veggie,
          dough: 'Extra ThickChicagoStykeVeggiePizza Crust Dough',
          sauce: 'Plum Tomato Sauce',
          toppings: ["X", "3"],
        );

  @override
  void cut() {
    print("Cutting ChicagoStykeVeggiePizza pizza");
  }
}

//* facotry will be responsible to create pizza on NYPizzaStore
class NYPizzaStore extends IPizzaStore {
  @override
  IPizza createPizza(PizzaType type) {
    switch (type) {
      case PizzaType.cheese:
        return NYStyleCheesePizza();

      case PizzaType.veggie:
        return NYStyleVeggiePizza();

      default:
        return NYStyleCheesePizza()..dough = "Normal";
    }
  }
}

class ChicagoPizzaStore extends IPizzaStore {
  @override
  IPizza createPizza(PizzaType type) {
    switch (type) {
      case PizzaType.cheese:
        return ChicagoStykeCheesePizza();

      case PizzaType.veggie:
        return ChicagoStykeVeggiePizza();

      default:
        return ChicagoStykeVeggiePizza()..dough = "Normal";
    }
  }
}

//* FIXME::
main() {
  NYPizzaStore nyPizzaStore = NYPizzaStore();
  ChicagoPizzaStore chicagoPizzaStore = ChicagoPizzaStore();

  nyPizzaStore.orderPizza(PizzaType.cheese);
}
