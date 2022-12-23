String file = "test.txt";
//String file = "data.txt";

PGraphics buffer;
final color FIELD = color(0,0,0);
final color ELF = color(255,0,0);

void setup() {
  size(799,799);//real map is 150*200 units
  buffer = createGraphics(width,height);
  
  parse();
  image(buffer,0,0);
}

void parse() {
  String[] rows = loadStrings(file);
  
  int left = (width-rows[0].length())/2;
  int top = (height-rows.length)/2; 
  
  buffer.beginDraw();
  buffer.background(FIELD);
  for(int y = 0;y<rows.length;y++)
    for(int x = 0;x<rows[y].length();x++)
      if(rows[y].charAt(x)=='#')
        buffer.set(left+x,top+y,ELF);
  buffer.endDraw();
}