//* every device will have this
abstract class IEntrertainmentDevice {
  int deviceState;
  int maxSetting;
  int volumeLevel = 0;

  IEntrertainmentDevice({
    required this.deviceState,
    required this.maxSetting,
  });

  void buttonFivePressed();
  void buttonSixPressed();

  void deviceFeedback() {
    if (deviceState > maxSetting || deviceState < 0) {
      deviceState = 0;
      print("On $deviceState");
    } else
      print("On $deviceState");
  }

  void buttonSevenPressed() {
    volumeLevel++;
    print("volume Up at $volumeLevel");
  }

  void buttonEightPressed() {
    volumeLevel--;
    print("volume down at $volumeLevel");
  }
}

class TVDevice extends IEntrertainmentDevice {
  int deviceState;
  int maxSetting;

  TVDevice(this.deviceState, this.maxSetting)
      : super(
          maxSetting: maxSetting,
          deviceState: deviceState,
        );

  @override
  void buttonFivePressed() {
    print("Cannel down");
    deviceState--;
  }

  @override
  void buttonSixPressed() {
    print("Cannel UP");
    deviceState++;
  }
}

abstract class IRemote {
  late final IEntrertainmentDevice _device;

  IRemote({
    required IEntrertainmentDevice device,
  }) {
    this._device = device;
  }

  void buttonFivePressed() {
    this._device.buttonFivePressed();
  }

  void buttonSixPressed() {
    this._device.buttonSixPressed();
  }

  void deviceFeedBack() {
    this._device.deviceFeedback();
  }

  void buttonNinePressed();
}

///* refindAbstraction
class TVRemoteMute extends IRemote {
  TVRemoteMute(IEntrertainmentDevice device) : super(device: device);

  @override
  void buttonNinePressed() {
    print("TV was muted");
  }
}

class TVRemotePause extends IRemote {
  TVRemotePause(IEntrertainmentDevice device) : super(device: device);

  @override
  void buttonNinePressed() {
    print("TV was Paused");
  }
}

main(List<String> args) {
  IRemote theTV = TVRemoteMute(TVDevice(1, 100));
  IRemote theTV2 = TVRemotePause(TVDevice(1, 100));

  print("TV with mute: ");
  theTV.buttonFivePressed();
  theTV.buttonSixPressed();
  theTV.buttonNinePressed();

  print("TV with Pause: ");

  theTV2.buttonFivePressed();
  theTV2.buttonSixPressed();
  theTV2.buttonSixPressed();
  theTV2.buttonSixPressed();
  theTV2.buttonSixPressed();
  theTV2.buttonSixPressed();
  theTV2.buttonNinePressed();

  theTV2.deviceFeedBack();
}
