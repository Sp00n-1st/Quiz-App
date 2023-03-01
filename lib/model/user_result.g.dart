// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_result.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserResultAdapter extends TypeAdapter<UserResult> {
  @override
  final int typeId = 2;

  @override
  UserResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserResult(
      correctAnswer: (fields[4] as List).cast<String?>(),
      listAnswerint: (fields[3] as List).cast<int?>(),
      numberQuestion: fields[5] as int?,
      category: fields[0] as int?,
      difficulty: fields[1] as String?,
      listAnswerUser: (fields[2] as List).cast<String?>(),
      isDone: fields[6] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, UserResult obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.difficulty)
      ..writeByte(2)
      ..write(obj.listAnswerUser)
      ..writeByte(3)
      ..write(obj.listAnswerint)
      ..writeByte(4)
      ..write(obj.correctAnswer)
      ..writeByte(5)
      ..write(obj.numberQuestion)
      ..writeByte(6)
      ..write(obj.isDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
