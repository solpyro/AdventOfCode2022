String toSnafu(int input) {
  //convert to SNAFU
  throw new RuntimeException("Not implemented");
}

int toInt(String input) {
  //decode to a real integer
  throw new RuntimeException("Not implemented");
}

int[] toInts(String[] input) {
  int[] output = new int[input.length];
  
  for(int i=0;i<input.length;i++)
    output[i] = toInt(input[i]);
  
  return output;
}