import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileStore {
  GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordCheckController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
}
