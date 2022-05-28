import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordText1 extends StatelessWidget {
  const PasswordText1({this.controller, super.key});

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    debugPrint('rebuild PasswordText1');
    return BlocProvider(
      create: (_) => PasswordCubit(),
      child: BlocBuilder<PasswordCubit, bool>(
        builder: (context, state) {
          return TextFormField(
            obscureText: state,
            controller: controller,
            decoration: InputDecoration(
              labelText: 'Password1',
              suffixIcon: IconButton(
                onPressed: context.read<PasswordCubit>().change,
                icon: Icon(state ? Icons.visibility : Icons.visibility_off),
              ),
            ),
            validator: (val) => (val?.length ?? 0) < 6 ? 'heey' : null,
          );
        },
      ),
    );
  }
}

class PasswordCubit extends Cubit<bool> {
  PasswordCubit() : super(false);

  void change() => emit(!state);
}
