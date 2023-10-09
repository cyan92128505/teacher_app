import 'package:floor/floor.dart';

class BaseObject {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  @ColumnInfo(name: 'create_time')
  final String createTime;

  @ColumnInfo(name: 'update_time')
  final String updateTime;

  BaseObject({
    required this.id,
    required this.updateTime,
    required String? createTime,
  }) : createTime = createTime ?? DateTime.now().toString();
}
