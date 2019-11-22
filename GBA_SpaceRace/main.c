/*
HOW TO PLAY: You have been separated from your spaceship, and you must reach it
before it takes off in one minute. Avoid the asteroids along the way!
Use the up, left, and right arrow keys to move astronaut. Use A to
fire. Use B for the cheat.

FEATURES:
Asteroids are of different sizes and have randomized positions.

Player/astronaut is animated, has 5 lives, and can shoot asteroids (to the left,
right, and up).

1 minute timer using interrupts

Multiple backgrounds (pause screen)

Sounds for every screen and sound effects during game

Cheat (Button B) - gains jetpack boost to go faster and to protect from the
asteroids

BUGS: No known bugs
*/

#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "sound.h"

#include "startScreen.h"
#include "instructionsScreen.h"
#include "gameScreen.h"
#include "pauseScreen.h"
#include "pauseScreen2.h"
#include "winScreen.h"
#include "loseScreen.h"
#include "spritesheet.h"

#include "startMusic.h"
#include "instructionMusic.h"
#include "gameMusic.h"
#include "pause.h"
#include "win.h"
#include "lose.h"

// Prototypes
void initialize();

// State Prototypes
void startState();
void instructionState();
void gameState();
void pauseState();
void winState();
void loseState();
void goToStartState();
void goToInstructionState();
void goToGameState();
void goToPauseState();
void goToWinState();
void goToLoseState();

// States
enum {START, INSTRUCTION, GAME, PAUSE, WIN, LOSE};
int state;

int seed;

int time;

OBJ_ATTR shadowOAM[128];

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
        switch (state) {
            case START:
            startState();
            break;

            case INSTRUCTION:
            instructionState();
            break;

            case GAME:
            gameState();
            break;

            case PAUSE:
            pauseState();
            break;

            case WIN:
            winState();
            break;

            case LOSE:
            loseState();
            break;
        }

    }
}

// Sets up GBA
void initialize() {

    setupSounds();
    setupInterrupts();

    playSoundA(startMusic, STARTMUSICLEN, STARTMUSICFREQ, 1);

    goToStartState();
}

void startState() {

    seed++;

    // Lock the framerate to 60 fps
    waitForVBlank();

    // Press START to go to the game
    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);
        initGame();
        goToGameState();

        stopSound();
        playSoundB(gameMusic, GAMEMUSICLEN, GAMEMUSICFREQ, 1);
    }

    // Press SELECT to go to the instructions
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToInstructionState();

        stopSound();
        playSoundA(instructionMusic, INSTRUCTIONMUSICLEN, INSTRUCTIONMUSICFREQ, 1);
    }
}

void goToStartState() {

    waitForVBlank();

    // Loads the background for the start screen
    DMANow(3, startScreenPal, PALETTE, 256);
    DMANow(3, startScreenTiles, &CHARBLOCK[0], startScreenTilesLen/2);
    DMANow(3, startScreenMap, &SCREENBLOCK[31], startScreenMapLen/2);

    // Sets up and shows the background
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    seed = 0;

    state = START;
}

void instructionState() {
    waitForVBlank();

    // Press START to go to the game
    if (BUTTON_PRESSED(BUTTON_START)) {
        initGame();
        goToGameState();

        stopSound();
        playSoundB(gameMusic, GAMEMUSICLEN, GAMEMUSICFREQ, 1);
    }

    // Press SELECT to go to the start screen
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStartState();

        stopSound();
        playSoundA(startMusic, STARTMUSICLEN, STARTMUSICFREQ, 1);
    }
}

void goToInstructionState() {
    waitForVBlank();

    DMANow(3, instructionsScreenPal, PALETTE, 256);
    DMANow(3, instructionsScreenTiles, &CHARBLOCK[0], instructionsScreenTilesLen/2);
    DMANow(3, instructionsScreenMap, &SCREENBLOCK[31], instructionsScreenMapLen/2);

    // Sets up and shows the background
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = INSTRUCTION;
}

void gameState() {
    updateGame();
    drawGame();
    waitForVBlank();

    // goes to the pause screen when START is pressed
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPauseState();

        REG_TM2CNT ^= TIMER_ON; // pauses the timer

        pauseSound();
        playSoundB(pause, PAUSELEN, PAUSEFREQ, 1);
    }

    // if the player reaches the rocket ship, the player wins
    if (collision(player.worldRow, player.worldCol, player.height, player.width,
        rocket.worldRow, rocket.worldCol, rocket.height, rocket.width)) {
        goToWinState();

        stopSound();
        playSoundA(win, WINLEN, WINFREQ, 0);
    }

    // if there are no lives left, the player loses
    if (livesLeft == 0) {
        goToLoseState();

        stopSound();
        playSoundB(lose, LOSELEN, LOSEFREQ, 0);
    }

    // if the timer reaches 1 minutes/60 seconds, the player loses
    if (REG_TM3D == 30) {
        goToLoseState();

        stopSound();
        playSoundB(lose, LOSELEN, LOSEFREQ, 0);
    }

}

void goToGameState() {

    // Sets up and shows background
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = BG_SIZE_TALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(30);

    // Loads in the background for the game screen
    DMANow(3, gameScreenPal, PALETTE, 256);
    DMANow(3, gameScreenTiles, &CHARBLOCK[0], gameScreenTilesLen/2);
    DMANow(3, gameScreenMap, &SCREENBLOCK[30], gameScreenMapLen/2);

    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);

    hideSprites();

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = GAME;
}

void pauseState() {

    waitForVBlank();

    // resume the game by pressing START
    if (BUTTON_PRESSED(BUTTON_START)) {
        REG_TM2CNT ^= TIMER_ON;

        goToGameState();

        unpauseSound();
        playSoundB(gameMusic, GAMEMUSICLEN, GAMEMUSICFREQ, 1);
    }

    // restarts the game by pressing SELECT
    if (BUTTON_PRESSED(BUTTON_SELECT)) {

        goToStartState();

        stopSound();
        playSoundA(startMusic, STARTMUSICLEN, STARTMUSICFREQ, 1);
    }
}

void goToPauseState() {

    waitForVBlank();

    DMANow(3, pauseScreenPal, PALETTE, 256);
    DMANow(3, pauseScreenTiles, &CHARBLOCK[0], pauseScreenTilesLen/2);
    DMANow(3, pauseScreenMap, &SCREENBLOCK[31], pauseScreenMapLen/2);

    DMANow(3, pauseScreen2Tiles, &CHARBLOCK[1], pauseScreenTilesLen/2);
    DMANow(3, pauseScreen2Map, &SCREENBLOCK[30], pauseScreenMapLen/2);

    // Sets up and shows the background
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(30);

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = PAUSE;
}

void winState() {

    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStartState();

        stopSound();
        playSoundA(startMusic, STARTMUSICLEN, STARTMUSICFREQ, 1);
    }
}

void goToWinState() {

    waitForVBlank();

    DMANow(3, winScreenPal, PALETTE, 256);
    DMANow(3, winScreenTiles, &CHARBLOCK[0], winScreenTilesLen/2);
    DMANow(3, winScreenMap, &SCREENBLOCK[31], winScreenMapLen/2);

    // Sets up and shows the background
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = WIN;
}

void loseState() {

    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStartState();

        stopSound();
        playSoundA(startMusic, STARTMUSICLEN, STARTMUSICFREQ, 1);
    }
}

void goToLoseState() {

    waitForVBlank();

    DMANow(3, loseScreenPal, PALETTE, 256);
    DMANow(3, loseScreenTiles, &CHARBLOCK[0], loseScreenTilesLen/2);
    DMANow(3, loseScreenMap, &SCREENBLOCK[31], loseScreenMapLen/2);

    // Sets up and shows the background
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = LOSE;
}
