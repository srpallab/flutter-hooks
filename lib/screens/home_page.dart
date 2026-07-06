import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// Stream<String> getTime() => Stream.periodic(
//   const Duration(seconds: 1),
//   (_) => DateTime.now().toIso8601String(),
// );

const url = 'https://images.unsplash.com/photo-1544085311-11a028465b03';
// const imageHeight = 300.0;

// class CountDown extends ValueNotifier {
//   late StreamSubscription sub;

//   CountDown({required int from}) : super(from) {
//     sub = Stream.periodic(const Duration(seconds: 1), (v) => from - v)
//         .takeWhile((value) => value >= 0)
//         .listen((value) {
//           this.value = value;
//         });
//   }

//   @override
//   void dispose() {
//     sub.cancel();
//     super.dispose();
//   }
// }

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

    // final countDown = useMemoized(() => CountDown(from: 20));
    // final notifier = useListenable(countDown);

    // final opacity = useAnimationController(
    //   duration: Duration(seconds: 1),
    //   initialValue: 1.0,
    //   lowerBound: 0.0,
    //   upperBound: 1.0,
    // );

    // final size = useAnimationController(
    //   duration: Duration(seconds: 1),
    //   initialValue: 1.0,
    //   upperBound: 1.0,
    //   lowerBound: 0.0,
    // );
    // final controller = useScrollController();

    // useEffect(() {
    //   controller.addListener(() {
    //     final newOpacity = max(imageHeight - controller.offset, 0.0);
    //     final normalize = newOpacity.normalize(0.0, imageHeight).toDouble();
    //     opacity.value = normalize;
    //     size.value = normalize;
    //   });
    //   return null;
    // }, [controller]);

    late StreamController<double> controller;

    controller = useStreamController(
      onListen: () {
        controller.sink.add(0.0);
      },
    );

    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: StreamBuilder<double>(
        stream: controller.stream,
        builder: (context, asyncSnapshot) {
          if (!asyncSnapshot.hasData) {
            return const CircularProgressIndicator();
          } else {
            final rotation = asyncSnapshot.data ?? 0.0;
            return GestureDetector(
              onTap: () {
                controller.sink.add(rotation + 10.0);
              },
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(rotation / 360.0),
                child: Center(child: Image.network(url)),
              ),
            );
          }
        },
      ),
      // body: Column(
      //   children: [
      //     SizeTransition(
      //       sizeFactor: size,
      //       axis: Axis.vertical,
      //       alignment: Alignment.center,
      //       child: FadeTransition(
      //         opacity: opacity,
      //         child: Image.network(url, height: imageHeight, fit: BoxFit.cover),
      //       ),
      //     ),
      //     Expanded(
      //       child: ListView.builder(
      //         controller: controller,
      //         itemCount: 100,
      //         itemBuilder: (context, index) {
      //           return ListTile(title: Text("Person ${index + 1}"));
      //         },
      //       ),
      //     ),
      //   ],
      // ),
      // body: Center(child: Text(notifier.value.toString())),
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
