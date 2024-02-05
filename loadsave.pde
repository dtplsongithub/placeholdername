byte[] ldbdata;
byte[] ldbgener = {};
int tablerowsize = 20;
void ldbrenderdata() {
  text("leaderboard.dat", 300, 30);
  for(int i = 0; i<ceil(ldbdata.length/tablerowsize)+1; i++){
    for(int j = 0; j<tablerowsize; j++){
      if(i*tablerowsize+j>ldbdata.length-1)break;
      text(hex(ldbdata[i*tablerowsize+j]), j*28+300, i*20+70);
    }
  }
  text("generated data", 300, 530);
  for(int i = 0; i<ceil(ldbgener.length/tablerowsize)+1; i++){
    for(int j = 0; j<tablerowsize; j++){
      if(i*tablerowsize+j>ldbgener.length-1)break;
      text(hex(ldbgener[i*tablerowsize+j]), j*28+300, i*20+570);
    }
  }
  text("parsed leaderoard.dat data", 300, 280);
  for(int i = 0; i<ceil(ldbdata.length/tablerowsize); i++){
    for(int j = 0; j<tablerowsize-4; j++){
      if(i*tablerowsize+j>ldbdata.length-1)break;
      text(char(ldbdata[i*tablerowsize+j]), j*28+300, i*20+320);
    }
    int scoretemp = 0;
    for(int j = 0; j<4; j++){
      scoretemp += ldbdata[i*tablerowsize+j+16]&127; 
      scoretemp <<= 8;
    }
    text(scoretemp, 768, i*20+320);
  }
}
void ldbload() {
  ldbdata = loadBytes("leaderboard.dat");
}
String[] ldbparsestring(byte[] ldbdatatemp) {
  String[] togo = {};
  for(int i = 0; i<ldbdatatemp.length/24; i++){
    String togointogo = "";
    for(int j = 0; j<20; j++){
      togointogo = str(char(ldbdatatemp[i*24+j]&127));
    }
    togo = append(togo, togointogo);
  }
  return togo;
}
void ldbsave(String[] namet, int[] scoret){
  byte[] ldbdatatemp = {};
  for (int i = 0; i<namet.length; i++){
    ldbdatatemp = concat(ldbdatatemp, strconv(namet[i], scoret[i]));
  }
  saveBytes("leaderboard.dat", ldbdatatemp);
}
byte[] ldbgeneratedata() {
  byte[] togo = {};
  for(int i = 0; i<random(3, 7); i++){
    for(int j = 0; j<16; j++){
      togo = append(togo, (byte)(random(65, 122)));
    }
    for(int j = 0; j<4; j++){
      togo = append(togo, (byte)(random(0, 255)));
    }
  }
  return togo;
}
