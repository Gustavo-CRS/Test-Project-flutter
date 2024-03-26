import 'package:flutter/material.dart';

class PoliticWidget extends StatelessWidget {
  const PoliticWidget({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: const Text(
        'Politica de Privacidade',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
      ),
    );
  }
}
