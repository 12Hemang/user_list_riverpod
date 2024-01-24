import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled1/common/api_state.dart';
import 'package:untitled1/common/api_status.dart';
import 'package:untitled1/user/controller/user_controller.dart';
import 'package:untitled1/user/model/usser_data.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      addListener();
    });
    super.initState();
  }

  addListener() {
    ref.listenManual(userControllerProvider.select((value) => value.userList),
        (previous, next) {
      onListenerChange(next);
    });
  }

  onListenerChange(ApiState? state) {
    switch (state?.status) {
      case ApiStatus.loading:
        {
          break;
        }
      case ApiStatus.success:
        {
          break;
        }
      case ApiStatus.error:
        {
          showMessage(state?.errorMessage ?? "--");
          break;
        }

      case ApiStatus.initial:
      default:
        {
          break;
        }
    }
  }

  showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        ApiState? provider =
            ref.watch(userControllerProvider.select((value) => value.userList));
        switch (provider?.status) {
          case ApiStatus.loading:
            {
              return const CircularProgressIndicator();
            }
          case ApiStatus.success:
            {
              if (provider?.data?.length ?? 0 == 0) {
                return const Text("No User Found");
              }
              return ListView.separated(
                itemCount: provider?.data?.length ?? 0,
                itemBuilder: (context, index) {
                  UserData user = provider!.data[index];
                  return Column(
                    children: [
                      Row(
                        children: [
                          Text("${user.id}"),
                          Text("${user.title}"),
                        ],
                      ),
                      Text(user.body ?? "--"),
                    ],
                  );
                },
                separatorBuilder: (context, index) => Divider(height: 20),
              );
            }
          case ApiStatus.initial:
          default:
            {
              return ElevatedButton(
                  onPressed: () {
                    ref.read(userControllerProvider.notifier).getUserList();
                  },
                  child: const Text("Get User List"));
            }
        }
      },
    );
  }
}
