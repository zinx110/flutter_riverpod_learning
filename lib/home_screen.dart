import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_riverpod_learning/main.dart";
import "package:flutter_riverpod_learning/user.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void onSubmitName(WidgetRef ref, String value) {
    // ref.read(nameProvider.notifier).update(
    //       (state) => value,
    //     );

    ref.read(userProvider.notifier).updateName(value);
  }

  void onSubmitAge(WidgetRef ref, String age) {
    ref.read(userProvider.notifier).updateAge(int.parse(age));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Consumer(builder: (context, ref, child) {
        // final name = ref.watch(nameProvider) ?? "";
        // final nameRead = ref.read(nameProvider) ?? "";

        final user = ref.watch(userProvider);
        final userName = ref.watch(userProvider.select((value) => value.name));

        return Column(
          children: [
            Column(
              children: [
                TextField(
                  onSubmitted: (value) => onSubmitName(ref, value),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  onSubmitted: (value) => onSubmitAge(ref, value),
                ),
                Center(
                  child: Text("name : $userName, age : ${user.age}"),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final name = ref.watch(nameProvider);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Home"),
//       ),
//       body: Center(
//         child: Text(name),
//       ),
//     );
//   }
// }


// class HomeScreenStateful extends ConsumerStatefulWidget {
//   const HomeScreenStateful({super.key});

//   @override
//   ConsumerState<HomeScreenStateful> createState() => _HomeScreenStatefulState();
// }

// class _HomeScreenStatefulState extends ConsumerState<HomeScreenStateful> {
//   void func() {
//     ref.read(nameProvider);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final name = ref.watch(nameProvider) ?? "";

//     return Scaffold(
//         appBar: AppBar(
//           title: Text(name),
//         ),
//         body: Column(
//           children: [
//             TextField(
//               onSubmitted: (value) {},
//             ),
//             Center(
//               child: Text("Name : $name"),
//             ),
//           ],
//         ));
//   }
// }