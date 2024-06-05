import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gastro_galaxy/config/app_styles.dart';
import 'package:gastro_galaxy/stores/profile_store.dart';

class Profile extends StatefulWidget {
  const Profile({
    super.key,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ProfileStore profileStore = ProfileStore();

  @override
  void initState() {
    super.initState();
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
      body: Container(
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
              child: Column(
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
                            onTap: () {},
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
                                      child: Image.asset(
                                        "assets/images/profile.png",
                                        fit: BoxFit.cover,
                                      ),
                                      // Image.file(File("")),
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
                            controller: profileStore.nameController,
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
                              errorStyle: const TextStyle(
                                fontSize: 0,
                                height: 0,
                                color: Colors.red,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppStyles.primaryColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppStyles.primaryColor),
                              ),
                            ),
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
                            controller: profileStore.emailController,
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
                              errorStyle: const TextStyle(
                                fontSize: 0,
                                height: 0,
                                color: Colors.black,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppStyles.primaryColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppStyles.primaryColor),
                              ),
                            ),
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
                            controller: profileStore.phoneController,
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
                              errorStyle: const TextStyle(
                                fontSize: 0,
                                height: 0,
                                color: Colors.black,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppStyles.primaryColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppStyles.primaryColor),
                              ),
                            ),
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
                              errorStyle: const TextStyle(
                                fontSize: 0,
                                height: 0,
                                color: Colors.black,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppStyles.primaryColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppStyles.primaryColor),
                              ),
                            ),
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
                            controller: profileStore.passwordController,
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
                              errorStyle: const TextStyle(
                                fontSize: 0,
                                height: 0,
                                color: Colors.black,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppStyles.primaryColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppStyles.primaryColor),
                              ),
                            ),
                          ),
                          const SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(200),
                                  ),
                                  child: Container(
                                    color: Colors.white,
                                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                    child: const Text(
                                      "SALVAR",
                                      style: TextStyle(
                                        color: Colors.black87,
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
