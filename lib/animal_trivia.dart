import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimalTrivia {
  static final List<String> _facts = [
    'A group of flamingos is called a "flamboyance".',
    'Octopuses have three hearts.',
    'Cows have best friends and can become stressed when separated.',
    'A snail can sleep for three years.',
    'Elephants are the only animals that can\'t jump.',
  ];

  String getRandomFact() {
    final index = DateTime.now().millisecondsSinceEpoch % _facts.length;
    return _facts[index];
  }
}

class TriviaNotifier extends Notifier<String> {
  @override
  String build() {
    final trivia = AnimalTrivia();
    return trivia.getRandomFact();
  }

  void refreshFact() {
    state = AnimalTrivia().getRandomFact();
  }
}

final trivia = NotifierProvider<TriviaNotifier, String>(TriviaNotifier.new);
