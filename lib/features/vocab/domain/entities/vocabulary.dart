class Vocabulary {
  final String name;
  final String meaning;
  final String wordType; // Noun / Verb / Adjective / Adverb
  final String? phonetic;

  Vocabulary({
    required this.name,
    required this.meaning,
    required this.wordType,
    this.phonetic,
  });
}
