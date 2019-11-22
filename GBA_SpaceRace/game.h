// Player Struct
typedef struct {
    int worldRow;
    int worldCol;
    int screenRow;
    int screenCol;
	int cdel;
    int rdel;
	int height;
	int width;
    int active;
	int bulletTimer;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int cheat;
    int direction;
} PLAYER;

// Rocket Struct
typedef struct {
    int worldRow;
    int worldCol;
    int height;
    int width;
} ROCKET;

// Bullet Struct
typedef struct {
	int row;
	int col;
    int rdel;
	int cdel;
	int height;
	int width;
	int active;
    int direction;
    int rowDirection;
} BULLET;

// Asteroid Struct
typedef struct {
    int row;
    int col;
    int screenRow;
    int screenCol;
    int width;
    int height;
    int rdel;
    int cdel;
    int active;
    int direction;
} ASTEROID;

// Life Struct
typedef struct {
    int row;
    int col;
    int active;
} LIFE;

// Constants
#define BULLETCOUNT 5
#define BIGASTEROIDCOUNT 6
#define SMALLASTEROIDCOUNT 6
#define LIFECOUNT 5

// Variables
extern PLAYER player;
extern ROCKET rocket;
extern int livesLeft;

// Prototypes
void initGame();
void updateGame();
void drawGame();

void initPlayer();
void updatePlayer();
void drawPlayer();

void initRocket();
void drawRocket();

void initBullets();
void fireBullet();
void updateBullet(BULLET *);
void drawBullets();

void initBigAsteroidTopLeft(ASTEROID *);
void initBigAsteroidTopRight(ASTEROID *);
void updateBigAsteroidTopLeft(ASTEROID *);
void updateBigAsteroidTopRight(ASTEROID *);
void drawBigAsteroids();

void initSmallAsteroidTopLeft(ASTEROID *);
void initSmallAsteroidTopRight(ASTEROID *);
void updateSmallAsteroidTopLeft(ASTEROID *);
void updateSmallAsteroidTopRight(ASTEROID *);
void drawSmallAsteroids();

void initLives();
void drawLives();

void initTimer();
void updateTimer();
void drawTimer();