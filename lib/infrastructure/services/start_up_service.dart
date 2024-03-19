
import 'package:injectable/injectable.dart';
import 'package:json_placeholder/domain/services/sqlite_service.dart';
import 'package:json_placeholder/domain/services/start_up_service.dart';

@Injectable(as: StartUpService)
class FlutterStartUpService implements StartUpService {
  final SqliteService sqliteService;

  FlutterStartUpService({
    required this.sqliteService,
  });

  @override
  Future<void> init() async {
    await sqliteService.init();
  }
}
