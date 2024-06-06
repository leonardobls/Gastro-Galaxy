import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gastro_galaxy/config/app_styles.dart';
import 'package:gastro_galaxy/stores/profile_store.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({
    super.key,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ProfileStore profileStore = ProfileStore();
  bool wasInserted = false;
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    setState(() {
      wasInserted = false;
    });
    // profileStore.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: AppStyles.primaryColor,
        title: const Text(
          "PERFIL",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          color: AppStyles.primaryColor,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: SingleChildScrollView(
                child: FutureBuilder(
                  future: profileStore.load(),
                  builder: (buildContext, snapshot) {
                    return snapshot.hasData
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 40,
                              ),
                              Form(
                                key: profileStore.profileFormKey,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          showModalBottomSheet(
                                            context: context,
                                            isScrollControlled: true,
                                            useRootNavigator: true,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              ),
                                            ),
                                            backgroundColor: AppStyles.primaryColor,
                                            builder: (BuildContext context) {
                                              return imageModal();
                                            },
                                          );
                                        },
                                        child: Column(
                                          children: [
                                            Center(
                                              child: ClipRRect(
                                                borderRadius: const BorderRadius.all(
                                                  Radius.circular(100),
                                                ),
                                                child: SizedBox(
                                                  width: 100,
                                                  height: 100,
                                                  child: _selectedImage == null && snapshot.data.image == null
                                                      ? Image.asset(
                                                          "assets/images/profile.png",
                                                          fit: BoxFit.cover,
                                                        )
                                                      : !wasInserted && snapshot.data.image != null
                                                          ? Image.asset(
                                                              "${profileStore.globalDirectory!.path}/${snapshot.data.image}",
                                                              fit: BoxFit.cover,
                                                            )
                                                          : Image.file(
                                                              _selectedImage!,
                                                              fit: BoxFit.cover,
                                                            ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              "Alterar foto",
                                              style: TextStyle(fontSize: 10, decoration: TextDecoration.underline),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                        "Nome",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        initialValue: snapshot.data.name,
                                        cursorColor: Colors.black,
                                        textAlignVertical: TextAlignVertical.center,
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "Insira seu nome",
                                          contentPadding: const EdgeInsets.symmetric(
                                            vertical: 16,
                                            horizontal: 16,
                                          ),
                                          hintStyle: const TextStyle(
                                            color: Color.fromRGBO(0, 0, 0, .4),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: AppStyles.primaryColor),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: AppStyles.primaryColor),
                                          ),
                                          errorBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.red),
                                          ),
                                        ),
                                        onChanged: (value) {
                                          profileStore.profile!.name = value;
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Campo obrigatório';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      const Text(
                                        "E-mail",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        initialValue: snapshot.data.email,
                                        cursorColor: Colors.black,
                                        style: const TextStyle(color: Colors.black),
                                        textAlignVertical: TextAlignVertical.center,
                                        decoration: InputDecoration(
                                          hintText: "Insira seu e-mail",
                                          contentPadding: const EdgeInsets.symmetric(
                                            vertical: 16,
                                            horizontal: 16,
                                          ),
                                          hintStyle: const TextStyle(
                                            color: Color.fromRGBO(0, 0, 0, .4),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: AppStyles.primaryColor),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: AppStyles.primaryColor),
                                          ),
                                          errorBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.red),
                                          ),
                                        ),
                                        onChanged: (value) {
                                          profileStore.profile!.email = value;
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Campo obrigatório';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      const Text(
                                        "Telefone",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        initialValue: snapshot.data.phone,
                                        cursorColor: Colors.black,
                                        style: const TextStyle(color: Colors.black),
                                        textAlignVertical: TextAlignVertical.center,
                                        decoration: InputDecoration(
                                          hintText: "Insira seu telefone",
                                          contentPadding: const EdgeInsets.symmetric(
                                            vertical: 16,
                                            horizontal: 16,
                                          ),
                                          hintStyle: const TextStyle(
                                            color: Color.fromRGBO(0, 0, 0, .4),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: AppStyles.primaryColor),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: AppStyles.primaryColor),
                                          ),
                                          errorBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.red),
                                          ),
                                        ),
                                        onChanged: (value) {
                                          profileStore.profile!.phone = value;
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Campo obrigatório';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      const Text(
                                        "Nova Senha",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        controller: profileStore.passwordController,
                                        cursorColor: Colors.black,
                                        style: const TextStyle(color: Colors.black),
                                        textAlignVertical: TextAlignVertical.center,
                                        decoration: InputDecoration(
                                          hintText: "Insira nova senha",
                                          contentPadding: const EdgeInsets.symmetric(
                                            vertical: 16,
                                            horizontal: 16,
                                          ),
                                          hintStyle: const TextStyle(
                                            color: Color.fromRGBO(0, 0, 0, .4),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: AppStyles.primaryColor),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: AppStyles.primaryColor),
                                          ),
                                          errorBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.red),
                                          ),
                                        ),
                                        onChanged: (value) {
                                          profileStore.passwordController.text = value;
                                          profileStore.profile!.password = value;
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Campo obrigatório';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      const Text(
                                        "Repita Nova Senha",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        cursorColor: Colors.black,
                                        style: const TextStyle(color: Colors.black),
                                        textAlignVertical: TextAlignVertical.center,
                                        decoration: InputDecoration(
                                          hintText: "Repita nova senha",
                                          contentPadding: const EdgeInsets.symmetric(
                                            vertical: 16,
                                            horizontal: 16,
                                          ),
                                          hintStyle: const TextStyle(
                                            color: Color.fromRGBO(0, 0, 0, .4),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: AppStyles.primaryColor),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: AppStyles.primaryColor),
                                          ),
                                          errorBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.red),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Campo obrigatório';
                                          }
                                          if (value != profileStore.passwordController.text) {
                                            return 'As senhas não conferem!';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 50),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              if (profileStore.profileFormKey.currentState!.validate()) {
                                                await profileStore.save();
                                                Navigator.pop(context);
                                              }
                                            },
                                            child: ClipRRect(
                                              borderRadius: const BorderRadius.all(
                                                Radius.circular(200),
                                              ),
                                              child: Container(
                                                color: Colors.black87,
                                                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                                child: const Text(
                                                  "SALVAR",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        : profileStore.isLoading
                            ? const CircularProgressIndicator()
                            : const Text('Nenhum ingrediente cadastrado');
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget imageModal() {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      _takePickFromCamera();
                    },
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        child: const Text(
                          "Capturar nova imagem",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      _pickImageFromGallery();
                    },
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        child: const Text(
                          "Escolher nova imagem",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage != null) {
      setState(() {
        wasInserted = true;
        _selectedImage = File(returnedImage.path);
        profileStore.selectedImage = File(returnedImage.path);
      });
    }
  }

  Future _takePickFromCamera() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage != null) {
      setState(() {
        wasInserted = true;
        _selectedImage = File(returnedImage.path);
        profileStore.selectedImage = File(returnedImage.path);
      });
    }
  }
}
