import 'package:hive_flutter/adapters.dart';
import 'package:paperless_api/paperless_api.dart';
import 'package:paperless_mobile/core/config/hive/hive_config.dart';
import 'package:paperless_mobile/core/database/tables/local_user_settings.dart';

part 'local_user_account.g.dart';

@HiveType(typeId: HiveTypeIds.localUserAccount)
class LocalUserAccount extends HiveObject {
  @HiveField(0)
  final String serverUrl;

  @HiveField(3)
  final String id;

  @HiveField(4)
  final LocalUserSettings settings;

  @HiveField(7)
  UserModel paperlessUser;

  @HiveField(8, defaultValue: 2)
  int apiVersion;

  LocalUserAccount({
    required this.id,
    required this.serverUrl,
    required this.settings,
    required this.paperlessUser,
    required this.apiVersion,
  });

  bool get hasMultiUserSupport => apiVersion >= 3;
}
