import 'package:flutter/material.dart';

class Demo {
  String id;
  String name;
  Demo({required this.id, required this.name});
}

List<Demo> a = [
  Demo(id: "2", name: "TH2"),
  Demo(id: "3", name: "TH3"),
  Demo(id: "4", name: "TH4"),
  Demo(id: "5", name: "TH5"),
  Demo(id: "6", name: "TH6"),
];

class DemoScreen extends StatefulWidget {
  const DemoScreen({
    super.key,
    required this.id,
  });
  final String id;
  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  ScrollController controller = ScrollController();
  TextEditingController textEditingController = TextEditingController();
  late String name;
  late List<String> b;

  @override
  void initState() {
    textEditingController.clear();
    super.initState();
    textEditingController.addListener(() {
      setState(() {});
    });
  }

  Future<String> demo() async {
    setState(() {
      name = a.where((element) => element.id == widget.id).first.name;
      b = List.generate(100, (index) => index.toString());
    });
    return widget.id;
  }

  @override
  void dispose() {
    textEditingController.dispose();
    textEditingController.removeListener(() {
      setState(() {});
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: demo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      controller: controller,
                      child: Center(
                        child: Column(
                          children: [
                            Text(name),
                            ...b.map(
                              (e) => Text(e),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextEditor(textEditingController: textEditingController),
                  Text(textEditingController.text),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

class TextEditor extends StatefulWidget {
  const TextEditor({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  State<TextEditor> createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      decoration: const InputDecoration(hintText: "Aa"),
    );
  }
}
