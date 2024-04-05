import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';

List<ContactModel> contactList = [
  ContactModel(id: "1", fullname: "Tuấn Hùng", avatar: "TH"),
  ContactModel(id: "2", fullname: "Tuấn Lê", avatar: "TL"),
  ContactModel(id: "3", fullname: "Ngọc Tring", avatar: "NT"),
  ContactModel(id: "4", fullname: "Gia Túc Nguyễn", avatar: "TN"),
  ContactModel(id: "5", fullname: "X Mai Luu", avatar: "ML"),
  ContactModel(id: "6", fullname: "Hoàng Tuấn", avatar: "HL"),
  ContactModel(id: "7", fullname: "Thanh Tâm", avatar: "TT"),
  ContactModel(id: "8", fullname: "Tuấn Lưu", avatar: "TL"),
  ContactModel(id: "9", fullname: "Bine Nguyễn", avatar: "BN"),
  ContactModel(id: "10", fullname: "Thong Doan", avatar: "TD"),
];

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return SizedBox.expand(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              child: const CupertinoSearchTextField(),
            ),
            ...List.generate(contactList.length, (index) {
              ContactModel contactItem = contactList[index];
              return ItemContact(
                  contactItem: contactItem, colorScheme: colorScheme);
            })
          ],
        ),
      ),
    );
  }
}
