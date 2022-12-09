//String file = "test.txt";
String file = "data.txt"; 

Motion[] motions;
Point start, head, tail;
PGraphics trace;

void setup() {
  parse();
  size(1001,1001);
  background(0);
  
  int midpoint = ceil(width/2f);
  start = new Point(midpoint,midpoint);
  head = new Point(midpoint,midpoint);
  tail = new Point(midpoint,midpoint);
  trace = createGraphics(width, height);
  trace.beginDraw();
  trace.background(0);
  trace.endDraw();
}
int step = 0;
void draw() {
  addTailToTrace();
  image(trace, 0, 0);
  
  updateHead(motions[step].Direction);
  updateTail();
  
  motions[step].Steps--;
  if(motions[step].Steps == 0) step++;
  
  set(start.x, start.y, color(0,0,255));
  set(tail.x, tail.y, color(255,0,0));
  set(head.x, head.y, color(0,255,0));
  
  if(step == motions.length) {
    addTailToTrace();
    noLoop();
    saveFrame(file+".png");
    part1();
    //part2();
  }
}
void addTailToTrace() {
  trace.beginDraw();
  trace.loadPixels();
  trace.pixels[tail.y*trace.width + tail.x] = color(255);
  trace.updatePixels();
  trace.endDraw();
}

void parse() {
  String[] steps = loadStrings(file);
  motions = new Motion[steps.length];
  for(int i=0; i<steps.length; i++)
    motions[i] = new Motion(steps[i]);
}
void updateHead(char dir) {
  switch(dir) {
    case 'U':
      head.y--;
      break;
    case 'D':
      head.y++;
      break;
    case 'L':
      head.x--;
      break;
    case 'R':
      head.x++;
      break;
    default: throw new RuntimeException("Cannot move in direction "+dir);
  }
}
void updateTail() {
  int xDiff = tail.x-head.x;
  int yDiff = tail.y-head.y;
  if(abs(xDiff)>1) {
    tail.x -= abs(xDiff)/xDiff;
    if(abs(yDiff)>0)
      tail.y -= abs(yDiff)/yDiff;
    return;
  } else if(abs(yDiff)>1) {
    tail.y -= abs(yDiff)/yDiff;
    if(abs(xDiff)>0)
      tail.x -= abs(xDiff)/xDiff;
  }
}

void part1() {
  int counter = 0;
  trace.loadPixels();
  for(color px:trace.pixels) {
    if(px != color(0))
      counter++;
  }
  println(counter+" pixels were visited by the tail");
}