import 'package:flutter/cupertino.dart';
import 'package:taj_elsafa/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:taj_elsafa/core/shared/dto/form_dto.dart';
import 'package:taj_elsafa/core/shared/dto/imagedto/image.dto.dart';
import 'package:taj_elsafa/features/profile/data/models/user_model.dart';

class UpdateUserDto extends FormDTO {
  final UserModel _user;

  UpdateUserDto(this._user)
    : imageController = EditingController<ImageDTO>(
        _user.imageUrl != null
            ? RemoteImageDTO( _user.imageUrl!)
            : null,
      ),
      nameController = TextEditingController(text: _user.name),
      contactNumberController = TextEditingController(
        text: _user.contactNumber,
      ),
      altContactNumberController = TextEditingController(
        text: _user.altContactNumber,
      ),
      emailController = TextEditingController(text: _user.email);

  final EditingController<ImageDTO> imageController;
  final TextEditingController nameController;
  final TextEditingController contactNumberController;
  final TextEditingController altContactNumberController;
  final TextEditingController emailController;

  String get id => _user.id!;

  @override
  void dispose() {
    imageController.dispose();
    nameController.dispose();
    contactNumberController.dispose();
    altContactNumberController.dispose();
    emailController.dispose();
  }

  @override
  Future<Map<String, dynamic>> toMap() async {
    final imageUrl = await imageController.value?.url;

    return {
      if (imageUrl != _user.imageUrl) 'image': imageUrl,

      if (nameController.text != _user.name)
        'name': nameController.text,

      if (contactNumberController.text != _user.contactNumber)
        'contact_number': contactNumberController.text,

      if (altContactNumberController.text != _user.altContactNumber)
        'alt_contact_number': altContactNumberController.text,

      if (emailController.text != _user.email)
        'email': emailController.text,
    };
  }
}
