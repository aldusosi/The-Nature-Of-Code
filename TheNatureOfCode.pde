Mover[] movers;
Liquid liquid;

void setup()
{
  size(400, 400);
  liquid = new Liquid(0, 200, 400, 200, -0.1);
  movers = new Mover[20];
  for(int i = 0; i < movers.length; i++){
  movers[i] = new Mover();
  }
}

void draw()
{
  background(255);
  /*color cor = color(10,10,250);
  fill(cor);
  stroke(cor);
  rect(0, 200, 400, 200);*/
  
  //Liquid
  liquid.display();
  
  for(Mover m:movers){
    PVector wind = new PVector(0.02,0);
    PVector gravit = new PVector(0, 0.1);
    gravit.mult(m.mass); 
    
    m.applyForce(gravit);
    
    // FRICTION == -1 * Cf * v.normalized
    PVector friction = m.velocity.copy();
    friction.normalize();
    float c = -0.9;
    friction.mult(c);
 
    if(liquid.contains(m)){
      PVector drag_force = liquid.drag_force(m);
      m.applyForce(drag_force);
    }
    
    
    // Mover
    m.update();
    m.edges();
    m.display();
    
  }
}
