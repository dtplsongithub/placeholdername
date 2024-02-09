IntDict ldb;
void ldbrender() {
  for (int l = 0; l<ldbscoredata.length; l++) {
    for (int i = 0; i<16; i++){
      int x = i*20+width/2-16*25;
      int y = l*50+height/2-4*25;
      if(l == 0)
      text(ldbstrdata[l].charAt(i),x+sin(float(t+i*10)/25)*5,y+cos(float(t+i*10)/25)*5);
      else
      text(ldbstrdata[l].charAt(i),x, y);
    }
  }
}
void ldbloaddata() {
  ldbstrdata = expand(ldbstrdata,ceil(ldbdata.length/tablerowsize));
  ldbscoredata = expand(ldbscoredata,ceil(ldbdata.length/tablerowsize));
  for(int i = 0; i<ceil(ldbdata.length/tablerowsize); i++){
    ldbstrdata[i] = "";
    for(int j = 0; j<tablerowsize-4; j++){
      if(i*tablerowsize+j>ldbdata.length-1)break;
      ldbstrdata[i] += char(ldbdata[i*tablerowsize+j]);
    }
    int scoretemp = 0;
    for(int j = 0; j<4; j++){
      scoretemp += ldbdata[i*tablerowsize+j+16]&127; 
      scoretemp <<= 8;
    }
    ldbscoredata[i] = scoretemp;
    ldb.set(ldbstrdata[i], ldbscoredata[i]);
  }
  ldb.sortValues();
  int i = 0;
  for (String k : ldb.keys()) { // oh well
    ldbstrdata[i] = k;
    ldbscoredata[i] = ldb.get(k);
    i++;
  }
}