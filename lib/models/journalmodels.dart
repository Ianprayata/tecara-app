class JournalModels {
  String journalId = '';
  String title = "";
  String dateMade = "";
  String description = "";
  String todayFeeling = "";
  String sadFeeling = "";
  String happyFeeling = "";

  JournalModels(
      {this.journalId = '',
      this.title = "",
      this.description = "",
      this.dateMade = "",
      this.happyFeeling = "",
      this.sadFeeling = "",
      this.todayFeeling = ""});
}
