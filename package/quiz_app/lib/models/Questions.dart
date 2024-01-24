class Question {
  final String id, answer;
  final String question;
  final List<String> options;

  const Question({
    required this.id,
    required this.answer,
    required this.question,
    required this.options,
  });

  @override
  String toString() {
    return 'Question{' +
        ' id: $id,' +
        ' answer: $answer,' +
        ' question: $question,' +
        ' options: $options,' +
        '}';
  }

  Question copyWith({
    String? id,
    String? answer,
    String? question,
    List<String>? options,
  }) {
    return Question(
      id: id ?? this.id,
      answer: answer ?? this.answer,
      question: question ?? this.question,
      options: options ?? this.options,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'answer': this.answer,
      'question': this.question,
      'options': this.options,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'] as String,
      answer: map['answer'] as String,
      question: map['question'] as String,
      options: map['options'] as List<String>,
    );
  }

 }

const List sample_data = [
  {
    "id": 1,
    "question":
        "Flutter is an open-source UI software development kit created by ______",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "When google release Flutter.",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "A memory location that holds a single letter or number.",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "What command do you use to output data to the screen?",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": 2,
  },
];
