class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options,
      });
}

const List sample_data = [
  {
    "id": 1,
    "question":
        'Qual é o nome do protagonista do livro "O Guia do Mochileiro das Galáxias" de Douglas Adams?',
    "options": ['John Smith', 'Arthur Dent', 'Luke Skywalker', 'Frodo Bolseiro'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": 'Qual é o nome do personagem principal na série de jogos "The Legend of Zelda"?',
    "options": ['Mario', 'Sonic', 'Link', 'Donkey Kong'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": 'Qual é a fórmula química para o dióxido de carbono?',
    "options": ['CO', 'H2O', 'CO2', 'CH4'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": 'Quem é considerado o "pai da computação"?',
    "options": ['Steve Jobs', 'Bill Gates', 'Alan Turing', 'Tim Berners-Lee'],
    "answer_index": 2,
  },
];
