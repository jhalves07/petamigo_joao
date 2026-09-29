import 'package:flutter/material.dart';
import '../styles/alertdialog_styles.dart';

class AlertDialogPage extends StatelessWidget {
  const AlertDialogPage({super.key});

  void _mostrarAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Excluir item'),
          content: const Text('Tem certeza que deseja excluir este item?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancelar", style: AlertDialogStyles.textoBotao),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Excluir', style: AlertDialogStyles.textoBotao),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo de AlertDialog'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _mostrarAlertDialog(context),
          child: const Text('Excluir item'),
        ),
      ),
    );
  }
}