/**
 * ---- COMPLETED ----
 * (--GENERAL GAMEPLAY--)
 * M2: Added movement in all directions
 * 
 * M3: Added map transitioning (between main, classroom, storage room)
 * 
 * <---------------------------->
 * (--KEYS--)
 * M2: Picking up and using keys on doors
 * 
 * M3: Added storage room key obtainable from code puzzle in Classroom A
 * M3: Added entrance key obtainable from storage room
 * 
 * 
 * <----------------------------> 
 * (--BOX PUZZLES--)
 * M2: Pushing boxes
 * 
 * M3: Added box puzzle to storage room
 * M3: Completed box puzzle positions are saved
 * M3: Unsolved box puzzles are reset when player leaves the room
 * 
 * <---------------------------->
 * (--CODE PUZZLES--)
 * M2: None
 * 
 * M3: Added code puzzle screen
 * M3: Player can change inputted digits
 * M3: Added code puzzle to Classroom A (code: 62380)
 * 
 * <---------------------------->
 * (--DIALOGUE--)
 * M2: Added single line text displaying
 * 
 * M3: Added dialogue box
 * M3: Added multiple line dialogues
 * 
 * M4: Added all dialogue to game
 * 
 * <---------------------------->
 * (--STATES--)
 * M2: Going between all states (start, instructions, game, lose, win)
 * 
 * M3: Modified win condition (must be holding entrance key and stand on green tile)
 * 
 * M4: Modified win and lose condition
 * <---------------------------->
 * ---- TO DO ----
 * (GAMEPLAY)
 * Add inventory/pause screen for held keys
 * Add enemies with simple patrol patterns and lose condition
 * Add cheat feature (battling with enemies)
 * Only hide sprites covered by dialogue/code input scren
 * 
 * (MAP DESIGN)
 * Add last 2 box puzzles to Storage Room
 * Add code puzzle hint to Classroom A
 * Add restroom map
 * 
 * (SOUND/ART)
 * Add sound effects for picking up keys
 * Add music for game and start screen
 * 
 * Add art for map tiles and character sprites
 * Add profile art for dialogue box
 * 
 * Add cutscene for winning with 2 separate moving backgrounds
 * Add cutscene before game begins
 * 
 * ---- BUGS/ISSUES ----
 * Opening the dialogue/code input screen immediately hides all sprites (which can look jarring)
 * 
 * ---- HOW TO PLAY ----
 * (Start)
 * START : Start the game
 * SELECT : Read the instructions
 * 
 * (Instructions)
 * START : Start the game
 * SELECT : Go back to the start screen
 * 
 * (Game)
 * SELECT : Pause the game
 * Left/Right/Up/Down Keys : Move the player
 * A : Interact with an object
 * Go to LOSE : Step on red tile
 * Go to WIN : Pick up entrance key in storage room and step on green tile
 * 
 * (Pause)
 * SELECT : Go back to the start screen
 * START : Continue the game
 * 
 * (Code Puzzle)
 * Left and Right Keys : Change which digit to be highlighted
 * Up and Down Arrows Keys : Edit the highlighted digit
 * A : Enter the code
 * B : Exit the code input screen
 * 
 * (Box Puzzle)
 * A : Push the box you are facing
 * 
 * (Dialogue)
 * A : Go to next dialogue line
 * 
 * (Lose)
 * SELECT : Go back to the start screen
 * 
 * (Win)
 * SELECT : Go back to the start screen
 * 
 * ---- WALKTHROUGH ----
 * Press A to pick up the key next to the locker
 * Press A to unlock the top left door (classroom A)
 * Enter classroom A
 * 
 * Press A to interact with the desk in the 2nd column, 1st row
 * Input the code 62380 using the arrow keys
 * Press A to enter the code and get the storage room key
 * Leave classroom A
 * 
 * Press A to unlock the top right door (storage room)
 * Enter the storage room
 * Press A to push the boxes out of the way
 * Press A to pick up the key in the bottom right corner of the map
 * Leave the storage room
 * 
 * Step on the green tile in the bottom left corner to escape
**/
#include <stdlib.h>
#include <stdio.h>
#include "mode0.h"
#include "game.h"
#include "collision.h"

// Tile maps for screens
#include "startScreen.h"
#include "instructionsScreen.h"
#include "loseScreen.h"
#include "winScreen.h"

// Game Maps
#include "mainMap.h"
#include "storageRoom.h"
#include "classroomA.h"
#include "collisionMap.h"

// Spritesheet
#include "spritesheet.h"
#include "codeInputBox.h"

// Prototypes.
void initialize();

// State Prototypes.
void goToStart();
void start();
void goToInstructions();
void instructions();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// States.
enum {
    START,
    INSTRUCTIONS,
    GAME,
    PAUSE,
    WIN,
    LOSE
};
int state;

// Button Variables.
unsigned short buttons;
unsigned short oldButtons;

// Shadow OAM.
OBJ_ATTR shadowOAM[128];

// Random number seed
int seed;

int main() {
    initialize();

    while (1) {
        // Update button variables.
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine.
        switch (state) {
        case START:
            start();
            break;
        case INSTRUCTIONS:
            instructions();
            break;
        case GAME:
            game();
            break;
        case PAUSE:
            pause();
            break;
        case WIN:
            win();
            break;
        case LOSE:
            lose();
            break;
        }
    }
}

// Sets up GBA.
void initialize() {
    REG_DISPCTL = MODE0 | BG1_ENABLE;
    REG_BG1CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    buttons = BUTTONS;
    oldButtons = 0;

    goToStart();
}

// Sets up the start state.
void goToStart() {
    DMANow(3, startScreenPal, PALETTE, 256);
    DMANow(3, startScreenTiles, &CHARBLOCK[0], startScreenTilesLen / 2);
    DMANow(3, startScreenMap, &SCREENBLOCK[31], startScreenMapLen / 2);

    REG_DISPCTL = MODE0 | BG1_ENABLE;

    vOff = 0;
    hOff = 0;

    REG_BG1VOFF = vOff;
    REG_BG1HOFF = hOff;

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

// Runs every frame of the start state.
void start() {
    seed++;
    
    if (BUTTON_PRESSED(BUTTON_START)) {
        state = GAME;
        goToGame();
        srand(seed);
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        state = INSTRUCTIONS;
        goToInstructions();
    }
}

// Sets up the instructions state.
void goToInstructions() {
    DMANow(3, instructionsScreenPal, PALETTE, 256);
    DMANow(3, instructionsScreenTiles, &CHARBLOCK[0], instructionsScreenTilesLen / 2);
    DMANow(3, instructionsScreenMap, &SCREENBLOCK[31], instructionsScreenMapLen / 2);

    REG_BG1VOFF = vOff;
    REG_BG1HOFF = hOff;
}

// Runs every frame of the instructions state.
void instructions() {
    seed++;
    if (BUTTON_PRESSED(BUTTON_START)) {
        state = GAME;
        goToGame();
        srand(seed);
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        state = START;
        goToStart();
    }
}

// Sets up the game state.
void goToGame() {
    waitForVBlank();

    REG_DISPCTL |= SPRITE_ENABLE;

    // Set up the main background
    DMANow(3, mainMapPal, PALETTE, 256);
    DMANow(3, mainMapTiles, &CHARBLOCK[0], mainMapTilesLen / 2);
    DMANow(3, mainMapMap, &SCREENBLOCK[31], mainMapMapLen / 2);

    REG_BG1VOFF = vOff;
    REG_BG1HOFF = hOff;

    // Set up sprites
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    initGame();
}

// Runs every frame of the game state.
void game() {
    updateGame();
    drawGame();

    // Loads the correct map if it has changed
    if (prevMap != currMap) {
        prevMap = currMap;
        switch (currMap) {
            case MAIN:
                DMANow(3, mainMapPal, PALETTE, 256);
                DMANow(3, mainMapTiles, &CHARBLOCK[0], mainMapTilesLen / 2);
                DMANow(3, mainMapMap, &SCREENBLOCK[31], mainMapMapLen / 2);
                break;
            case CLASSROOMA:
                DMANow(3, classroomAPal, PALETTE, 256);
                DMANow(3, classroomATiles, &CHARBLOCK[0], classroomATilesLen / 2);
                DMANow(3, classroomAMap, &SCREENBLOCK[31], classroomAMapLen / 2);
                break;
            case STORAGEROOM:
                DMANow(3, storageRoomPal, PALETTE, 256);
                DMANow(3, storageRoomTiles, &CHARBLOCK[0], storageRoomTilesLen / 2);
                DMANow(3, storageRoomMap, &SCREENBLOCK[31], storageRoomMapLen / 2);
                break;
            case RESTROOM:
                // load bathroom map
                break;
            default:
                break;
        }
    }
    
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        state = PAUSE;
        goToPause();
    }

    // Temporary win and lose conditions
    if (loseCollision(player.worldCol, player.worldRow, player.width, player.height)) {
        state = LOSE;
        goToLose();
    }

    if (winCollision(player.worldCol, player.worldRow, player.width, player.height)) {
        state = WIN;
        goToWin();
    }
}

// Sets up the pause state.
void goToPause() {

}

// Runs every frame of the pause state.
void pause() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        state = GAME;
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        state = START;
        goToStart();
    }
}

// Sets up the win state.
void goToWin() {
    DMANow(3, winScreenPal, PALETTE, 256);
    DMANow(3, winScreenTiles, &CHARBLOCK[0], winScreenTilesLen / 2);
    DMANow(3, winScreenMap, &SCREENBLOCK[31], winScreenMapLen / 2);

    vOff = 0;
    hOff = 0;

    REG_BG1VOFF = vOff;
    REG_BG1HOFF = hOff;

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

// Runs every frame of the win state.
void win() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        state = START;
        goToStart();
    }
}

// Sets up the lose state.
void goToLose() {
    DMANow(3, loseScreenPal, PALETTE, 256);
    DMANow(3, loseScreenTiles, &CHARBLOCK[0], loseScreenTilesLen / 2);
    DMANow(3, loseScreenMap, &SCREENBLOCK[31], loseScreenMapLen / 2);

    vOff = 0;
    hOff = 0;

    REG_BG1VOFF = vOff;
    REG_BG1HOFF = hOff;

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

// Runs every frame of the lose state.
void lose() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        state = START;
        goToStart();
    }
}