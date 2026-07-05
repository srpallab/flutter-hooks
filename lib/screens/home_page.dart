import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Stream<String> getTime() => Stream.periodic(
  const Duration(seconds: 1),
  (_) => DateTime.now().toIso8601String(),
);

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final dateTime = useStream(getTime());

    final controller = useTextEditingController();
    final text = useState('');

    useEffect(() {
      controller.addListener(() {
        text.value = controller.text;
      });
      return null;
    }, [controller]);

    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Column(
        children: [
          TextField(controller: controller),
          Text("You Typed ${text.value}"),
        ],
      ),
    );
  }
}
