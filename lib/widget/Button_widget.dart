import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onClicked;

  const ButtonWidget({Key? key, required this.onClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: Size(100, 42)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.calendar_today_outlined,
              size: 20,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Choose Your Date Of Birth',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
        onPressed: onClicked,
      ),
    );
  }
}
