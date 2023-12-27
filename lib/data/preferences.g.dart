// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PreferencesModelAdapter extends TypeAdapter<PreferencesModel> {
  @override
  final int typeId = 1;

  @override
  PreferencesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PreferencesModel(
      fields[0] as String? ??'',
      fields[1] as bool? ??true,
      fields[2] as bool? ??true,
    );
  }

  @override
  void write(BinaryWriter writer, PreferencesModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.apiToken)
      ..writeByte(1)
      ..write(obj.isLight)
      ..writeByte(2)
      ..write(obj.btnLeft);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PreferencesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
