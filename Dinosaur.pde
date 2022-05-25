class Dinosaur extends Enemy{
	// Requirement #4: Complete Dinosaur Class

	final float TRIGGERED_SPEED_MULTIPLIER = 5f;
  float speed = 1f;
  float initspeed = 1f;
    void display(){
    int direction = (speed > 0) ? RIGHT : LEFT;
  
    pushMatrix();
    translate(x, y);
    if (direction==RIGHT) {
      scale(1, 1);
      image(dinosaur, 0, 0); 
    } else {
      scale(-1, 1);
      image(dinosaur, -w, 0); 
    }
    popMatrix();
  }

  void update(){
    x+=speed;
    if(x >= width-w || x<=0){
      speed= -speed;
    }
    if(player.y==y){
      if(player.x-x>0 && speed>0){
        speed=TRIGGERED_SPEED_MULTIPLIER;
      }else if(player.x-x<0 && speed<0){
        speed=-TRIGGERED_SPEED_MULTIPLIER;
      }
    }else{
      if(player.x-x>0 && speed>0){
        speed=2f;
      }else if(player.x-x<0 && speed<0){
        speed=-2f;
      }
    }
  }

  Dinosaur(float x, float y){
    super(x, y);
  }
	// HINT: Player Detection in update()
	/*
	float currentSpeed = speed
	If player is on the same row with me AND (it's on my right side when I'm going right OR on my left side when I'm going left){
		currentSpeed *= TRIGGERED_SPEED_MULTIPLIER
	}
	*/
}
