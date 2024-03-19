abstract class SqliteService {
  Future<void> init();
  Future<void> insert(
    String table,
    Map<String, Object?> values,
  );

  Future<List<Map<String, Object?>>> get(
    String table,
  );

  Future<void> update(
    String table,
    Map<String, Object?> values, {
    String? where,
    List<Object?>? whereArgs,
  });

  Future<void> delete(
    String table, {
    String? where,
    List<Object?>? whereArgs,
  });
}
