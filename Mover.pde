class Mover
{
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  float mass;
  float bouncenes;
  int cor; 
  
  Mover(){
    position = new PVector(random(width), 10);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = random(0.5,2);
    bouncenes = 0.1;
    cor = (int)random(255);
  }
  
  void update(){
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }
  
  void applyForce(PVector force){
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void edges(){
    if (position.x > width) {
      //position.x = width;
      velocity.x *= -bouncenes;
    } else if (position.x < 0) {
      velocity.x *= -bouncenes;
      position.x = 0;
    }
    if (position.y > height) {
      velocity.y *= -bouncenes;
      position.y = height;
    }
  }
  
  void display(){
    fill(cor);
    stroke(0,0,0);
    ellipse(position.x, position.y, mass * 20, mass * 20);
  }
  
}
