interface CouchDB default CouchDBWrapperImpl {
  bool DEBUG;
  
  createDb(var dbName);
  deleteDb(var dbName);
  listDb();
  infoDb(var dbName);
  listDoc(var dbName);
  openDoc(var dbName, var docId);
  saveDoc(var dbName, var body, [var docId]);
  deleteDoc(var dbName, var docId, [var rev_id]);
  
}
