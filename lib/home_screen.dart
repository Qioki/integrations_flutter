import 'package:flutter/material.dart';
import 'package:integrations_flutter/platform_view_mobile.dart';
import 'package:integrations_flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _services = PlatformService();
  final TextEditingController _editingController = TextEditingController();

  void _setText() async {
    _services.setText(_editingController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 200,
              child: PlatformWidget(),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      controller: _editingController,
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: _setText,
                    icon: const Icon(Icons.arrow_forward),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
