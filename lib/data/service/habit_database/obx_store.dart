import 'package:islamic_habit_tracker/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class ObjectBox {
  late final Store store;

  ObjectBox._create(this.store);

  /// Create an instance of ObjectBox to use throughout the app. this will be the only instance
  static Future<ObjectBox> createDB() async {
    final docsDir = await getApplicationDocumentsDirectory();
    // openStore() is defined in the generated objectbox.g.dart
    final store =
        await openStore(directory: path.join(docsDir.path, "habits-obx"));
    print(
        '===================== objectBox created **** with docsDir :: ${docsDir.toString()}');
    return ObjectBox._create(store);
  }
}
