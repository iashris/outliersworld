int tsize = 41,  // tile size
    margin = 5,  // margin size
    tnumber = 9;  // number of points (lager row)

int[][] link,  // connections
        nlink;  // next connections

float idx;  // index used to interpolate between old and new connections

PGraphics pg;  // PGraphics used to draw the kolam
color bgcolor;  // background color


/*===========================*/


void setup() {
  size(700, 700);
  bgcolor = color(#FC5457);

  pg = createGraphics(tsize*tnumber + 2*margin, tsize*tnumber + 2*margin);

  link = new int[tnumber + 1][tnumber + 1];
  nlink = new int[tnumber + 1][tnumber + 1];

  for (int i = 0; i < link.length; i++)  {
    for (int j = 0; j < link[0].length; j++)  {
      link[i][j] = nlink[i][j] = 1;
    }
  }

  configTile();

  background(bgcolor);
}


/*===========================*/


void draw() {

  if (idx <= 1)  drawTile();  //draw a new tile each frame while it's not entirely updated

  translate(width/2, height/2);
  rotate(QUARTER_PI);

  imageMode(CENTER);
  image(pg, 0, 0);
  if(frameCount%100==0)configTile();

}


/*===========================*/



/*===========================*/


void configTile() {

  idx = 0;  // reset index

  // update ancient links
  for (int i = 0; i < link.length; i++) {
    for (int j = 0; j < link[0].length; j++) {
      link[i][j] = nlink[i][j];
    }
  }


  // create new links
  float limit = random(0.4, 0.7);  // choose frequency of conections randomly

  for (int i = 0; i < nlink.length; i++) {
    for (int j = i; j < nlink[0].length/2; j++) {

      int l = 0;
      if (random(1) > limit)  l = 1;

      nlink[i][j] = l;  // left-top
      nlink[i][nlink[0].length - j - 1] = l;  // left-bottom

      nlink[j][i] = l;  // top-left
      nlink[nlink[0].length - j - 1][i]  = l;  // top-right

      nlink[nlink.length - 1 - i][j] = l;  // right-top
      nlink[nlink.length - 1 - i][nlink[0].length - j - 1] = l;  // right-top

      nlink[j][nlink.length - 1 - i] = l;  // bottom-left
      nlink[nlink[0].length - 1 - j][nlink.length - 1 - i] = l;  // bottom-right
    }
  }

}


/*===========================*/


void drawTile() {
  pg.beginDraw();

  pg.background(bgcolor);
  pg.noFill();
  pg.stroke(255);
  pg.strokeWeight(5);

  for (int i = 0; i < tnumber; i++) {
    for (int j = 0; j < tnumber; j++) {
      if ((i+j)%2 == 0) {

        float top_left = tsize/2 * lerp(link[i][j], nlink[i][j], idx);
        float top_right = tsize/2 * lerp(link[i + 1][j], nlink[i + 1][j], idx);
        float bottom_right = tsize/2 * lerp(link[i + 1][j + 1], nlink[i + 1][j + 1], idx);
        float bottom_left = tsize/2 * lerp(link[i][j + 1], nlink[i][j + 1], idx);

        pg.rect(i*tsize + margin, j*tsize + margin, tsize, tsize, top_left, top_right, bottom_right, bottom_left);
        pg.point(i*tsize + tsize/2 + margin, j*tsize+tsize/2 + margin);

      }
    }
  }

  pg.endDraw();

  // update index
  idx += 0.02;
  idx = constrain(idx, 0, 1);
}