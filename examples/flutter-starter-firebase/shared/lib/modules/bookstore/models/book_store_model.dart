class BookStore {
  String id;
  String author;
  String name;
  String img;

  BookStore({this.id, this.author, this.name, this.img});

  BookStore.fromMap(Map snapshot, String id)
      : id = id ?? '',
        author = snapshot['author'] ?? '',
        name = snapshot['name'] ?? '',
        img = snapshot['img'] ?? '';

  toJson() {
    return {
      "author": author,
      "name": name,
      "img": img,
    };
  }
}
