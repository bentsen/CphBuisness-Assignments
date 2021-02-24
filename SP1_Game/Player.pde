class Player
{
  int x; 
  int y; 
  int type = 3; 
  int health; 
  int score = 0;
  PImage f;
  PImage f2;
  PImage f3;
  PImage f4;
 boolean up = false;
 boolean down = false;
 boolean right = false;
 boolean left = false;
 boolean stand = true;
 boolean gameover = false;
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
    if (stand == true)
    {
     image(f,x,y,size+25,size+25);
    }
     if (up == true)
     {
         image(f,x,y,size+25,size+25);
     }
     
     if (down == true)
     {
         image(f2,x,y,size+25,size+25);
     }
     
     if (left == true)
     {
         image(f4,x,y,size+25,size+25);   
     }
     
     if (right == true)
     {
         image(f3,x,y,size+25,size+25);
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


void moves()
{
  if(keyPressed)
  {
  if (keyCode == UP && player.y > 0)
  {
      up = true;
      
      down =false;
      right = false;
      left = false;
      stand = false;
      if (gameover == false)
      {
      player.y -= 20; 
      }
  }
  }
  if (keyPressed)
  {
  if (keyCode == LEFT && player.x > 0)
  {
    
      left = true;
      
      right = false;
      up = false;
      down = false;
      stand = false;
      if(gameover == false)
      {
      player.x -= 20;
      }
  }
  }
  if (keyPressed)
  {
  if (keyCode == DOWN && player.y < 1001)
  {
    
      down = true;
      
      left = false;
      up = false;
      right = false;
      stand = false;
      if(gameover == false)
      {
      player.y += 20;
      }
  }
  }
  if (keyPressed)
  {
  if (keyCode == RIGHT && player.x < 1001)
  {
   
      right = true;
      
      left = false;
      up = false;
      down = false;
      stand = false;
      if(gameover == false)
      {
      player.x += 20;
      }
  }
  }
 }
 void keyReleased()
 {
 
 }
}
