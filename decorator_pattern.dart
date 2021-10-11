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
  List<String> description = [];
  Expreso expreso = Expreso();

  description.add("expreso: ${expreso.cost()}");

  /// adding addons
  CaramelDecorator caramelDecorator = CaramelDecorator(beverage: expreso);
  description.add("caramel1: ${caramelDecorator.price}");
  CaramelDecorator caramelDecorator2 =
      CaramelDecorator(beverage: caramelDecorator);
  description.add("caramel2: ${caramelDecorator2.price}");

  XDecorator xDecorator = XDecorator(beverage: caramelDecorator2);
  description.add("xDecorator: ${xDecorator.price}");

  print(caramelDecorator.cost());
  print(caramelDecorator2.cost());
  print(xDecorator.cost());

  print(description.toString());
}
