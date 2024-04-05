import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';

class EditProfileDialog extends StatefulWidget {
  const EditProfileDialog({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<EditProfileDialog> createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<EditProfileDialog> {
  late UserSessionProvider userSessionProvider =
      Provider.of<UserSessionProvider>(context, listen: false);
  late UserModel? user = userSessionProvider.user;

  late TextEditingController fullnameCtrl =
      TextEditingController(text: user!.fullname);
  late TextEditingController birthdayCtrl =
      TextEditingController(text: user!.birthday);
  late TextEditingController emailCtrl =
      TextEditingController(text: user!.email);
  late TextEditingController phoneNumberCtrl =
      TextEditingController(text: user!.phoneNumber);
  late String selectedGender = user!.gender;

  List<String> genderList = ['Male', 'Female', 'Other'];

  @override
  void initState() {
    super.initState();
    userSessionProvider.addListener(() {
      setState(() {
        user = userSessionProvider.user;
        if (user != null) {
          fullnameCtrl.text = user!.fullname;
          birthdayCtrl.text = user!.birthday;
          emailCtrl.text = user!.email;
          phoneNumberCtrl.text = user!.phoneNumber;
          selectedGender = user!.gender;
        }
      });
    });
  }

  @override
  void dispose() {
    userSessionProvider.removeListener(() {});
    super.dispose();
  }

  void updateProfile() {
    user!.fullname = fullnameCtrl.text;
    user!.birthday = birthdayCtrl.text;
    user!.email = emailCtrl.text;
    user!.phoneNumber = phoneNumberCtrl.text;
    user!.gender = selectedGender;

    userSessionProvider.initUser(user);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    Size maxSize = MediaQuery.of(context).size;

    return Scaffold(
      key: widget.scaffoldKey,
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          width: maxSize.width * .4,
          decoration: BoxDecoration(
            color: colorScheme.background,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Edit profile",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Table(
                  columnWidths: const <int, TableColumnWidth>{
                    0: IntrinsicColumnWidth(),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(
                      children: [
                        const Text("Full name"),
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          margin: const EdgeInsets.all(5),
                          height: 38,
                          child: TextField(
                            controller: fullnameCtrl,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 10, top: 5, bottom: 5),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        const Text("Birthday"),
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          margin: const EdgeInsets.all(5),
                          height: 38,
                          child: TextField(
                            controller: birthdayCtrl,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 10, top: 5, bottom: 5),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        const Text("Gender"),
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          margin: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ...List.generate(genderList.length, (index) {
                                return Row(
                                  children: [
                                    Radio(
                                      value: genderList[index],
                                      groupValue: selectedGender,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedGender = value!;
                                        });
                                      },
                                    ),
                                    Text(genderList[index]),
                                  ],
                                );
                              })
                            ],
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        const Text("Email"),
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          margin: const EdgeInsets.all(5),
                          height: 38,
                          child: TextField(
                            controller: emailCtrl,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 10, top: 5, bottom: 5),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        const Text("Phone number"),
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          margin: const EdgeInsets.all(5),
                          height: 38,
                          child: TextField(
                            controller: phoneNumberCtrl,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 10, top: 5, bottom: 5),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: colorScheme.primary,
                    ),
                    onPressed: () => updateProfile(),
                    child: const Text(
                      "Update",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: colorScheme.secondary,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
