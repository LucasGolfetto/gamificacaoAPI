import 'package:flutter/material.dart';

class EnderecoClienteField extends StatelessWidget {
  final TextEditingController controller;

  const EnderecoClienteField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: const InputDecoration(labelText: 'Endereço'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, Insira o Endereço';
        }
        return null;
      },
    );
  }
}
