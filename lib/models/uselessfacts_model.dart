class Uselessfacts {
  const Uselessfacts({
    required this.text,
    required this.source,
  });

  final double text;
  final String source;

  Uselessfacts.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        source = json['source'];
}
