final boolean AndroidMode = false;
boolean debug = false;
boolean showFPS = false;
int num = 30000;
int usedParticles = 4000;
int[] x = new int[num];
int[] y = new int[num];
int picIndex, maxpixel;
int startMouseX = 0;
color[] b1;
color sandColor = color (255);
PImage img;
int Y_AXIS = 1;
int X_AXIS = 2;
String namesofppl[]={
	"Dr. APJ Abdul Kalam",
	"Rabindranath Tagore",
	"Swami Vivekananda",
	"Jehangir Ratanji Dadabhoy Tata",
	"Sarvapalli Radhakrishnan",
	"Homi Jehangir Bhabha"
};
String names[] =
{
  "maestros/apj-min.png",
  "maestros/rabindranath-min.png",
  "maestros/swami-min.png",
  "maestros/tata-min.png",
  "maestros/rk-min.png",
  "maestros/homi-min.png"
};
int pictures = names.length;

void setup()
{

  size(480, 580);
  frameRate(60);
  maxpixel = height * width;
  selectPicture(0);
  textSize (14);
  noSmooth();
}
void setting()
{

}

void draw()
{


  background(#2C3E50);
  loadPixels();
  int offset = 0;
  float speedFactor = 10 + (mouseY * 16.0) / height;
  for (int si = 0; si < usedParticles; si++)
  {
    color c = img.get(x[si], y[si]);
    float b = 0.8 - brightness(c) / 222.0;
    y[si] += int((0.05 + b*b) * speedFactor);

    offset = y[si]*width + x[si];
    if (offset < maxpixel)
      pixels[offset] = sandColor;  // move sand
    else
    { // create new random position
      x[si] = round(random(width));
      y[si] = round(random(height));
    }
  }
  updatePixels();
  // increase used particles ?
  if (   (frameCount > 120)
      && (round(frameRate) > 60)
      && (usedParticles + 1000 <= num))     usedParticles += 1000;
  if(frameCount%600==0)changePicture(+1);

  fill(255,255,255,190);
  textSize(9);
  //textAlign(CENTER);
  text("India's Outliers | "+namesofppl[picIndex],25,height-30);
}
//--------------------------------------
void restart()
{
  if (debug) println ("restart");
  // set new random points
  for (int si = 0; si < num; si++)
  {
    x[si] = round(random(width));
    y[si] = round(random(height));
  }
  stroke(255);
}
void selectPicture (int index)
{
  picIndex = (index + pictures) % pictures;
  String filename = names[picIndex];
  if (debug) println ("loading "+picIndex+"  " +filename);
  img = loadImage(filename);
  if ((img.width != width)
   || (img.height != height))
    img.resize (width, height);
  restart();
}

void changePicture (int delta)
{
  selectPicture (picIndex + delta);
}