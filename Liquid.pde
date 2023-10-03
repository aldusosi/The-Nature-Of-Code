class Liquid{
  float x;
  float y;
  float w;
  float h;
  float c;
  
  Liquid(float x, float y, float w, float h, float c){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
  }
  
  boolean contains(Mover m){
    if(this.x < m.position.x && this.w + this.x > m.position.x && this.y < m.position.y && this.h + this.y > m.position.y) return true;
    return false;
  }
  
  PVector drag_force(Mover m){
    PVector drag = m.velocity.copy();
    drag.normalize();
    float moduloVelocity = m.velocity.mag();
    drag.mult(moduloVelocity * moduloVelocity * this.c);
    return drag;
  }
  
  void display(){
    color cor = color(10,10,250);
    fill(cor);
    stroke(cor);
    rect(this.x, this.y, this.w, this.h);
  }
}
