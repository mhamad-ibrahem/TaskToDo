class NoteModel {
  final String id;
  final int numberOfTask;
  final int numberOfTaskRemains;
  final String day;
  final String date;
  final List tasks;

  NoteModel(
      {required this.id,
      required this.numberOfTask,
      required this.day,
      required this.date,
      required this.tasks,
      required this.numberOfTaskRemains});
}
