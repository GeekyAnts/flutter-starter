class UserFromFirebaseUser {
  final String uid;
  final String email;
  final String token;
  final String avatar;

  UserFromFirebaseUser({
    this.uid,
    this.email,
    this.token,
    this.avatar =
        "https://i.pinimg.com/736x/89/90/48/899048ab0cc455154006fdb9676964b3.jpg",
  });
}
