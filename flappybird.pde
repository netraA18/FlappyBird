ArrayList<Pipe> pipes;
PVector vel, pos, accel, gravity;
float i;
float rectX, rectH;
float imgW = 68, imgH = 48;

PImage img;


void setup() {
  size(1000, 800);


  pos = new PVector(50, height/2);
  vel = new PVector(0, 0);
  accel = new PVector(0, 0.2);
  gravity = new PVector(0, .5);


  img = loadImage("flappy.png");

  pipes = new ArrayList();

  for (float rectX = 600; rectX < width*2; rectX += Pipe.PIPE_WIDTH * 3 ) {
    Pipe pipe = new Pipe(rectX, 0, random(25, height*.75)); //Pipe = class, pipe = variable -- creating an instance
    pipes.add(pipe);
  }
}



void draw() {
  background(128, 222, 217);

  for (int i = 0; i < pipes.size(); i++) {
    Pipe pipe = pipes.get(i);
    pipe.movePipe();
    if (pipe.isOutOfWindow()) { 
      pipes.remove(i);
      i--;

      // Get the last pipe
      Pipe lastPipe = pipes.get(pipes.size() - 1);
      Pipe newPipe = new Pipe(lastPipe.topPipe.x + (Pipe.PIPE_WIDTH * 3), 0, random(25, height*.75));
      pipes.add(newPipe);
      //jumps to the next iteration so that the next line isn't executed. 
      continue; 
      // it ensures that pipes that have been removed and replaced aren't drawn again in the same iteraiton.
    }
    pipe.drawPipe();
    collision(pipe);
  }

  imageMode(CENTER);
  image(img, pos.x, pos.y, imgW, imgH);
  moveBird();
  moveOutWindow();
}
void collision(Pipe pipe) {
  // checks collision between pipes and bird
  if (pos.x + imgW/2 > pipe.topPipe.x && pos.x + imgW/2 < pipe.topPipe.x + Pipe.PIPE_WIDTH && pos.y > pipe.topPipe.y && pos.y < pipe.topPipe.y + pipe.rectH) {
    exit();
  }
  if (pos.x + imgW/2> pipe.bottomPipe.x && pos.x + imgW/2 < pipe.bottomPipe.x + Pipe.PIPE_WIDTH && pos.y > pipe.bottomPipe.y && pos.y < pipe.bottomPipe.y + pipe.rectH) {
    exit();
  }
  // checks collision between pipe ends and bird
  if (pos.x + imgW/2 > pipe.topPipe.x - 20 && pos.x + imgW/2 < pipe.topPipe.x + Pipe.PIPE_WIDTH + 40 && pos.y > pipe.topPipe.y + pipe.rectH - 18 && pos.y < pipe.topPipe.y + pipe.rectH + 2) {
    exit();
  }
  if (pos.x + imgW/2 > pipe.bottomPipe.x - 20 && pos.x + imgW/2 < pipe.bottomPipe.x + Pipe.PIPE_WIDTH + 40 && pos.y > pipe.bottomPipe.y - 20 && pos.y < pipe.bottomPipe.y + pipe.rectH + 20) {
    exit();
  }
}
