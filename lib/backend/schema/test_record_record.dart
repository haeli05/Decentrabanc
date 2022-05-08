import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'test_record_record.g.dart';

abstract class TestRecordRecord
    implements Built<TestRecordRecord, TestRecordRecordBuilder> {
  static Serializer<TestRecordRecord> get serializer =>
      _$testRecordRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Time')
  DateTime get time;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TestRecordRecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('TestRecord');

  static Stream<TestRecordRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TestRecordRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TestRecordRecord._();
  factory TestRecordRecord([void Function(TestRecordRecordBuilder) updates]) =
      _$TestRecordRecord;

  static TestRecordRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTestRecordRecordData({
  DateTime time,
}) =>
    serializers.toFirestore(
        TestRecordRecord.serializer, TestRecordRecord((t) => t..time = time));
