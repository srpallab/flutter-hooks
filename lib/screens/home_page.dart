import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// Stream<String> getTime() => Stream.periodic(
//   const Duration(seconds: 1),
//   (_) => DateTime.now().toIso8601String(),
// );

// const url = 'https://images.unsplash.com/photo-1544085311-11a028465b03';

class CountDown extends ValueNotifier {
  late StreamSubscription sub;

  CountDown({required int from}) : super(from) {
    sub = Stream.periodic(const Duration(seconds: 1), (v) => from - v)
        .takeWhile((value) => value >= 0)
        .listen((value) {
          this.value = value;
        });
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }
}

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final dateTime = useStream(getTime());

    // final controller = useTextEditingController();
    // final text = useState('');

    // useEffect(() {
    //   controller.addListener(() {
    //     text.value = controller.text;
    //   });
    //   return null;
    // }, [controller]);
    // final future = useMemoized(
    //   () => NetworkAssetBundle(Uri.parse(url))
    //       .load(url)
    //       .then((data) => data.buffer.asUint8List())
    //       .then((data) => Image.memory(data)),
    // );

    // final snapshot = useFuture(future);

    final countDown = useMemoized(() => CountDown(from: 20));
    final notifier = useListenable(countDown);

    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Center(child: Text(notifier.value.toString())),
      //Column(
      // children: [
      //   snapshot.data,
      //   // TextField(controller: controller),
      //   // Text("You Typed ${text.value}"),
      // ].compactMap().toList(),
      //),
    );
  }
}
