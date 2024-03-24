import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  const MyListTile(
      {super.key,
      required this.leadingIcon,
      required this.text,
      this.onTap,
      this.subtitle});

  final IconData leadingIcon;
  final String text;
  final String? subtitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          leadingIcon,
          color: Colors.grey,
        ),
        iconColor: Colors.white,
        title: Text(
          text,
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        subtitle: Text(
          subtitle ?? '',
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
      ),
    );
  }
}
