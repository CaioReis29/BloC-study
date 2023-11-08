import 'package:bloc_study/bloc/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocStudy(),
    ),
  );
}

class BlocStudy extends StatelessWidget {
  const BlocStudy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BloC study'),
      ),
      body: SizedBox.expand(
        child: BlocProvider(
          create: (context) => UserBloc(),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserInitial) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Usuário não logado",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () => context.read<UserBloc>().add(
                            const UserLogin(userId: "1", userName: "Caio"),
                          ),
                      child: const Text("Login"),
                    ),
                  ],
                );
              } else if (state is UserLoggedIn) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "User id: ${state.userId}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Name: ${state.userName}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () => context.read<UserBloc>().add(
                            const UserLogin(userId: "2", userName: "Reis"),
                          ),
                      child: const Text("Mudar valor"),
                    ),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
