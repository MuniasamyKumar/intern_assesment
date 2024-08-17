import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Hello Jane",
                  style: TextStyle(
                      fontSize: 25,
                      color: Color(0xff255FD5),
                      fontWeight: FontWeight.bold)),
              CircleAvatar(
                child: Image.asset("assets/Group 7073.png"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
