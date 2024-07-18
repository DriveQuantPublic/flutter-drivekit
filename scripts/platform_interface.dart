abstract class PlatformInterface {
  String a();
  void b();

  int simple(String param, int param2);

  int positionnal(
    String param,
    int param2,
    String param3,
  );

  String nammed({
    required String param,
    required int param2,
    String? param3,
  });

  String mixed(
    int positionnal, {
    required String param,
    required int param2,
    String? param3,
  });
}
