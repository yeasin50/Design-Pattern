abstract class ISongComponent {
  void add(ISongComponent songComponent) {
    throw UnsupportedError("failed to add");
  }

  void remove(ISongComponent songComponent) {
    throw UnsupportedError("failed to remove");
  }

  ISongComponent getSongComponent(int index) {
    throw UnimplementedError("getSongComponent");
  }

  String getSongName() {
    throw UnimplementedError("");
  }

  String getBandName() {
    throw UnimplementedError("");
  }

  //* important
  displaySongInfo() {}
}

class SongGroup extends ISongComponent {
  List<ISongComponent> songComponents = [];

  late final String _groupName;
  late final String _groupDescription;

  SongGroup({
    required String groupName,
    required String groupDescription,
  }) {
    this._groupDescription = groupDescription;
    this._groupName = groupName;
  }

  get groupName => _groupName;
  get groupDescription => _groupDescription;

  void add(ISongComponent component) {
    songComponents.add(component);
  }

  void remove(ISongComponent component) {
    songComponents.remove(component);
  }

  ISongComponent getComponent(int index) {
    return songComponents[index];
  }

  void displaySongInfo() {
    print("Group: $groupName Desc: $groupDescription");

    songComponents.forEach((element) {
      element.displaySongInfo();
    });
  }
}

class Song extends ISongComponent {
  late final String _songName;
  late final String _bandName;
  late final int _releasedYear;

  Song({
    required String songName,
    required String bandName,
    required int releasedYear,
  }) {
    this._songName = songName;
    this._bandName = bandName;
    this._releasedYear = releasedYear;
  }

  get songName => _songName;
  get bandName => _bandName;
  get releasedYear => _releasedYear;

  displaySongInfo() {
    print("$songName was recorded by $bandName in $releasedYear");
  }
}

class DiskJockey {
  late ISongComponent _songList;

  DiskJockey({
    required ISongComponent songList,
  }) {
    this._songList = songList;
  }

  void displayInfo() {
    _songList.displaySongInfo();
  }

  ISongComponent get songList => _songList;
}

main() {
  ISongComponent industrialMusic = SongGroup(
      groupName: "industrial Music",
      groupDescription: "industrial description");

  ISongComponent metalMusic =
      SongGroup(groupName: "metal music1", groupDescription: "meta UUUUUUU");

  ///* parent group =>Song Group >master
  ISongComponent everySong =
      SongGroup(groupName: "All Song", groupDescription: "My List");

  industrialMusic
      .add(Song(songName: "ind Song 1", bandName: "IMB1", releasedYear: 1212));
  industrialMusic
      .add(Song(songName: "ind Song 2", bandName: "IMB1", releasedYear: 12));
  everySong.add(industrialMusic);

  metalMusic.add(Song(songName: "metal1", bandName: "mB1", releasedYear: 5555));
  metalMusic.add(Song(songName: "meta21", bandName: "mB21", releasedYear: 555));

  everySong.add(metalMusic);

  DiskJockey ccd = DiskJockey(songList: everySong);
  ccd.displayInfo();

  ccd.songList.add(Song(songName: "N1", bandName: "nb", releasedYear: 1));

  ccd.displayInfo();
}
