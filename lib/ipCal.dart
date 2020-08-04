void ip2Int(String a, String msk) {
  List<int> ips = [];
  List<int> mask = [];
  List<int> subnet = [];
  var last, lastM;
  for (int i = 0; i < 3; i++) {
    last = a.indexOf(".");
    lastM = msk.indexOf(".");
    ips.add(int.parse(a.substring(0, last)));
    mask.add(int.parse(msk.substring(0, lastM)));
    a = a.substring(last + 1, a.length);
    msk = msk.substring(lastM + 1, msk.length);
    subnet.add(ips[i] & mask[i]);
  }
  ips.add(int.parse(a));
  mask.add(int.parse(msk));
  print(ips);
  print(mask);
  subnet.add(ips[3] & mask[3]);
  print(subnet);
}

void main() {
  ip2Int("192.168.0.1", "255.255.255.0");
}
