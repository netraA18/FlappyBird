class Pipe {
  float rectH;


  PVector topPipe, bottomPipe;

  final static float PIPE_WIDTH = 125;
  final static float PIPE_GAP = 200;

  Pipe(float rectX, float rectY, float rectH) {
    topPipe = new PVector(rectX, rectY);
    bottomPipe = new PVector(rectX, rectY + rectH + PIPE_GAP);
    this.rectH = rectH;
  }


  void drawPipe() {
    push();
    noStroke();
    fill(245, 110, 61);
    // Draw top pipe
    rect(topPipe.x, topPipe.y, PIPE_WIDTH, this.rectH);
    // Draw bottom pipe
    rect(bottomPipe.x, bottomPipe.y, PIPE_WIDTH, height - (this.rectH + PIPE_GAP));


    fill(7, 197, 93);
    // draws the pipe ends
    rect(topPipe.x - 20, topPipe.y + this.rectH - 18, PIPE_WIDTH + 40, 20);
    rect(bottomPipe.x - 20, bottomPipe.y - 20, PIPE_WIDTH + 40, 20);

    pop();
  }

  void movePipe() {
    topPipe.x -= 3;
    bottomPipe.x -= 3;
  }

  boolean isOutOfWindow() {
    return (topPipe.x + PIPE_WIDTH < 0);
  }

  



 
}
