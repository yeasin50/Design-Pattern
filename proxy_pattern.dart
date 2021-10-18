//* Isubject
abstract class IBookParser {
  int getNumPages();
}

//* parser / real subject
class BookParser implements IBookParser {
  int _pages = 0;

  String book;
  BookParser({required this.book}) {
    print("heavy computation.....");

    _pages = this.book.split(' ').length;
  }
  @override
  int getNumPages() {
    return _pages;
  }
}

//* proxy
class LazyBookParser implements IBookParser {
  BookParser? _bookParser = null;
  String _book;

  LazyBookParser(this._book);

  @override
  int getNumPages() {
    //* only call when need
    if (this._bookParser == null) this._bookParser = BookParser(book: _book);

    return this._bookParser!.getNumPages();
  }
}

//* TODO: recheck
main(List<String> args) {
  LazyBookParser bookParser =
      LazyBookParser("This is a complex-heavy-expensive operation");

  print(bookParser.getNumPages());
}
