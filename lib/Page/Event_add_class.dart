class EventdetailAddClass {
  late String titleEvent;
  late String discriptionEvent;
  late String dateofEvent;
  late String docId = '';

  String get titleEventfun {
    return this.titleEvent;
  }

  set titleEventfun(String str) {
    this.titleEvent = str;
  }

  String get discriptionfun {
    return this.discriptionEvent;
  }

  set discriptionfun(String str) {
    this.discriptionEvent = str;
  }

  String get dateofEventfun {
    return this.dateofEvent;
  }

  set dateofEventfun(String str) {
    this.dateofEvent = str;
  }

   String get idOfEventfun {
    return this.docId;
  }

  set idOfEventfun(String str) {
    this.docId = str;
  }

}
