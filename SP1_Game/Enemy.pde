class Enemy
{

  int x; 
  int y; 
  int type = 1; 
  Player player;
  PImage f;

  Enemy(int x, int y, Player player)
  {
    this.x = x;
    this.y = y;
    this.player = player;
    frameRate(20);
    f = loadImage("enemy.png");
  }
  
  void display()
  {
    image(f,x,y,size+30,size+30);
  }

  void MoveTowardsPlayer()
  {
    int h = (int)random(100);


    if (h < 50)
    {
      // random chance (~25% chance) for enemy to move random direction 
      int i = (int)random(3);
      if (Math.random() < 0.25)
      {

        if (i == 0)
        {
          if (x > 0);
          {
            x--;
          }
        }
        if (i == 1)
        {
          if (y>0)
          {
            y--;
          }
        }
        if (i == 2)
        {
          if (x < 1001)
          {
            x++;
          }
        }
        if (i== 3)
        {
          if (y < 1001)
          {
            y++;
          }
        }
      }
    }

    int xDistance = Math.abs(player.x - x);
    int yDistance = Math.abs(player.y - y);
    if (h > 50)
    {
      if (xDistance < yDistance)
      {
        //y value to move one sqaure closer to player!
        if (player.y > y)
        {
          if (y < 1001)
          {
            y+=20;
          }
        } else
        {
          if ( y > 0)
          {
            y-=20;
          }
        }
      } else
      {
        // x value to move one sqaure closer to player! ét 
        if (player.x > x)
        {
          if (x < 1001)
          {
            x+=20;
          }
        } else
        {
          if (y > 0)
          {
            x-=20;
          }
        }
      }
    }
  }
}
