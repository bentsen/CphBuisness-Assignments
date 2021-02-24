class Food
{

  int x;
  int y;
  int type = 2;
  Player player;
  PImage f;


  Food(int x, int y, Player player)
  {
    this.x = x;
    this.y = y;
    this.player = player;
    f = loadImage("cookie.png");
  }  

  void display()
  {
    image(f,x,y,size,size);
  }
  
  void moveAwayFromPlayer()
  {
    int i = (int)random(3);
    if (Math.random() < 0.10)
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
}
