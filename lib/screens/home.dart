import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/animal_trivia.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFact = ref.watch(trivia);

    return Scaffold(
      appBar: AppBar(title: const Text('Animal Trivia')),
      body: SizedBox.expand(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SelectableText(
              currentFact,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
            Positioned(
              bottom: 20,
              child: ElevatedButton(
                onPressed: () {
                  ref.read(trivia.notifier).refreshFact();
                },
                child: const Text('New Fact'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
