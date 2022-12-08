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
    for(Folder child: Folders)
      if(child.Name.equals(folderName))
        return child;
    return null;
  }
  
  int CountFolders() {
    int count = 1;
    for(Folder folder:Folders)
      count += folder.CountFolders();
    return count;
  }

  int CountFiles() {
    int count = Files.size();
    for(Folder folder:Folders)
      count += folder.CountFiles();
    return count;
  }
  
  long Size() {
    long size = 0;
    
    for(Folder folder: Folders) size += folder.Size();
    for(File file: Files) size += file.Size;
    
    return size;
  }
}