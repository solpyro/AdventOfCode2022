void part1() {
  int totalOpenFaces = 0;
  
  for(int x = 0;x<cubes.length; x++)
    for(int y = 0;y<cubes[x].length; y++)
      for(int z = 0;z<cubes[x][y].length; z++)
        if(cubes[x][y][z])
          totalOpenFaces += openFaces(x,y,z);
  
  println("Lava blob has surface area of",totalOpenFaces);
}

int openFaces(int x, int y, int z) {
  int openFaces = 0;
  
  if(x==0 || !cubes[x-1][y][z]) openFaces++;
  if(y==0 || !cubes[x][y-1][z]) openFaces++;
  if(z==0 || !cubes[x][y][z-1]) openFaces++;
  if(x+1==cubes.length || !cubes[x+1][y][z]) openFaces++;
  if(y+1==cubes.length || !cubes[x][y+1][z]) openFaces++;
  if(z+1==cubes.length || !cubes[x][y][z+1]) openFaces++;
  //check each face
  
  return openFaces;
}