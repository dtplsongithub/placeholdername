/*

 DJV_PYD
 
 */
int menuselect = 0;
int menu = 0;
float px = 0;
float py = 0;
float vx = 0;
float vy = 0;
int t = 0;
int togo = 0;
String[][] menuopts = {
  {
    "load/save test",
    "title screen",
    "cutscene test",
    "sfx test",
    "go to game",
    "easedemo",
    "go to menu",
    "go to leaderboard"
  },{},{},{
    "back"
  },{},{},{
    "generate data",
    "write generated data",
    "load",
    "do all of the above",
    "back"
  },{},{
    "wandering",
    "hit"
  },{},{},{
    "resume",
    "quit"
  }
};
Player p;
PFont msg14, msg20, msg48;

void setup() {
  //fullScreen(P2D);
  size(1024, 768, P3D);
  background(0);
  textSize(48);
  msg20 = loadFont("/fonts/MS-Gothic-20.vlw");
  textFont(msg20);
  text("LOADING...", 77, 77);
  msg14 = loadFont("/fonts/MS-Gothic-14.vlw");
  msg48 = loadFont("/fonts/MS-Gothic-48.vlw");
  noStroke();
  frameRate(60);
  surface.setTitle("placeholdername");
  surface.setResizable(false);
  println(P2D);
  p = new Player(500, 500, 0.8, 4);
  textSize(20);
  loadwave(waveno);
  ldb = new IntDict();
}
void draw() {
  t++;
  if(menu != 4)background(0);
  switch (menu) {
  case 0: {
      t--;
      options();
      break;
    }
    case 1: { // title screen
      
      break;
    }
  case 2: { // game
    p.move();
    p.display();
    updateparticle();
    enemy();
    rightside(0);
    break;
  }
  case 3: {
    easedemo();
    options();
    break;
  }
  case 4: { // go to a menu and reset the timer
    t = 0;
    menuselect = 0;
    menu = togo;
    if (togo == 4)menu = 0; // dont get stuck in an infinite loop kids its not fun
    break;
  }
  case 5: { // transition
    textSize(20);
    text("wave "+waveno, (width-textWidth("wave " + waveno))/2+500-map2(max(t-120, 0), 0, 30, 500, 0, QUINTIC, EASE_IN), height/2+500-map2(max(50-t, 0), 0, 50, 500, 0, QUINTIC, EASE_IN));
    textSize(32);
    for(int i = 0;i<wavename.length();i++){
      float x = (width-textWidth(wavename))/2+i*16-500+map2(max(t-130+i*2, 0), 0,30, 500, 0, QUINTIC, EASE_IN);
      float y = height/2+36+500-map2(max(30-t+10+i*2, 0), 0, 30, 500, 0, QUINTIC, EASE_IN);
      text(wavename.charAt(i), x, y);
    }
    if(t > 150) {
      rightside(map2(max(t-150, 0), 0, 30, 400, 0, QUINTIC, EASE_OUT));
    }
    if(t==180){
      togo = 2;
      menu = 4;
    }
    break;
  }
  case 6: { // ldb test
    options();
    ldbrenderdata();
    break;
  }
  case 7: {
    text("go to menu "+menuselect, 100, 100);
    break;
  }
  case 8: {
    options();
    text("enemy movement test", 100, 100);
    emd();
    break;
  }
  case 9: { // isnt it obvious?
    ldbload();
    ldbloaddata("");
    text("loading leaderboard... please wait...", 50, 50);
    menu = 4;
    togo = 10;
    break;
  }
  case 10: { // leaderboard
    ldbrender();
    break;
  }
  case 11: { // pause menu
    options();
    t--;
    break;
  }
  case 12: { // input name
    strokeWeight(6);
    fill(0);
    stroke(255);
    rect((width-500)/2, 100, 500, 100, 6);
    rect((width-500)/2, 200, 500, 550, 6);
    fill(255);
    text("Congratulations! You have ranked number "+(place+1)+"!", (width-textWidth("Congratulations! You have ranked number "+(place+1)+"!"))/2, 40);
    text("Score: "+score, (width-textWidth("Score: "+score))/2, 62);
    text("Please input your name: ", (width-textWidth("Please input your name: "))/2, 140);
    text("Or choose a name from here: ", (width-textWidth("Or choose a name from here: "))/2, 240);
    text(input, (width-textWidth(input))/2, 170);
    for(int i = 0; i<choice.length; i++){
      if(mouseX > (width-500)/2+20 && mouseX < (width-500)/2+20 + 400 && mouseY > 260+i*22-22 && mouseY < 260+i*22-22 + 21){
        noStroke();
        fill(100);
        rect((width-500)/2+20, 260+i*22-22, 400, 21);
        fill(255);
      }
      text(choice[i], (width-500)/2+20, 260+i*22);
    }
    break;
  }
  default: {
    menu = 0;
  }
  }
}

int place = 0;

void keyPressed() {
  switch (menu) {
  case 0: {
    optchmc();
      switch (keyCode) {
      case 10: {
          switch (menuselect) {
          case 0: {
            ldbload();
            menu = 6;
            break;
            }
          case 4: {
            togo = 5;
            menu = 4;
            break;
            }
          case 5: {
            menu = 3;
            break;
          }
          case 6: {
            menu = 7;
            break;
          }
          case 7: {
            menu = 9;
          }
          }
          break;
        }
      }
      break;
    }
    case 6: {
      optchmc();
      switch (keyCode) {
        case 10: {
          switch (menuselect) {
          case 0: {
            ldbgener = ldbgeneratedata();
            break;
          }
          case 1: {
            saveBytes("leaderboard.dat", ldbgener);
            break;
          }
          case 2: {
            ldbload();
            break;
          }
          case 3: {
            ldbgener = ldbgeneratedata();
            saveBytes("leaderboard.dat", ldbgener);
            ldbload();
            break;
          }
          case 4: {
            menu = 0;
            break;
            }
          }
          break;
        }
      }
    }
    case 2: {
      p.setMove(keyCode, true);
      if (keyCode == 80) {
        menu = 11;
      }
      break;
    }
    case 3: {
      if(keyCode == 10) menu = 0;
      break;
    }
    case 7: {
      switch (keyCode) {
        case 40: {
          menuselect--;
          break;
        }
        case 38: {
          menuselect++;
          break;
        }
        case 10: {
          togo = menuselect;
          menu = 4;
          break;
        }
      }
      break;
    }
    case 8: {
      optchmc();
      break;
    }
    case 11: {
      optchmc();
      if (keyCode == 10) {
        switch (menuselect) {
          case 0: {
            menu = 2;
            break;
          }
          case 1: {
            ldbload();
            ldbloaddata("");
            place = -1;
            input = ""; // yes
            choice = new String[0]; // yes
            for (int i = 0; i<ldbstrdata.length; i++) {
              boolean doesithave = false;
              for (int l = 0; l<choice.length; l++) {
                if (choice[l] == ldbstrdata[i]) doesithave = true;
                println(choice[l], ldbstrdata[i]);
              }
              if (doesithave){
                println("i found a string twice bangbang");
                continue;
              }
              choice = append(choice, ldbstrdata[i]);
            }
            for (int i = 0; i < ldbscoredata.length; i++) {
              if (ldbscoredata[i] < score) {
                println(ldbscoredata[i] + " is smaller than " + score + " which means its in place " + i);
                place = i;
                break;
              }
            }
            if (place == -1) place = ldbscoredata.length;
            if (place<20){
              togo = 12;
              menu = 4;
            };
            break;
          }
        }
      }
      break;
    }
    case 12: {
      kbd();
      break;
    }
  }
}

int[] optpress = {};
void options() {
  fill(255);
  for (int i = 0; i<menuopts[menu].length; i++) {
    if (i == menuselect) {
      text("> "+ menuopts[menu][i], 20, i*22+20);
    } else {
      text(menuopts[menu][i], 20, i*22+20);
    }
  }
}
void optchmc() {
  switch (keyCode) {
    case 38: {
      menuselect--;
      if (menuselect<0) menuselect=menuopts[menu].length-1;
      break;
    }
    case 40: {
      menuselect++;
      if (menuselect>menuopts[menu].length-1) menuselect=0;
      break;
    }
  }
}

byte[] strconv(String s, int score) {
  byte[] sb = {};
  byte[] scoreb = {};
  sb = expand(sb, 16);
  scoreb = expand(scoreb, 4);
  for (int i = 0; i < sb.length; i++) {
    if (s.length()-1<i) {
      sb[i]=0;
      continue;
    }
    byte code = (byte)(s.charAt(i));
    sb[i]=code;
    if (code > 255) sb[i] = 63;
  }
  int scoretemp = score;
  for (int i = 0; i<scoreb.length; i++) {
    scoreb[i] = byte(scoretemp%256);
    println(binary(scoretemp), scoreb[i], scoretemp%256);
    scoretemp = scoretemp>>8;
  }
  return concat(sb, scoreb);
}
