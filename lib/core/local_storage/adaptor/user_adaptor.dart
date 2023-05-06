import 'package:doctor_app/core/packages/users_from_api_feature_packages/users_from_api_packages.dart';
import '../../packages/common_packages/common_packages.dart';

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
