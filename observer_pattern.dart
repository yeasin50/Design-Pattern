abstract class IObserver {
  void update();
}

abstract class IObservable {
  void add(IObserver observer);
  void remove(IObserver observer);
  void notify();
}

class WheatherStation implements IObservable {
  List<IObserver> observers = [];

  int _temp = 2;

  //* data will get from _temp
  get tempature => _temp;

  set tempature(teno) => this._temp = teno;

  @override
  void add(IObserver observer) {
    this.observers.add(observer);
  }

  @override
  void notify() {
    //* heart 🖤
    observers.forEach((observer) {
      observer.update();
    });
  }

  @override
  void remove(IObserver observer) {
    this.observers.remove(observer);
  }
}

class PhoneDisplay implements IObserver {
  WheatherStation station;

  int temp = 0;

  PhoneDisplay({
    required this.station,
  });

  @override
  void update() {
    temp = this.station.tempature;
  }
}

class WallDisplay implements IObserver {
  WheatherStation station;

  //* we can also make it nullable
  int temp = 0;

  WallDisplay({
    required this.station,
  });

  @override
  void update() {
    temp = this.station.tempature;
  }
}

main() {
  WheatherStation station = WheatherStation();

  PhoneDisplay phoneDisplay = PhoneDisplay(
    station: station,
  );

  WallDisplay wallDisplay = WallDisplay(station: station);

  //* add to oberver
  station.add(phoneDisplay);
  station.add(wallDisplay);

  print("station temp ${station.tempature}");
  print("pDisplayTemp : ${phoneDisplay.temp}");

  //* notify when any change is made
  station.tempature = 3;
  station.notify();

  print("Expected: 3 Got: ${phoneDisplay.temp}");
  print("Expected: 3 Got: ${wallDisplay.temp}");

  station.tempature = 5;
  station.notify();

  print("Expected: 5 Got: ${phoneDisplay.temp}");
  print("Expected: 5 Got: ${wallDisplay.temp}");
}
