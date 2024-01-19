import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/datasource/remote_datasource.dart';
import 'package:flutter_application_2/pages/bloc/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserBloc(remoteDataSource: RemoteDataSource())..add(LoadUser()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Users'),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UserLoaded) {
              final data = state.users;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(data[index].avatar),
                    ),
                    title: Text(data[index].name),
                    subtitle: Text(data[index].email),
                    //nambahin fungsi edit dan delete aku disini
                    trailing: PopupMenuButton(
                      itemBuilder: (BuildContext context) => [
                        PopupMenuItem(
                          value: 'edit',
                          child: Text('Edit'),
                        ),
                        PopupMenuItem(
                          value: 'delete',
                          child: Text('Delete'),
                        ),
                      ],
                      onSelected: (String value) {
                        if (value == 'edit') {
                          //panggil fungsi edit di sini
                        } else if (value == 'delete') {
                          //panggil fungsi delete disini
                        }
                      },
                    ),
                  );
                },
              );
            } else if (state is UserError) {
              return Center(
                child: Text(state.error),
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
