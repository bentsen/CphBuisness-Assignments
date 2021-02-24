class Player
{
  int x; 
  int y; 
  int type = 3; 
  int health; 
  int score;
  PImage f;
  PImage f2;
  PImage f3;
  PImage f4;
 boolean up = false;
 boolean down = false;
 boolean right = false;
 boolean left = false;
 
  Player(int x, int y)
  {
    this.x = x;
    this.y = y;
    health = 100;
    f = loadImage("MainCharacter.gif");
    f2 = loadImage("MainCharacter2.gif");
    f3 = loadImage("MainCharacterrun.gif");
    f4 = loadImage("MainCharacterrun2.gif");
  }

  void display()
  {
     
         image(f,x,y,size+20,size+20);
     
    
     if (up == true)
     {
         image(f,x,y,size+20,size+20);
     }
     
     if (down == true)
     {
         image(f2,x,y,size+20,size+20);
     }
     
     if (left == true)
     {
         image(f4,x,y,size+20,size+20);   
     }
     
     if (right == true)
     {
         image(f3,x,y,size+20,size+20);
     }
  }
  
  void takeDamage()
  {
    health--;
  }

  void increaseScore()
  {
    score++;
  }
}

void moves()
{
  if (keyCode == UP && player.y > 0)
  {
      up = true;
      
      down =false;
      right = false;
      left = false;
     
      
      player.y -= 30; 
  }
  if (keyCode == LEFT && player.x > 0)
  {
    
      left = true;
      
      right = false;
      up = false;
      down = false;
      
      
      player.x -= 30;
    
  }
  if (keyCode == DOWN && player.y < 1001)
  {
    
      down = true;
      
      left = false;
      up = false;
      right = false;
     
      
      player.y += 30;
    
  }
  if (keyCode == RIGHT && player.x < 1001)
  {
   
      right = true;
      
      left = false;
      up = false;
      down = false;
    
      
      player.x += 30;
    
  }
}
