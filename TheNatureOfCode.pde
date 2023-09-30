Mover[] movers;

void setup()
{
  size(400, 400);
  movers = new Mover[5];
  for(int i = 0; i < movers.length; i++){
  movers[i] = new Mover(); 
  }
}

void draw()
{
  background(255);
  
  for(Mover m:movers){
    PVector wind = new PVector(0.5,0);
    PVector gravit = new PVector(0, 0.3);
    gravit.mult(m.mass);
    
    m.applyForce(gravit);
    
    if(mousePressed) m.applyForce(wind);
  
    m.update();
    m.edges();
    m.display();
  }
}
