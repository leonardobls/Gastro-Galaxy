import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gastro_galaxy/db/database.dart';
import 'package:gastro_galaxy/models/profile.dart';
import 'package:path_provider/path_provider.dart';

import 'package:image_picker/image_picker.dart';
import 'package:randomstring_dart/randomstring_dart.dart';

class ProfileStore {
  GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordCheckController = TextEditingController();
  File? selectedImage;

  final ImagePicker _picker = ImagePicker();

  var bdHelper = Repository();
  Profile profile = Profile();

  bool isLoading = false;

  Directory? globalDirectory;

  Future load() async {
    isLoading = true;
    globalDirectory = await getApplicationDocumentsDirectory();
    var response = await bdHelper.getProfile();
    profile = response[0];
    isLoading = false;
    return response[0];
  }

  Future save() async {
    if (selectedImage != null) {
      var fileBytes = await selectedImage!.readAsBytes();
      final rs = RandomString();
      String randomName = "${rs.getRandomString()}.png";
      File fileToSave = File("${globalDirectory!.path}/$randomName");
      await fileToSave.writeAsBytes(fileBytes);

      profile.image = randomName;
    }

    Map<String, dynamic> row = {
      "id": profile.id,
      "image": profile.image ?? "",
      "name": profile.name,
      "email": profile.email,
      "phone": profile.phone,
      "password": profile.password,
    };

    var ingredientResponse = await bdHelper.updateUser(row);

    log(ingredientResponse.toString());
  }
}
