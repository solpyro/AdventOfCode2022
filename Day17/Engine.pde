Rock createRock() {
  Rock rock = new Rock(rockSequence.charAt(rockPtr));
  rockPtr = incrementPointer(rockPtr, rockSequence);

  int highestRock = getHighestRock();
  for (int i=0; i<(rock.shape.length+3-highestRock); i++)
    addRowToBoard();
  
  highestRock = getHighestRock();
  rock.y = highestRock-(3+rock.shape.length);
  rockCounter++;
  return rock;
}

void fireJets() {
  moveRock(jetSequence.charAt(jetPtr));
  jetPtr = incrementPointer(jetPtr, jetSequence);
}

void moveRock(char direction) {
  int dir = (direction=='<')?-1:1;

  if ((rock.x+dir < 0) || (rock.x+dir > 7-rock.shape[0].length))
    return;

  for(int y = 0;y<rock.shape.length;y++)
    for(int x = 0;x<rock.shape[y].length;x++)
      if(rock.shape[y][x] && board.get(rock.y+y)[rock.x+x+dir])
        return;

  rock.x += dir;
}

boolean dropRock() {
  if (rock.y+rock.shape.length>=board.size())
    return false;

  for(int y = 0;y<rock.shape.length;y++)
    for(int x = 0;x<rock.shape[y].length;x++)
      if(rock.shape[y][x] && board.get(rock.y+y+1)[rock.x+x])
        return false;

  rock.y+=1;
  return true;
}

void writeRockToBoard() {
  for (int y = 0; y<rock.shape.length; y++)
    for (int x = 0; x<rock.shape[y].length; x++)
      if (rock.shape[y][x])
        board.get(rock.y+y)[rock.x+x] = true;
}

int incrementPointer(int ptr, String sequence) {
  ptr++;
  if (ptr==sequence.length()) ptr = 0;
  return ptr;
}

void addRowToBoard() {
  board.add(0, new boolean[]{false, false, false, false, false, false, false});
}

int getBoardTop() {
  if (board.size() >=21) return 0;
  return 20 - board.size();
}

int getHighestRock() {
  for (int y=0; y<board.size(); y++)
    for (int x=0; x<board.get(y).length; x++)
      if(board.get(y)[x])
        return y;
  return board.size();
}