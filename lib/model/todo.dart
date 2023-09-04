class ToDo{
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone=false,


  });

  static List<ToDo> todoList(){
    return[
      ToDo(id: '01', todoText: 'Break_fast',isDone: true),
      ToDo(id: '02', todoText: 'Binaural_beats',isDone: false),
      ToDo(id: '03', todoText: 'DSA',isDone: false),
      ToDo(id: '04', todoText: 'CP',isDone: false),
      ToDo(id: '05', todoText: 'Development',isDone: false),




    ];
  }




}