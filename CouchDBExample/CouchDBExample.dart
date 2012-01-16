#import('dart:html');
#import('dart:json');
#import('../CouchDBWrapper/CouchDBLib.dart');

class CouchDBExample {

  CouchDBExample() {
  }

  void run() {
    write("Hello World!");
    var c = new CouchDB();
    
    write("Create database 'mydb':");
    write(c.createDb('mydb'));
    
    write("List databases on server:");
    write(c.listDb());

    write( "Create a document 'mydoc' in database 'mydb':");
    var doc = '''
    {
        "value":
        {
            "Subject":"I like Planktion",
            "Author":"Rusty",
            "PostedDate":"2006-08-15T17:30:12-04:00",
            "Tags":["plankton", "baseball", "decisions"],
            "Body":"I decided today that I don't like baseball. I like plankton."
        }
    }
    ''';
    write(c.saveDoc('mydb', doc, 'mydoc'));
    
    write("Create a document, using an assigned docId:");
    write(c.saveDoc('mydb', doc));
    

    write("List all documents in database 'mydb'");
    write(c.listDoc('mydb'));

    write("Retrieve document 'mydoc' in database 'mydb':");
    String i=c.openDoc('mydb', 'mydoc');
    write(i);

    var r = JSON.parse(i);
    
    write("Delete document 'mydoc' in database 'mydb':");
    write(c.deleteDoc('mydb', 'mydoc', r['_rev']));

    write("List all documents in database 'mydb'");
    write(c.listDoc('mydb'));

    write("List info about database 'mydb':");
    write(c.infoDb('mydb'));

    write("Delete database 'mydb':");
    write(c.deleteDb('mydb'));

    write("List databases on server:");
    write(c.listDb());
    
    write("Goodbye World!");
  }

  void write(String message) {
    // the HTML library defines a global "document" variable
    document.query('#status').innerHTML = document.query('#status').innerHTML + '<br /> ' + message;
  }
}

void main() {
  new CouchDBExample().run();
}
