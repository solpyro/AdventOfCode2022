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