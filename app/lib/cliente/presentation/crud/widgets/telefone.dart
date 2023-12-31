import 'package:flutter/material.dart';

class TelefoneClienteField extends StatelessWidget {
  final TextEditingController controller;

  const TelefoneClienteField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.go,
      decoration: const InputDecoration(labelText: 'Telefone'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, Insira o Telefone';
        }
        return null;
      },
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
