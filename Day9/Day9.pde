//String file = "test.txt";
String file = "data.txt"; 

Motion[] motions;
Point start, head, tail;
PGraphics trace;
int startTime;

void setup() {
  parse();
  size(401,401);
  background(0);
  
  int midpoint = ceil(width/2f);
  start = new Point(midpoint,midpoint);
  head = new Point(midpoint,midpoint);
  tail = new Point(midpoint,midpoint);
  trace = createGraphics(width, height);
  trace.beginDraw();
  trace.background(0);
  trace.endDraw();
  startTime = millis();
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
    int time = millis()-startTime;
    println("Drawing the path took "+(time/1000f)+"s");
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

void part1() {
  int counter = 0;
  trace.loadPixels();
  for(color px:trace.pixels) {
    if(px != color(0))
      counter++;
  }
  println(counter+" pixels were visited by the tail");
}