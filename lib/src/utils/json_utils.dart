import 'package:cloud_firestore/cloud_firestore.dart';

timestampToDateTime(Timestamp? timestamp) => timestamp == null
    ? null
    : DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);

dateTimeToTimestamp(DateTime? dateTime) =>
    dateTime == null ? null : Timestamp.fromDate(dateTime);
