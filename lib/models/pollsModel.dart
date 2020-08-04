import 'package:hive/hive.dart';

part 'pollsModel.g.dart';

@HiveType (typeId: 1)
class PollsModel {
  @HiveField(0)
  final String question;
  @HiveField(1)
  final String A;
  @HiveField(2)
  final String B;
  @HiveField(3)
  final String C;
  @HiveField(4)
  final String D;
  @HiveField(5)
  final String sr_no;
  @HiveField(6)
  int aLike;
  @HiveField(7)
  int bLike;
  @HiveField(8)
  int cLike;
  @HiveField(9)
  int dLike;

  PollsModel(
      {this.question,
      this.A,
      this.B,
      this.C,
      this.D,
      this.sr_no,
      this.aLike,
      this.bLike,
      this.cLike,
      this.dLike});
}
