class PollsModel {
  final String question;
  final String A;
  final String B;
  final String C;
  final String D;
  final String sr_no;
  int aLike;
  int bLike;
  int cLike;
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
