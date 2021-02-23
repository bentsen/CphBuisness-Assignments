boolean up = true;
boolean down = true;
boolean left = true;
boolean right = true;
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
  player = new Player(3, 4);
  //enemies.add(new Enemy(20, 19, player));
  food = new Food(10, 6, player);  
  addedEnemies = false;
  enemies.clear();
  up = true;
  down = true;
  left = true;
  right = true;
}

void draw()
{
  clearBoard();
  updateEntities();
  drawBoard();   
  isGameOver();
  resolveCollisions();
  UI();

  if (addedEnemies == false && player.score % 10 == 0)
  {
    for (int i = 0; i < 2; i++)
    {
      //bonusEnemy[i] = new Enemy(int(random(0,25)),int(random(0,25)),player);
      enemies.add(new Enemy(int(random(0, 25)), int(random(0, 25)), player));
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
      fill(getColorFromType(grid[x][y]));
      stroke(255, 150);
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
      grid[enemy.x][enemy.y] = enemy.type;
      enemy.MoveTowardsPlayer();
    }

    grid[food.x][food.y] = food.type;
    food.moveAwayFromPlayer();
    grid[player.x][player.y] = player.type;
  }
  catch(ArrayIndexOutOfBoundsException e)
  {
  }
}

void resolveCollisions()
{
  for (Enemy enemy : enemies) 
  {
    if (player.x == enemy.x && player.y == enemy.y)
    {
      player.takeDamage();
    }
  }


  if (player.x == food.x && player.y == food.y)
  {
    player.increaseScore();
    food.moveAwayFromPlayer();
    food = new Food(int(random(0, 25)), int(random(0, 25)), player);
  }
}

void UI()
{
  //HEALTH
  fill(#795656, 230);
  rect(290, 0, 130, 40);
  textSize(20);
  fill(255);
  text("HP:", 310, 30);
  if (player.health > 60)
  {
    fill(0, 255, 0); 
    text(player.health, 350, 30);
  }
  if (player.health > 30 && player.health < 60)
  {
    fill(255, 255, 0); 
    text(player.health, 350, 30);
  }
  if (player.health > 0 && player.health < 30)
  {
    fill(255, 0, 0); 
    text(player.health, 350, 30);
  } else if (player.health <= 0)
  {
    fill(255, 0, 0);
    text(0, 350, 30);
  }

  //SCORE
  fill(#795656, 230);
  rect(540, 0, 130, 40);
  textSize(20);
  fill(255);
  text("Score:", 550, 30);
  text(player.score, 610, 31);

  //Game Name 
  fill(#AA7C7C);
  textSize(30);
  text("CATCH", 430, 30);
}


void isGameOver()
{
  if (player.health < 0)
  {
    fill(255, 0, 0);
    textSize(50);
    text("GAME OVER", 330, 500);
    textSize(20);
    text("PRESS ENTER!", 420, 530);
    fill(255, 0, 0, 30);
    rect(0, 0, 1001, 1001);
    up = false;
    down = false;
    right = false;
    left = false;
    if (player.health < 0 && keyCode == ENTER)
    {
      setup();
    }
  }
}

color getColorFromType(int type) 
{
  color c = color(255);

  switch(type)
  {
  case 0: 
    c = color(0);
    break;
  case 1: 
    c = color(255, 0, 0);
    break;
  case 2: 
    c = color(0, 255, 0);
    break;
  case 3: 
    c = color(0, 0, 255);
    break;
  case 4: 
    c = color (0, 255, 255);
    break;
  }    

  return c;
}

void printIntArray(int[][] arr) 
{
  System.out.println("");
  System.out.println("");
  System.out.println("");
  for (int x = 0; x < arr.length; x++)
  {
    for (int y = 0; y < arr[0].length; y++) 
    {

      System.out.print(arr[x][y] + ", ");
    }
    println();
  }
}

void keyPressed()
{
  if (keyCode == UP)
  {
    if (player.y > 0 && up == true)
    {
      player.y -= 1;
    }
  }
  if (keyCode == LEFT)
  {
    if (player.x > 0 && left == true)
    {
      player.x -= 1;
    }
  }
  if (keyCode == DOWN)
  {
    if (player.y < 24 && down == true)
    {
      player.y += 1;
    }
  }
  if (keyCode == RIGHT)
  {
    if (player.x < 24 && right == true)
    {
      player.x += 1;
    }
  }
}
