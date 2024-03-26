import 'package:flutter/material.dart';

class PopUpWidget extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const PopUpWidget(
      {super.key, required this.onConfirm, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 5,
      title: const Center(
        child: Text(
          'Deletar anotações',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      content: const Text(
        'Tem certeza que deseja deletar suas anotações?',
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: onConfirm,
              child: const Text(
                'Deletar',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: onCancel,
              child: const Text('Cancelar'),
            ),
          ],
        ),
      ],
    );
  }
}
