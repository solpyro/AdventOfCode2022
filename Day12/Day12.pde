//String file = "test.txt";
String file = "data.txt"; 

int[][] heightMap;
int[] start, end;

void setup() {
  size(865,205);//(173,41)x5
  noLoop();
  
  parse();
  
  drawMap();
}