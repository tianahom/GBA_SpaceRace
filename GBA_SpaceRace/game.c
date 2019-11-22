#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include <math.h>
#include "sound.h"

#include "laser.h"
#include "explosion.h"
#include "jetpack.h"
#include "clock.h"

// Variables
PLAYER player;
ROCKET rocket;
BULLET bullets[BULLETCOUNT];
ASTEROID bigAsteroids[BIGASTEROIDCOUNT];
ASTEROID smallAsteroids[SMALLASTEROIDCOUNT];
LIFE lives[LIFECOUNT];
int livesLeft;

int minuteDigit;
int secondDigit1;
int secondDigit2;

int clockTime;
int sec;

int cheatOn;

int hOff;
int vOff;

enum {LEFT, RIGHT, UP, JET, IDLE};

// Initializes the game
void initGame() {

    cheatOn = 0;

    hOff = 0;
    vOff = 352;

	initPlayer();

    initRocket();

    for (int i = 0; i < 3; i++) {
        initBigAsteroidTopLeft(&bigAsteroids[i]);
    }

    for (int i = 3; i < 6; i++) {
        initBigAsteroidTopRight(&bigAsteroids[i]);
    }

    for (int i = 0; i < 3; i++) {
        initSmallAsteroidTopLeft(&smallAsteroids[i]);
    }

    for (int i = 3; i < 6; i++) {
        initSmallAsteroidTopRight(&smallAsteroids[i]);
    }

    initBullets();

    initLives();

    initTimer();

    livesLeft = LIFECOUNT;
}

// Updates the game each frame
void updateGame() {

    // updates the player
	updatePlayer();

	// Updates all the asteroids
    for (int i = 0; i < 3; i++) {
        updateBigAsteroidTopLeft(&bigAsteroids[i]);
    }

    for (int i = 3; i < 6; i++) {
        updateBigAsteroidTopRight(&bigAsteroids[i]);
    }

    for (int i = 0; i < 3; i++) {
        updateSmallAsteroidTopLeft(&smallAsteroids[i]);
    }

    for (int i = 3; i < 6; i++) {
        updateSmallAsteroidTopRight(&smallAsteroids[i]);
    }

    // Updates all the bullets
    for (int i = 0; i < BULLETCOUNT; i++)
        updateBullet(&bullets[i]);

    updateTimer();

    waitForVBlank();

    DMANow(3, shadowOAM, OAM, 128*4);
}

// Draws the game each frame
void drawGame() {

    // draws the player
	drawPlayer();

	// Draws all the big asteroids
    drawBigAsteroids();

    // Draws all the small asteroids
    drawSmallAsteroids();

    // Draws all the bullets
    drawBullets();

    // Draws all the lives
    drawLives();

    drawTimer();

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
}

// Initializes the player
void initPlayer() {

    player.worldRow = 480;
    player.worldCol = 110;
    player.height = 31;
    player.width = 18;
	player.cdel = 2;
    player.rdel = 2;
	player.active = 1;
    player.bulletTimer = 20;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 6;
    player.aniState = RIGHT;
    player.cheat = 0;
    player.direction = 1;
}

// Handles every-frame actions of the player
void updatePlayer() {

    // Initializes player.cheat to 0 every frame
    player.cheat = 0;

    if (player.prevAniState != player.aniState) {
        player.curFrame = 0;
    }

    if (player.aniState != IDLE) {
            player.prevAniState = player.aniState;
            player.aniState = IDLE;
    }

    if (player.aniCounter % 20 == 0) {
        if (player.curFrame < player.numFrames) {
            player.curFrame++;
        }
        if (player.curFrame == player.numFrames) {
            player.curFrame = 0;
        }
    }

    // Fires bullets
    if (BUTTON_PRESSED(BUTTON_A) && player.bulletTimer >= 10) {

        fireBullet();
        player.bulletTimer = 0;
        playSoundA(laser, LASERLEN, LASERFREQ, 0);

    } else if (BUTTON_HELD(BUTTON_B)) { // cheat - jetpack
        player.cheat = 1;
        player.aniState = JET;
        player.numFrames = 4;
        player.rdel = 4;
        player.height = 31;

        if (player.worldRow - player.rdel >= 0) {
            player.worldRow -= player.rdel;

            if (vOff - player.rdel >= 0 && player.screenRow <= SCREENHEIGHT/2 - player.height/2) {
                vOff -= player.rdel;
            }
        }
    }

    if ((player.cheat == 1) && cheatOn != 1) {
        playSoundA(jetpack, JETPACKLEN, JETPACKFREQ, 1);
        cheatOn = 1;
    }

    player.bulletTimer++;

	// Moves the player
	if (BUTTON_HELD(BUTTON_LEFT) && player.worldCol >= player.cdel) {
		player.worldCol -= player.cdel;

        if (player.cheat == 0) {
            player.aniState = LEFT;
            player.numFrames = 6;
            player.rdel = 2;
            player.direction = -1;
            player.height = 31;
        }

	} else if (BUTTON_HELD(BUTTON_RIGHT)
		&& player.worldCol + player.width - 1 < SCREENWIDTH - player.cdel) {
		player.worldCol += player.cdel;

        if (player.cheat == 0) {
            player.aniState = RIGHT;
            player.numFrames = 6;
            player.rdel = 2;
            player.direction = 1;
            player.height = 31;
        }

	}

    if (BUTTON_HELD(BUTTON_UP) && player.worldRow - player.rdel >= 0
        && player.cheat == 0) {
        player.worldRow -= player.rdel;

        player.aniState = UP;
        player.numFrames = 3;
        player.rdel = 2;
        player.direction = 0;
        player.height = 38;

        if (vOff - player.rdel >= 0 && player.screenRow <= SCREENHEIGHT/2 - player.height/2) {
            vOff -= player.rdel;
        }
    }

    if (player.aniState == IDLE) {
            player.curFrame = 0;
            player.aniState = player.prevAniState;
    } else if (player.aniState != IDLE) {
        player.aniCounter++;
    }

    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - hOff;
}

// Draws the player
void drawPlayer() {
	if (player.active) {
        if (player.aniState == RIGHT) {
            shadowOAM[0].attr0 = (ROWMASK & player.screenRow)  | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[0].attr1 = (COLMASK & player.screenCol) | ATTR1_MEDIUM;
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.curFrame * 4, 0);
        } else if (player.aniState == JET) {
            shadowOAM[0].attr0 = (ROWMASK & player.screenRow)  | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[0].attr1 = (COLMASK & player.screenCol) | ATTR1_MEDIUM;
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.curFrame * 4, 4);
        } else if (player.aniState == LEFT) {
            shadowOAM[0].attr0 = (ROWMASK & player.screenRow)  | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[0].attr1 = (COLMASK & player.screenCol) | ATTR1_MEDIUM;
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.curFrame * 4, 8);
        } else if (player.aniState == UP) {
            shadowOAM[0].attr0 = (ROWMASK & player.screenRow)  | ATTR0_4BPP | ATTR0_TALL;
            shadowOAM[0].attr1 = (COLMASK & player.screenCol) | ATTR1_LARGE;
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.curFrame * 8, 12);
        }
 	} else {
 		shadowOAM[0].attr0 = ATTR0_HIDE;
 	}
}

// Initializes the rocket
void initRocket() {
    rocket.worldRow = 2;
    rocket.worldCol = 95;
    rocket.height = 19;
    rocket.width = 47;
}

// Initializes a big asteroid to start at top left and move right
void initBigAsteroidTopLeft(ASTEROID *a) {
    a->row = -1;
    a->col = rand() % 115;
    a->width = 21;
    a->height = 26;
    a->rdel = rand() % 2 + 1;
    a->cdel = rand() % 2 + 1;
    a->active = 1;
    a->direction = 0;
}

// Initializes a big asteroid to start at top right and move left
void initBigAsteroidTopRight(ASTEROID *a) {
    a->row = -1;
    a->col = rand() % 115 + 125;
    a->width = 21;
    a->height = 26;
    a->rdel= rand() % 2 + 1;
    a->cdel = -(rand() % 2 + 1);
    a->active = 1;
    a->direction = 0;
}

// Initializes a small asteroid to start at top left and move right
void initSmallAsteroidTopLeft(ASTEROID *a) {
    a->row = -1;
    a->col = rand() % 115;
    a->width = 13;
    a->height = 13;
    a->rdel = rand() % 3 + 1;
    a->cdel = rand() % 3 + 1;
    a->active = 1;
    a->direction = 0;
}

// Initializes a small asteroid to start at top right and move left
void initSmallAsteroidTopRight(ASTEROID *a) {
    a->row = -1;
    a->col = rand() % 115 + 125;
    a->width = 13;
    a->height = 13;
    a->rdel= rand() % 3 + 1;
    a->cdel = -(rand() % 3 + 1);
    a->active = 1;
    a->direction = 0;
}

// Handles every-frame action of a big asteroid starting from the top left
void updateBigAsteroidTopLeft(ASTEROID *a) {

    if (a->active) {
        if (a->row > SCREENHEIGHT - 1 || a->col > SCREENWIDTH - 1) {
                initBigAsteroidTopLeft(a);
        } else {
                a->row += a->rdel;
                a->col += a->cdel;
        }

        if ((BUTTON_HELD(BUTTON_UP) && vOff < 352 && vOff > 0) ||
            (BUTTON_HELD(BUTTON_B) && vOff < 352 && vOff > 0)) {
            a->direction = -1;
        } else {
            a->direction = 0;
        }

        if (a->direction == -1) {
            a->row += player.rdel;
        }

        if (collision(player.screenRow, player.screenCol, player.height, player.width,
            a->row, a->col, a->height, a->width)) {
            if (player.cheat == 0) {
                a->active = 0;
                livesLeft --;
                lives[livesLeft].active = 0;
                playSoundA(explosion, EXPLOSIONLEN, EXPLOSIONFREQ, 0);
            }
        }

    } else {
        initBigAsteroidTopLeft(a);
    }
}

// Handles every-frame action of a big asteroid starting from the top right
void updateBigAsteroidTopRight(ASTEROID *a) {
    if (a->active) {
        if (a->row > SCREENHEIGHT - 1 || a->col + a->width < 0) {
                initBigAsteroidTopRight(a);
        } else {
                a->row += a->rdel;
                a->col += a->cdel;
        }

        if ((BUTTON_HELD(BUTTON_UP) && vOff < 352 && vOff > 0) ||
            (BUTTON_HELD(BUTTON_B) && vOff < 352 && vOff > 0)) {
            a->direction = -1;
        } else {
            a->direction = 0;
        }

        if (a->direction == -1) {
            a->row += player.rdel;
        }

        if (collision(player.screenRow, player.screenCol, player.height, player.width,
            a->row, a->col, a->height, a->width)) {
            if (player.cheat == 0) {
                a->active = 0;
                livesLeft --;
                lives[livesLeft].active = 0;
                playSoundA(explosion, EXPLOSIONLEN, EXPLOSIONFREQ, 0);
            }
        }

    } else {
        initBigAsteroidTopRight(a);
    }

    a->screenRow = a->row - vOff;
    a->screenCol = a->col - hOff;
}

// Handles every-frame action of a small asteroid starting from the top left
void updateSmallAsteroidTopLeft(ASTEROID *a) {
    if (a->active) {
        if (a->row > SCREENHEIGHT - 1 || a->col > SCREENWIDTH - 1) {
                initSmallAsteroidTopLeft(a);
        } else {
                a->row += a->rdel;
                a->col += a->cdel;
        }

        if ((BUTTON_HELD(BUTTON_UP) && vOff < 352 && vOff > 0) ||
            (BUTTON_HELD(BUTTON_B) && vOff < 352 && vOff > 0)) {
            a->direction = -1;
        } else {
            a->direction = 0;
        }

        if (a->direction == -1) {
            a->row += player.rdel;
        }

        if (collision(player.screenRow, player.screenCol, player.height, player.width,
            a->row, a->col, a->height, a->width)) {
            if (player.cheat == 0) {
                a->active = 0;
                livesLeft --;
                lives[livesLeft].active = 0;
                playSoundA(explosion, EXPLOSIONLEN, EXPLOSIONFREQ, 0);
            }
        }

    } else {
        initSmallAsteroidTopLeft(a);
    }
}

// Handles every-frame action of a small asteroid starting from the top right
void updateSmallAsteroidTopRight(ASTEROID *a) {
    if (a->active) {
        if (a->row > SCREENHEIGHT - 1 || a->col + a->width < 0) {
                initSmallAsteroidTopRight(a);
        } else {
                a->row += a->rdel;
                a->col += a->cdel;
        }

        if ((BUTTON_HELD(BUTTON_UP) && vOff < 352 && vOff > 0) ||
            (BUTTON_HELD(BUTTON_B) && vOff < 352 && vOff > 0)) {
            a->direction = -1;
        } else {
            a->direction = 0;
        }

        if (a->direction == -1) {
            a->row += player.rdel;
        }

        if (collision(player.screenRow, player.screenCol, player.height, player.width,
            a->row, a->col, a->height, a->width)) {
            if (player.cheat == 0) {
                a->active = 0;
                livesLeft --;
                lives[livesLeft].active = 0;
                playSoundA(explosion, EXPLOSIONLEN, EXPLOSIONFREQ, 0);
            }
        }

    } else {
        initSmallAsteroidTopRight(a);
    }
}

// Draws the big asteroids
void drawBigAsteroids() {
    for (int i = 0; i < 2; i++) {
        if (bigAsteroids[i].active) {
            shadowOAM[i + 1].attr0 = (ROWMASK & (bigAsteroids[i].row)) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[i + 1].attr1 = (COLMASK & bigAsteroids[i].col) | ATTR1_MEDIUM;
            shadowOAM[i + 1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(9, 20);
        } else {
            shadowOAM[i + 1].attr0 = ATTR0_HIDE;
        }
    }

    for (int i = 2; i < 4; i++) {
        if (bigAsteroids[i].active) {
            shadowOAM[i + 1].attr0 = (ROWMASK & (bigAsteroids[i].row)) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[i + 1].attr1 = (COLMASK & bigAsteroids[i].col) | ATTR1_MEDIUM;
            shadowOAM[i + 1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(9, 24);
        } else {
            shadowOAM[i + 1].attr0 = ATTR0_HIDE;
        }
    }

    for (int i = 4; i < 6; i++) {
        if (bigAsteroids[i].active) {
            shadowOAM[i + 1].attr0 = (ROWMASK & (bigAsteroids[i].row)) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[i + 1].attr1 = (COLMASK & bigAsteroids[i].col) | ATTR1_MEDIUM;
            shadowOAM[i + 1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(9, 28);
        } else {
            shadowOAM[i + 1].attr0 = ATTR0_HIDE;
        }
    }
}

// Draws the small asteroids
void drawSmallAsteroids() {
    for (int i = 0; i < 2; i++) {
        if (smallAsteroids[i].active) {
            shadowOAM[i + BIGASTEROIDCOUNT + 1].attr0 = (ROWMASK & (smallAsteroids[i].row)) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[i + BIGASTEROIDCOUNT + 1].attr1 = (COLMASK & smallAsteroids[i].col) | ATTR1_SMALL;
            shadowOAM[i + BIGASTEROIDCOUNT + 1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(15, 20);
        } else {
            shadowOAM[i + BIGASTEROIDCOUNT + 1].attr0 = ATTR0_HIDE;
        }
    }

    for (int i = 2; i < 4; i++) {
        if (smallAsteroids[i].active) {
            shadowOAM[i + BIGASTEROIDCOUNT + 1].attr0 = (ROWMASK & (smallAsteroids[i].row)) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[i + BIGASTEROIDCOUNT + 1].attr1 = (COLMASK & (smallAsteroids[i].col)) | ATTR1_SMALL;
            shadowOAM[i + BIGASTEROIDCOUNT + 1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(15, 22);
        } else {
            shadowOAM[i + BIGASTEROIDCOUNT + 1].attr0 = ATTR0_HIDE;
        }
    }

    for (int i = 4; i < 6; i++) {
        if (smallAsteroids[i].active) {
            shadowOAM[i + BIGASTEROIDCOUNT + 1].attr0 = (ROWMASK & (smallAsteroids[i].row)) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[i + BIGASTEROIDCOUNT + 1].attr1 = (COLMASK & smallAsteroids[i].col) | ATTR1_SMALL;
            shadowOAM[i + BIGASTEROIDCOUNT + 1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(15, 24);
        } else {
            shadowOAM[i + BIGASTEROIDCOUNT + 1].attr0 = ATTR0_HIDE;
        }
    }
}

// Initializes the pool of bullets
void initBullets() {
    for (int i = 0; i < BULLETCOUNT; i++) {
        bullets[i].height = 5;
        bullets[i].width = 13;
        bullets[i].row = -bullets[i].height;
        bullets[i].col = 0;
        bullets[i].rdel = 3;
        bullets[i].cdel = 3;
        bullets[i].active = 0;
        bullets[i].rowDirection = 0;
    }
}

// Fires a bullet
void fireBullet() {

    // Finds the first inactive bullet
    for (int i = 0; i < BULLETCOUNT; i++) {
        if (!bullets[i].active) {

            // Positions the new bullet
            if (player.direction == 1) {
                bullets[i].row = player.screenRow + player.height/2 - 3;
                bullets[i].col = player.screenCol + player.width - bullets[i].width/2;
                bullets[i].direction = 1;

                bullets[i].height = 5;
                bullets[i].width = 13;
            } else if (player.direction == -1) {
                bullets[i].row = player.screenRow + player.height/2 - 3;
                bullets[i].col = player.screenCol - bullets[i].width/2;
                bullets[i].direction = -1;

                bullets[i].height = 5;
                bullets[i].width = 13;
            } else {
                bullets[i].row = player.screenRow - bullets[i].width;
                bullets[i].col = player.screenCol;
                bullets[i].direction = 0;

                bullets[i].height = 13;
                bullets[i].width = 5;
            }

            // Takes the bullet out of the pool
            bullets[i].active = 1;

            // Break out of the loop
            break;
        }
    }
}

// Handles every-frame actions of a bullet
void updateBullet(BULLET* b) {

    // If active, update; otherwise ignore
    if (b->active) {

        if (BUTTON_HELD(BUTTON_UP) && vOff < 352 && vOff > 0) {
            b->rowDirection = -1;
        } else {
            b->rowDirection = 0;
        }

        if (b->direction == 1) {
            if (b->col + b->cdel <= SCREENWIDTH - 1) {
                b->col += b->cdel;
            } else {
                b->active = 0;
            }
        } else if (b->direction == -1) {
            if (b->col + b->width - b->cdel >= 0) {
                b->col -= b->cdel;
            } else {
                b->active = 0;
            }
        } else {
            if (b->row + b->height - b->rdel >= 0) {
                b->row -= b->rdel;
            } else {
                b->active = 0;
            }
        }

        if (b->direction != 0 && b->rowDirection == -1) {
            b->row += player.rdel;
        }

        for (int i = 0; i < BIGASTEROIDCOUNT; i++) {
            if (collision(bigAsteroids[i].row, bigAsteroids[i].col, bigAsteroids[i].height, bigAsteroids[i].width,
                b->row, b->col, b->height, b->width)) {
                bigAsteroids[i].active = 0;
                b->active = 0;
            }
        }

        for (int i = 0; i < SMALLASTEROIDCOUNT; i++) {
            if (collision(smallAsteroids[i].row, smallAsteroids[i].col, smallAsteroids[i].height, smallAsteroids[i].width,
                b->row, b->col, b->height, b->width)) {
                smallAsteroids[i].active = 0;
                b->active = 0;
            }
        }
    }
}

// Draws the bullets
void drawBullets() {
    for (int i = 0; i < BULLETCOUNT; i++) {
        if (bullets[i].active) {
            if (bullets[i].direction != 0) {
                shadowOAM[i + BIGASTEROIDCOUNT + SMALLASTEROIDCOUNT + 1].attr0 = (ROWMASK & bullets[i].row) | ATTR0_4BPP | ATTR0_WIDE;
                shadowOAM[i + BIGASTEROIDCOUNT + SMALLASTEROIDCOUNT + 1].attr1 = (COLMASK & bullets[i].col) | ATTR1_TINY;
                shadowOAM[i + BIGASTEROIDCOUNT + SMALLASTEROIDCOUNT + 1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(17, 20);
            } else {
                shadowOAM[i + BIGASTEROIDCOUNT + SMALLASTEROIDCOUNT + 1].attr0 = (ROWMASK & bullets[i].row) | ATTR0_4BPP | ATTR0_TALL;
                shadowOAM[i + BIGASTEROIDCOUNT + SMALLASTEROIDCOUNT + 1].attr1 = (COLMASK & bullets[i].col) | ATTR1_TINY;
                shadowOAM[i + BIGASTEROIDCOUNT + SMALLASTEROIDCOUNT + 1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(17, 24);
            }
        } else {
            shadowOAM[i + BIGASTEROIDCOUNT + SMALLASTEROIDCOUNT + 1].attr0 = ATTR0_HIDE;
        }
    }
}

// Initializes the lives
void initLives() {
    for (int i = 0; i < LIFECOUNT; i++) {
        lives[i].row = 0;
        lives[i].col = 160 + 16*i;
        lives[i].active = 1;
    }
}

// Draws the lives
void drawLives() {
    for (int i = 0; i < LIFECOUNT; i++) {
        if (!lives[i].active) {
            shadowOAM[i + 19].attr0 = ATTR0_HIDE;
        } else {
            shadowOAM[i + 19].attr0 = (ROWMASK & lives[i].row) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[i + 19].attr1 = (COLMASK & lives[i].col) | ATTR1_SMALL;
            shadowOAM[i + 19].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(17, 22);
        }
    }
}

void initTimer() {
    REG_TM2CNT = 0;
    REG_TM3CNT = 0;
    REG_TM2D = -0x4000;
    REG_TM2CNT = TM_FREQ_1024 | TIMER_ON;
    REG_TM3CNT = TM_IRQ | TIMER_ON | TM_CASCADE;
}

void updateTimer() {
    sec = -1;

    if (REG_TM3D != sec) {
        sec = REG_TM3D;

        minuteDigit = sec / 60;
        int secondDigit = sec % 60;

        secondDigit1 = secondDigit / 10;
        secondDigit2 = secondDigit % 10;

    }

    if ((sec == 20) && (clockTime != 1)) {
        playSoundB(clock, CLOCKLEN, CLOCKFREQ, 1);
        clockTime = 1;
    }
}

void drawTimer() {

    int row = 0;
    int col = 0;

    if (sec < 20) {
        // draws minute digit
        shadowOAM[25].attr0 = (ROWMASK & row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[25].attr1 = (COLMASK & col) | ATTR1_SMALL;
        shadowOAM[25].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(27, 0 + 2*minuteDigit);

        col = 16;

        // draws colon
        shadowOAM[26].attr0 = (ROWMASK & row) | ATTR0_4BPP | ATTR0_TALL;
        shadowOAM[26].attr1 = (COLMASK & col) | ATTR1_TINY;
        shadowOAM[26].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(27, 20);

        col = 24;

        // draws second digit1
        shadowOAM[27].attr0 = (ROWMASK & row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[27].attr1 = (COLMASK & col) | ATTR1_SMALL;
        shadowOAM[27].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(27, 0 + 2*secondDigit1);

        col = 40;

        // draws second digit2
        shadowOAM[28].attr0 = (ROWMASK & row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[28].attr1 = (COLMASK & col) | ATTR1_SMALL;
        shadowOAM[28].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(27, 0 + 2*secondDigit2);
    } else {
        // draws minute digit
        shadowOAM[25].attr0 = (ROWMASK & row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[25].attr1 = (COLMASK & col) | ATTR1_SMALL;
        shadowOAM[25].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(29, 0 + 2*minuteDigit);

        col = 16;

        // draws colon
        shadowOAM[26].attr0 = (ROWMASK & row) | ATTR0_4BPP | ATTR0_TALL;
        shadowOAM[26].attr1 = (COLMASK & col) | ATTR1_TINY;
        shadowOAM[26].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(29, 20);

        col = 24;

        // draws second digit1
        shadowOAM[27].attr0 = (ROWMASK & row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[27].attr1 = (COLMASK & col) | ATTR1_SMALL;
        shadowOAM[27].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(29, 0 + 2*secondDigit1);

        col = 40;

        // draws second digit2
        shadowOAM[28].attr0 = (ROWMASK & row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[28].attr1 = (COLMASK & col) | ATTR1_SMALL;
        shadowOAM[28].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(29, 0 + 2*secondDigit2);
    }

}