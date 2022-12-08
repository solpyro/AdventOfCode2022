String file = "test.txt";
//String file = "data.txt"; 

Folder root;

StringList[] stacks;
String[] instructions;

void setup() {
  parse();
  //part1();
  //part2();
}

void parse() {
   String[] lines = loadStrings(file);
   Folder current = new Folder(null, null); //this will get destroyed but is required for the compiler
   for(String line: lines) {
      if(Parse.isCommand(line)) {
        if(Parse.isCdCommand(line)) {
          String action = Parse.cdAction(line);
          switch(action) {
            case"/": //initilise root
              root = new Folder(action, null);
              current = root;
              break;
            case "..": //step up the tree
              current = current.Parent;
              break;
            default: //find directory in current folder
              current = current.Child(action);
          }
        }
      } else {
        if(Parse.isDirectory(line)) {
          current.Folders.add(new Folder(Parse.directoryName(line), current));
        } else {
          current.Files.add(new File(Parse.fileName(line), Parse.fileSize(line))); //<>//
        }
      }
   }
}