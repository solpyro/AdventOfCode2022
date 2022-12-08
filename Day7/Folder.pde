class Folder {
  Folder Parent;
  String Name;
  ArrayList<Folder> Folders;
  ArrayList<File> Files;
  
  Folder(String name, Folder parent) {
    Name = name;
    Parent = parent;
    
    Folders = new ArrayList<Folder>();
    Files = new ArrayList<File>();
  }
  
  Folder Child(String folderName) {
    for(Folder child: Folders) {
      if(child.Name == folderName)
        return child;
    }
    return null;
  }
}