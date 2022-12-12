void drawMap() {
  drawTerrain();
  drawBarriers();
  drawTerminals();
}

void drawTerrain() {
  noStroke();
  println("x",heightMap[0].length,"y",heightMap.length);
  for(int y=0; y<heightMap.length; y++)
    for(int x=0; x<heightMap[y].length; x++) {
      fill(color(heightMap[y][x]*10));
      rect(5*x,5*y,5,5);
    }
}

void drawBarriers() {
  stroke(0,0,255);
  for(int i=0;i<heightMap.length;i++) {
    drawVerticalBarriers(i);
    if(i>0)
      drawHorizontalBarriers(i);
  }
}
void drawVerticalBarriers(int y){
  for(int x=1;x<heightMap[y].length;x++)
    if(abs(heightMap[y][x]-heightMap[y][x-1])>10)
      line(x*5,y*5,x*5,y*5+5);
}
void drawHorizontalBarriers(int y){
  for(int x=1;x<heightMap[y].length;x++)
    if(abs(heightMap[y][x]-heightMap[y-1][x])>10)
      line(x*5,y*5,x*5+5,y*5);
}

void drawTerminals() {
  noStroke();
  fill(0,255,0);
  ellipse(start[0]*5+3,start[1]*5+3,3,3);
  fill(255,0,0);
  ellipse(end[0]*5+3,end[1]*5+3,3,3);
}