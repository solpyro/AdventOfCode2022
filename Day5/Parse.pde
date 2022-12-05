public static class Parse {
  public static StringList[] Containers(String[] containers) {
    int stackCount = GetStackCount(containers[containers.length-1]);
    StringList[] stacks = new StringList[stackCount];
    
    for(int i=0; i<stackCount;i++) {
      stacks[i] = new StringList();
      for(int j=containers.length-2; j>=0; j--) {
        if((i*4)+1>containers[j].length()) break;
        println(j, (i*4)+1,containers[j]);
        if(containers[j].substring((i*4)+1,1)==" ") break;
        stacks[i].append(containers[j].substring((i*4)+1,1));
      }
    }
    return stacks;
  }
  
  private static int GetStackCount(String stackNumbers) {
    stackNumbers = trim(stackNumbers);
    return int(stackNumbers.substring(stackNumbers.length()-1));
  }
  
}