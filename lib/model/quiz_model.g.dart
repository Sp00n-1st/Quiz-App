// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuizModelAdapter extends TypeAdapter<QuizModel> {
  @override
  final int typeId = 0;

  @override
  QuizModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuizModel(
      responseCode: fields[0] as int?,
      results: (fields[1] as List?)?.cast<Results>(),
    );
  }

  @override
  void write(BinaryWriter writer, QuizModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.responseCode)
      ..writeByte(1)
      ..write(obj.results);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuizModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ResultsAdapter extends TypeAdapter<Results> {
  @override
  final int typeId = 1;

  @override
  Results read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Results(
      category: fields[0] as String?,
      type: fields[1] as String?,
      difficulty: fields[2] as String?,
      question: fields[3] as String?,
      correctAnswer: fields[4] as String?,
      incorrectAnswers: (fields[5] as List?)?.cast<String>(),
      answers: (fields[6] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Results obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.difficulty)
      ..writeByte(3)
      ..write(obj.question)
      ..writeByte(4)
      ..write(obj.correctAnswer)
      ..writeByte(5)
      ..write(obj.incorrectAnswers)
      ..writeByte(6)
      ..write(obj.answers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
