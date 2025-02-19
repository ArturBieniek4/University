int relo3(int val) {
  switch (val) {
    case 100:
      return val + 1;
    case 101:
    case 103 ... 104:
      return val + 3;
    case 105:
      return val + 5;
    case 107:
      return val + 7;
    default:
      return val + 11;
  }
}
