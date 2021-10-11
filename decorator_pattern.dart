abstract class Beverage {
  double cost();
}

//* Add-on
// will be used to create others addOns. we can avoid creating this class
abstract class AddonDecorator implements Beverage {
  @override
  double cost() {
    return 0;
  }
}

//*----------------------------[Add-on]------------------------------------- */

//* Add-on for Beverage
class CaramelDecorator implements AddonDecorator {
  Beverage beverage;

  get price => 2.0;
  CaramelDecorator({
    required this.beverage,
  });

  @override
  double cost() {
    // cost [beverage+caramel]
    return this.beverage.cost() + price;
  }
}

class XDecorator implements AddonDecorator {
  Beverage beverage;

  get price => 1.0;
  XDecorator({
    required this.beverage,
  });

  @override
  double cost() {
    // cost [beverage+caramel]
    return this.beverage.cost() + price;
  }
}

//*----------------------------------------------------------------- */

//* Actual Beverage
class Expreso implements Beverage {
  get price => 4.0;
  @override
  double cost() {
    //cost of the expreso
    return price;
  }
}

main() {
  //* we can format description in many ways

  //* creating a beverage of type Expreso,
  Beverage beverage = Expreso(); // 4

  // adding addons
  beverage = CaramelDecorator(beverage: beverage); // 4 + 2
  beverage = XDecorator(beverage: beverage); // 4 + 2 + 1
  beverage = CaramelDecorator(beverage: beverage); // 4 + 2 + 1 + 2

  print(beverage.cost());
}
