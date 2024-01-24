class Quizzes {
  final String id, question, asn, status;
  final List<String> options;
  final DateTime? date;

  const Quizzes({
    required this.id,
    required this.question,
    required this.options,
    required this.asn,
    required this.status,
    this.date,
  });
  static const Quizzes empty = Quizzes(
    id: '',
    question: '',
    options: [],
    status: '0',
    asn: '',
  );

  @override
  String toString() {
    return 'Quiz{id: $id, question: $question, asn: $asn, status: $status, options: $options, date: $date}';
  }

  Quizzes copyWith({
    String? id,
    String? question,
    List<String>? options,
    String? asn,
    String? status,
    DateTime? date,
  }) {
    return Quizzes(
      id: id ?? this.id,
      question: question ?? this.question,
      options: options ?? this.options,
      asn: asn ?? this.asn,
      status: status ?? this.status,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'options': options,
      'asn': asn,
      'status': status,
      'date': date,
    };
  }
}
