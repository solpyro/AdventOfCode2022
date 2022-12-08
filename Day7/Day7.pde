import java.util.Map;

//String file = "test.txt";
String file = "data.txt"; 

Folder root;

StringList[] stacks;
String[] instructions;

void setup() {
  parse();
  part1();
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
          current.Files.add(new File(Parse.fileName(line), Parse.fileSize(line)));
        }
      }
   }
   println(root.CountFolders()+" folders, "+root.CountFiles()+" files");
}

void part1() {
  HashMap<String,Long> directories = new HashMap<String,Long>();
  
  directories.put(root.Name, root.Size());
  println(root.Name, root.Size());
  AddFoldersToDictionary(root.Folders, directories, "-"); 
 
  long totalSizesLessThan100k = 0;
  for(Map.Entry<String,Long> e: directories.entrySet()) {
    //println(e.getKey(), e.getValue());
    if(e.getValue()<=100000) {
      totalSizesLessThan100k += e.getValue();
    }
    println(e.getValue(), totalSizesLessThan100k);
  }
  
  println("Total folder sizes less than 100k: "+totalSizesLessThan100k);
}

void AddFoldersToDictionary(ArrayList<Folder> folders, HashMap<String,Long> dict, String indent) {
  for(Folder folder: folders) {
    dict.put(folder.Name, folder.Size());
    println(indent, folder.Name, folder.Size());
    AddFoldersToDictionary(folder.Folders, dict, indent+"-");
  }
}