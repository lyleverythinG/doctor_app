import 'package:doctor_app/features/users_from_api/domain/users_api_model.dart';
import 'package:hive/hive.dart';

class UserApiModelAdapter extends TypeAdapter<UserApiModel> {
  @override
  final int typeId = 0; // Type id should be unique.

  @override
  UserApiModel read(BinaryReader reader) {
    return UserApiModel(
      id: reader.read(),
      email: reader.read(),
      firstName: reader.read(),
      lastName: reader.read(),
      avatar: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, UserApiModel obj) {
    writer.write(obj.id);
    writer.write(obj.email);
    writer.write(obj.firstName);
    writer.write(obj.lastName);
    writer.write(obj.avatar);
  }
}
