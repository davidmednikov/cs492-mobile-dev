import 'journal_entry_model.dart';

class JournalModel {

  List<JournalEntryModel> entries;

  JournalModel({ this.entries });

  JournalEntryModel getJournalEntry(int journalEntryId) {
    int index = entries.indexWhere( (entry) => entry.id == journalEntryId);
    if (index != -1) {
      return entries.elementAt(index);
    }
    return null;
  }
}