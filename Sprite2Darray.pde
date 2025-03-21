
/* Elena Chavez, 
3/12/25
Students will be able to modify and document an existing 
Java program in Processing to include their own sprite 
animation, and create and edit an HTML page to display
their Processing sketch and describe their modifications. */
// Add a comment to each "//" that you see. 
PImage ocean;
int cols = 7;  //  2D grids
int rows = 6;  // 2D grids
Sprite[][] sprites; // 2D array

int numFrames = 3;  // speed of which it is moving
PImage[] spriteFrames; // image import
int frameDelay = 15;  // Speed of animation (higher = slower)

void setup() {
  size(500, 500);
  loadSpriteFrames();  // loading the image
  sprites = new Sprite[cols][rows];
  

  // iterating through the arrays to fill with the sprite objects

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float x = i * width / cols + width / (cols * 2);
      float y = j * height / rows + height / (rows * 2);
      sprites[i][j] = new Sprite(x, y);
    }
  }
}

void draw() {
  background(167,217,213);
  ocean = loadImage("ocean.png");
  image(ocean,0,-10,500,600);
  // itereating through to create 
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      sprites[i][j].update();
      sprites[i][j].display();
    }
  }
}

//  loading in the sprite 
void loadSpriteFrames() {
  spriteFrames = new PImage[numFrames];
  for (int i = 0; i < numFrames; i++) {
    spriteFrames[i] = loadImage("stringRayBoss" + i + ".png"); // Ensure images are named _____0.png, _____1.png, etc.
  }
}

// Sprite Class
class Sprite {
  float x, y;
  int currentFrame = 0;
  int frameCount = 0;
  float size = 50; //  sixe of image 
  float speedX = 0.75; // speed of image 

  Sprite(float x, float y) {
    this.x = x;
    this.y = y;
  }


  void update() {
    // adding in order for tge image to move acroos the screen
    frameCount++;
    if (frameCount % frameDelay == 0) {// moves it along jolly
        currentFrame = (currentFrame + 1) % numFrames;//
    }

    // ifinate loop
    x += speedX;

    // if statemennt for x and y varibles so that the imagwe can move
    if (x >= width) {
        x -= width;  // Shift left by one full width to prevent gaps
    }
}

  void display() {
  

    image(spriteFrames[currentFrame], x - size / 2, y - size / 2, size, size);
  }
}
