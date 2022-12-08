//String file = "test.txt";
String file = "data.txt"; 

int[][] trees;
boolean[][] isVisible;

void setup() {
  parse();
  part1();
  //part2();

  size(990, 990);
  noLoop();
}

void parse() {
  String[] lines = loadStrings(file);
  trees = new int[lines.length][];
  for (int i=0; i<lines.length; i++) {
    trees[i] = new int[lines[i].length()];
    for (int j=0; j<lines[i].length(); j++) {
      trees[i][j] = Character.getNumericValue(lines[i].charAt(j));
    }
  }
}

void part1() {
  isVisible = new boolean[trees.length][];
  for(int i=0;i<trees.length;i++) {
    isVisible[i] = new boolean[trees.length];
    for(int j=0;j<trees[i].length;j++) {
      if(i==0 || j==0 || i==trees.length-1 || j==trees[i].length-1) {
        isVisible[i][j] = true;
      } else {
        isVisible[i][j] = isHighestOnAnySide(i,j);
      }      
    }
  }
  
  int trues = 0;
  for(boolean[] row: isVisible)
    for(boolean visible: row)
      trues += visible?1:0;
  println(trues+" trees are visible");
}
boolean isHighestOnAnySide(int i, int j) {
  return trees[i][j] > maxInRow(i,0,j)
      || trees[i][j] > maxInRow(i,j+1,trees.length)
      || trees[i][j] > maxInCol(j,0,i)
      || trees[i][j] > maxInCol(j,i+1,trees.length);
}
int maxInRow(int row, int start, int end) {
  int result = 0;
  for(int i=start;i<end;i++)
    if(trees[row][i]>result)
      result = trees[row][i];
  return result; 
}
int maxInCol(int col, int start, int end) {
  int result = 0;
  for(int i=start;i<end;i++)
    if(trees[i][col]>result)
      result = trees[i][col];
  return result; 
}

int mode = 0;
color white = color(255, 255, 255);
color green = color(0, 255, 0);
void draw() {
  fill(color(255, 255, 255));
  int step = 990/trees.length;
  int halfStep = step/2;
  for (int y=0; y<trees.length; y++) {
    int yPos = y * step + halfStep;
    for (int x=0; x<trees[y].length; x++) {
      int diameter = step * (trees[y][x]+1) / 10;
      fill(mode==1?isVisible[y][x]?green:white:white);
      ellipse(x * step + halfStep, yPos, diameter, diameter);
    }
  }
}
void keyPressed() {
  mode = (mode+1)%2;
  redraw();
}