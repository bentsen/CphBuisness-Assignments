
int size = 40;
int[][] grid = new int[25][25];

Player player;
//Enemy enemy;
Enemy[] bonusEnemy = new Enemy[4];

ArrayList<Enemy> enemies = new ArrayList<Enemy>();

Food food;

boolean addedEnemies = false;

void setup()
{
  size(1001, 1001);
  player = new Player(100, 100);
  
  food = new Food(int(random(1000)), int(random(1000)), player);  
  addedEnemies = false;
  enemies.clear();

}

void draw()
{
  clearBoard();
  
  drawBoard();
  updateEntities();
  isGameOver();
  resolveCollisions();
  UI();

  if (addedEnemies == false && player.score % 10 == 0)
  {
    for (int i = 0; i < 2; i++)
    {
      
      enemies.add(new Enemy(int(random(1000)),int(random(1000)),player));
    }
    addedEnemies = true;
  }

  if (player.score % 10 == 1)
  {
    addedEnemies = false;
  }
}

void clearBoard()
{
  for (int x = 0; x < grid.length; x++)
  {
    for (int y = 0; y < grid[0].length; y++)
    {
      grid[x][y] = 0;
    }
  }
}

void drawBoard()
{
  for (int x = 0; x < grid.length; x++)
  {
    for (int y = 0; y < grid[0].length; y++)
    {
      fill(0);
      stroke(255, 50);
      rect(x * size, y * size, size, size);
    }
  }
}

void updateEntities()
{  
  
  try
  {
    for (Enemy enemy : enemies)
    {
      enemy.display();
      enemy.MoveTowardsPlayer();
    }

    food.display();
    food.moveAwayFromPlayer();
    
    player.moves();
    player.keyReleased();
    player.display();
    
  }
  catch(ArrayIndexOutOfBoundsException e)
  {
  }
}

void resolveCollisions()
{
 
  for (Enemy enemy : enemies) 
  {
     int enemyxplayer = Math.abs(player.x - enemy.x);
     int enemyyplayer = Math.abs(player.y - enemy.y);
    if (enemyxplayer <= 30 && enemyyplayer <= 30)
    {
      player.takeDamage();
    }
  }

  int foodxplayer = Math.abs(player.x - food.x);
  int foodyplayer = Math.abs(player.y - food.y);
  if (foodyplayer <= 30 && foodxplayer <= 30)
  {
    player.increaseScore();
    food.moveAwayFromPlayer();
    food = new Food(int(random(0, 1000)), int(random(0, 1000)), player);
  }
}

void UI()
{
  //HEALTH
  PImage f;
  PFont mono;
  mono = createFont("Font/ARCADE_N.TTF",32);
  textFont(mono);
  f = loadImage("Sprites/border.png");
  image(f,250,0,size+100,size+10);
  textSize(15);
  fill(255);
  text("HP:", 265, 30);
  if (player.health > 60)
  {
    fill(0, 255, 0); 
    text(player.health, 305, 30);
  }
  if (player.health > 30 && player.health < 60)
  {
    fill(255, 255, 0); 
    text(player.health, 305, 30);
  }
  if (player.health > 0 && player.health < 30)
  {
    fill(255, 0, 0); 
    text(player.health, 305, 30);
  } else if (player.health <= 0)
  {
    fill(255, 0, 0);
    text(0, 305, 30);
  }

  //SCORE
  PImage f2;
   f2 = loadImage("Sprites/border.png");
  image(f2,570,0,size+100,size+10);
  textSize(15);
  fill(255);
  text("Score:", 580, 30);
  text(player.score, 665, 31);

  //Game Name 
  fill(255);
  textSize(30);
  text("CATCH", 408, 30);
}


void isGameOver()
{
  if (player.health < 0)
  {
    PImage f;
    PImage f2;
    fill(255, 0, 0, 30);
    rect(0, 0, 1001, 1001);
    f = loadImage("Sprites/gameover.png");
    f2 = loadImage("Sprites/enter.png");
    image(f,265,250,size+400,size+200);
    image(f2,370,500,size+200,size+50);
   
    
    player.gameover = true;
    if (player.health < 0 && keyCode == ENTER)
    {
      setup();
    }
  }
}
