#include "mode0.h"
#include "game.h"
#include "print.h"
#include "collision.h"
#include "collisionMap.h"
#include "storageRoomCollision.h"
#include "classroomACollision.h"
#include "dialogue.h"
#include "dialogueLines.h"
#include "code.h"
#include <string.h>

// Screen location variables
int hOff;
int vOff;

// Sprite Objects
SPRITE player;

SPRITE enemiesMain[ENEMYMAINCOUNT];
SPRITE enemiesStorage[ENEMYSTORAGECOUNT];

SPRITE keys[KEYCOUNT];

SPRITE objectsMain[MAINOBJCOUNT];  // Interactable objects in Main Map
SPRITE objectsClass[CLASSOBJCOUNT]; // Interactable objects in Classroom 3A
SPRITE objectsStorage[STORAGEOBJCOUNT]; // Interactable objects in Storage Room

// Keys
int heldKeys[];
int keyLocations[] = {
    70, 160, 0, 0, 240, 240
};
int currHeldKeys;
int prevHeldKeys;

// Doors
DOOR doors[DOORCOUNT];
int doorLocations[] = {
    80, 0, 160, 0
};
int doorWidth = 24;
int doorHeight = 8;

// Box Puzzles
BOXPUZZLE boxPuzzle1;
BOXPUZZLE boxPuzzle2;
BOXPUZZLE boxPuzzle3;
BOXPUZZLE boxPuzzle4;
// Keeps track of which puzzle player is interacting with
BOXPUZZLE* currBoxPuzzle;

// Code Puzzles
int codePuzzleLocations[] = {
    64, 116
};

// Notes
int noteMainLocations[] = {
    113, 7
};
int noteClassroomLocations[] = {
    40, 80
};
int noteStorageLocations[] = {
    3, 10
};
int* currNoteLocations;
int currNoteCount;

// Enemies
// Main Map Enemies
int enemyMainLocations[] = {
    88, 160, 0,
    88, 170, 0,
    103, 177, 0,
    208, 64, RIGHT,
    208, 136, RIGHT
};
int enemyStorageLocations[] = {
    20, 30, 0,
    100, 20, 0
};
// Determines when to spawn enemies
int spawnMainEnemies;
int spawnStorageEnemies;

// Objects
// Main Map Objects
// Column, Row, Show/Don't Show
int objectMainLocations[] = {
    115, 10, TRUE,
    95, 11, TRUE,
    174, 11, TRUE,
};
int objectClassLocations[] = {
    71, 124, TRUE,
    42, 91, TRUE
};
int objectStorageLocations[] = {
    1, 1, FALSE
};

int playerDirection;
int shadowOAMCount;

int showDialogue;
int prevShowDialogue;

int showCode;
int prevShowCode;

int currMapWidth;
int currMapHeight;
int currMap;
int prevMap;

// Cooldown for interaction with objects
// Used to prevent user from exiting dialogue and reentering immediately
int intCD;

// Map
unsigned char* collisionMap;

// Player animation states
enum {PLAYERFRONT, PLAYERBACK, PLAYERRIGHT, PLAYERLEFT, PLAYERIDLE};

void initGame() {
    mgba_open();
    
    // Positions screen at entrance
    vOff = 96;
    hOff = 0;

    showDialogue = FALSE;
    prevShowDialogue = FALSE;
    showCode = FALSE;
    prevShowCode = FALSE;

    collisionMap = (unsigned char*) collisionMapBitmap;
    currMapWidth = MAINMAPWIDTH;
    currMapHeight = MAINMAPHEIGHT;
    prevMap = MAIN;
    currMap = MAIN;

    spawnMainEnemies = TRUE;
    spawnStorageEnemies = TRUE;
    currNoteLocations = noteMainLocations;
    currNoteCount = NOTEMAINCOUNT;

    initPlayer();
    initKeys();
    initDoors();
    initBoxPuzzles();
    initEnemies();
    initObjects();

    boxPuzzle1.solved = FALSE;
    boxPuzzle2.solved = FALSE;
    boxPuzzle3.solved = FALSE;
    boxPuzzle4.solved = FALSE;
}

void updateGame() {    
    // Handles reading dialogue (both single and multiple lines)
    if (showDialogue) {
        intCD = 0;
        updateDialogue();
    } else if (showCode) {
        updateCode();
    }
    
    // Updates game when out of dialogue
    if (!showDialogue && !showCode) {
        updatePlayer();
        intCD++;

        for (int i = 0; i < MAXBOXCOUNT; i++) {
            if (currBoxPuzzle->boxes[i].beingPushed) {
                updateBox(&currBoxPuzzle->boxes[i], currBoxPuzzle->boxes, i, currBoxPuzzle->totalBoxes);
            }
        }

        updateEnemies();
    }
}

void drawGame() {
    shadowOAMCount = 0;

    if (!showDialogue && !showCode) {
        drawPlayer();
        drawBoxPuzzles();
        drawObjects();

        drawEnemies();

        for (int i = 0; i < KEYCOUNT; i++) {
            drawKey(&keys[i]);
        }
    }
    
    if (showDialogue) {
        drawDialogue();
    }

    if (showCode) {
        if (prevShowCode != showCode) {
            initCodePuzzle();
            prevShowCode = showCode;
        }

        drawCode();
    }

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    REG_BG1HOFF = hOff;
    REG_BG1VOFF = vOff;
}

// Initialize the player
void initPlayer() {
    player.width = 9;
    player.height = 15;
    player.rdel = 1;
    player.cdel = 1;

    // Place player at the entrance
    player.worldRow = 136 + vOff;
    player.worldCol = 20 + hOff;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 3;
    player.aniState = PLAYERBACK;
    playerDirection = UP;

    initHeldKeys();
}

void updatePlayer() {
    if (BUTTON_HELD(BUTTON_UP)) {
        playerDirection = UP;
        if (!checkPlayerCollision(playerDirection)) {
            if (player.worldRow > 0) {
                player.worldRow -= player.rdel;

                if (vOff > 0 && player.worldRow - vOff < SCREENHEIGHT / 2) {
                    vOff--;
                }
            }
        }
    }

    if (BUTTON_HELD(BUTTON_DOWN)) {
        playerDirection = DOWN;
        if (!checkPlayerCollision(playerDirection)) {
            if (player.worldRow < MAPHEIGHT - player.height) {
                player.worldRow += player.rdel;

                if (vOff + SCREENHEIGHT < MAPHEIGHT && player.worldRow > SCREENHEIGHT / 2) {
                    vOff++;
                }
            }
        }
    }

    if (BUTTON_HELD(BUTTON_LEFT)) {
        playerDirection = LEFT;
        if (!checkPlayerCollision(playerDirection)) {
            if (player.worldCol > 0) {
                player.worldCol -= player.cdel;

                if (hOff > 0 && player.worldCol - hOff < SCREENWIDTH / 2) {
                    hOff--;
                }
            }
        }
    }

    if (BUTTON_HELD(BUTTON_RIGHT)) {
        playerDirection = RIGHT;
        if (!checkPlayerCollision(playerDirection)) {
            if (player.worldCol < MAPWIDTH - player.width) {
                player.worldCol += player.cdel;

                if (hOff + SCREENWIDTH < MAPWIDTH && player.worldCol > SCREENWIDTH / 2) {
                    hOff++;
                }
            }
        }
    }

    // Finds which box puzzle the player is near
    if (player.worldRow > 183) {
        currBoxPuzzle = &boxPuzzle1;
    } else if (player.worldRow < 183 && player.worldRow > 86 && player.worldCol < 112) {
        currBoxPuzzle = &boxPuzzle2;
    } else if (player.worldRow < 86 && player.worldCol < 161) {
        currBoxPuzzle = &boxPuzzle3;
    } else if (player.worldRow < 169 && player.worldCol > 160) {
        currBoxPuzzle = &boxPuzzle4;
    }

    // Interacts with objects
    if (BUTTON_PRESSED(BUTTON_A) && intCD != 0) {
        // Finds which key and door the player is interacting with
        int k = keyCollision(player.worldCol, player.worldRow, player.width, player.height, playerDirection);
        int d = lockedDoorCollision(player.worldCol, player.worldRow, player.width, player.height, playerDirection);
        int n = noteCollision(player.worldCol, player.worldRow, player.width, player.height, playerDirection, currNoteLocations, currNoteCount);

        // Finds which box in that puzzle the player is interacting with
        int b = boxCollision(currBoxPuzzle->boxes, currBoxPuzzle->totalBoxes, player.worldCol, player.worldRow, player.width, player.height, playerDirection);

        if (k != -1 && !keys[k].hide) {
            prevShowDialogue = FALSE;
            showDialogue = TRUE;

            updateHeldKey(k);
            updateKey(&keys[k]);

            switch (k) {
                case 0:
                    initDialogue(classroomAKeyD, 4);
                    break;
                case 2:
                    initDialogue(entranceKeyD, 3);
                    break;
            }
        }

        if (d != -1 && !doors[d].unlocked) {
            if (heldKeys[d] == TRUE) {
                prevShowDialogue = FALSE;
                showDialogue = TRUE;

                doors[d].unlocked = TRUE;

                switch (d) {
                    case 0:
                        initDialogue(classroomADoorD, 2);
                        break;
                    case 1:
                        initDialogue(storageRoomDoorD, 2);
                        break;
                }
            } else {
                prevShowDialogue = FALSE;
                showDialogue = TRUE;

                switch (d) {
                    case 0:
                        initDialogue(classroomADoorLD, 2);
                        break;
                    case 1:
                        initDialogue(storageRoomDoorLD, 2);
                        break;
                }
            }
        }

        if (n != -1) {
            prevShowDialogue = FALSE;
            showDialogue = TRUE;

            switch (n) {
                case 0:
                    if (currMap == MAIN) {
                        initDialogue(notesMain1D, 7);
                    } else if (currMap == CLASSROOMA) {
                        initDialogue(notesClass1D, 8);
                    }
                    
                    break;
            }
        }

        if (b != -1) {
            if (!currBoxPuzzle->solved && currBoxPuzzle->boxes[b].beingPushed == FALSE) {
                currBoxPuzzle->boxes[b].pushDirection = playerDirection;
                currBoxPuzzle->boxes[b].beingPushed = TRUE;

                switch (currBoxPuzzle->boxes[b].pushDirection) {
                    case LEFT:
                        currBoxPuzzle->boxes[b].boxSprite.cdel = -1;
                        currBoxPuzzle->boxes[b].boxSprite.rdel = 0;
                        break;
                    case RIGHT:
                        currBoxPuzzle->boxes[b].boxSprite.cdel = 1;
                        currBoxPuzzle->boxes[b].boxSprite.rdel = 0;
                        break;
                    case UP:
                        currBoxPuzzle->boxes[b].boxSprite.rdel = -1;
                        currBoxPuzzle->boxes[b].boxSprite.cdel = 0;
                        break;
                    case DOWN:
                        currBoxPuzzle->boxes[b].boxSprite.rdel = 1;
                        currBoxPuzzle->boxes[b].boxSprite.cdel = 0;
                        break;
                }
            }
        }

        if (codePuzzleCollision(player.worldCol, player.worldRow, player.width, player.height, playerDirection)) {
            prevShowCode = showCode;
            showCode = TRUE;
        }
    }

    // Checks if box puzzle is solved
    if (currMap == STORAGEROOM) {
        if (!currBoxPuzzle->solved && collision(currBoxPuzzle->solCol, currBoxPuzzle->solRow, 16, 16, player.worldCol, player.worldRow, player.width, player.height)) {
            currBoxPuzzle->solved = TRUE;
        }
    }

    // Moves player to a different map
    if (checkCollision(player.worldCol, player.worldRow, player.width, player.height, 0, 0) == DOORCLR) {
        moveMap(doorCollision(player.worldCol, player.worldRow, player.width, player.height));
    }

    animatePlayer();
}

// Changes the map to the correct map based on the door the player steps in
void moveMap(int i) {
    hideSprites();
    if (currMap == MAIN) {
        switch (i) {
            case 0:
                currMap = CLASSROOMA;
                currNoteLocations = noteClassroomLocations;
                currNoteCount = NOTECLASSCOUNT;
                collisionMap = (unsigned char*) classroomACollisionBitmap;
                currMapWidth = CLASSMAPWIDTH;
                currMapHeight = CLASSMAPHEIGHT;
                player.worldCol = CLASSCOL;
                player.worldRow = CLASSROW;
                vOff = CLASSVOFF;
                hOff = CLASSHOFF;
                break;
            case 1:
                currMap = STORAGEROOM;
                currNoteLocations = noteStorageLocations;
                currNoteCount = NOTESTORAGECOUNT;
                collisionMap = (unsigned char*) storageRoomCollisionBitmap;
                currMapWidth = STORAGEMAPWIDTH;
                currMapHeight = STORAGEMAPHEIGHT;
                player.worldCol = STORAGECOL;
                player.worldRow = STORAGEROW;
                vOff = STORAGEVOFF;
                hOff = STORAGEHOFF;
                keys[2].hide = FALSE;
                break;
            case 2:
                // Set correct positions from main map to restroom
                break;
        }
    } else {
        currMap = MAIN;
        currNoteLocations = noteMainLocations;
        currNoteCount = NOTEMAINCOUNT;
        collisionMap = (unsigned char*) collisionMapBitmap;
        currMapWidth = MAINMAPWIDTH;
        currMapHeight = MAINMAPHEIGHT;

        switch (prevMap) {
            case CLASSROOMA:
                player.worldCol = MAINCLASSCOL;
                player.worldRow = MAINCLASSROW;
                vOff = MAINCLASSVOFF;
                hOff = MAINCLASSHOFF;
                break;
            case STORAGEROOM:
                player.worldCol = MAINSTORAGECOL;
                player.worldRow = MAINSTORAGEROW;
                vOff = MAINSTORAGEVOFF;
                hOff = MAINSTORAGEHOFF;
                keys[2].hide = TRUE;
                break;
            case RESTROOM:
                // Set correct positions from restroom to main map
                break;
        }
    }
    initBoxPuzzles();
    initEnemies();
    initObjects();
}

// Handle player animation states
void animatePlayer() {
    player.prevAniState = player.aniState;
    player.aniState = PLAYERIDLE;

    if (player.aniCounter % 20 == 0) {
        player.curFrame = (player.curFrame + 1) % player.numFrames;
    }

    if (BUTTON_HELD(BUTTON_UP))
        player.aniState = PLAYERBACK;
    if (BUTTON_HELD(BUTTON_DOWN))
        player.aniState = PLAYERFRONT;
    if (BUTTON_HELD(BUTTON_LEFT))
        player.aniState = PLAYERLEFT;
    if (BUTTON_HELD(BUTTON_RIGHT))
        player.aniState = PLAYERRIGHT;

    if (player.aniState == PLAYERIDLE) {
        player.curFrame = 0;
        player.aniCounter = 0;
        player.aniState = player.prevAniState;
    } else {
        player.aniCounter++;
    }
}

void drawPlayer() {
    if (player.hide) {
        shadowOAM[shadowOAMCount].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[shadowOAMCount].attr0 = (player.worldRow - vOff) | ATTR0_SQUARE;
        shadowOAM[shadowOAMCount].attr1 = (player.worldCol - hOff) | ATTR1_SMALL;
        shadowOAM[shadowOAMCount].attr2 = ATTR2_PALROW(PLAYERPALROW) | ATTR2_TILEID(player.aniState * 2, player.curFrame * 2);
    }

    shadowOAMCount++;
}

// Initializes the keys the player has
void initHeldKeys() {
    currHeldKeys = 0;
    prevHeldKeys = 0;
    
    for (int i = 0; i < KEYCOUNT; i++) {
        heldKeys[i] = FALSE;
    }
}

// Adds a key to the keys the player has
void updateHeldKey(int key) {
    heldKeys[key] = TRUE;
    prevHeldKeys = currHeldKeys;
    currHeldKeys++;
}

void initKeys() {
    for (int i = 0; i < KEYCOUNT; i++) {
        keys[i].hide = TRUE;
        keys[i].width = 8;
        keys[i].height = 4;

        // Place keys at set locations
        keys[i].worldRow = keyLocations[2 * i + 1];
        keys[i].worldCol = keyLocations[2 * i];
    }

    // Shows only the main map key
    keys[0].hide = FALSE;
}

void updateKey(SPRITE* key) {
    key->hide = TRUE;
}

void drawKey(SPRITE* key) {
    if (key->hide) {
        shadowOAM[shadowOAMCount].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[shadowOAMCount].attr0 = (key->worldRow - vOff) | ATTR0_SQUARE;
        shadowOAM[shadowOAMCount].attr1 = (key->worldCol - hOff) | ATTR1_TINY;
        shadowOAM[shadowOAMCount].attr2 = ATTR2_PALROW(KEYPALROW) | ATTR2_TILEID(0, KEYROW);
    }

    shadowOAMCount++;
}

// Initializes all interactable objects
void initObjects() {
    int numObjects;
    SPRITE* objects;
    int* objectLocations;

    switch (currMap) {
        case MAIN:
            numObjects = MAINOBJCOUNT;
            objects = objectsMain;
            objectLocations = objectMainLocations;
            break;
        case CLASSROOMA:
            numObjects = CLASSOBJCOUNT;
            objects = objectsClass;
            objectLocations = objectClassLocations;
            break;
        case STORAGEROOM:
            numObjects = STORAGEOBJCOUNT;
            objects = objectsStorage;
            objectLocations = objectStorageLocations;
    }

    for (int i = 0; i < numObjects; i++) {
        objects[i].hide = FALSE;
        objects[i].height = 3;
        objects[i].width = 3;
        objects[i].worldCol = objectLocations[3 * i];
        objects[i].worldRow = objectLocations[3 * i + 1];
    }
}

void drawObjects() {
    int numObjects;
    SPRITE* objects;

    switch (currMap) {
        case MAIN:
            numObjects = MAINOBJCOUNT;
            objects = objectsMain;
            break;
        case CLASSROOMA:
            numObjects = CLASSOBJCOUNT;
            objects = objectsClass;
            break;
        case STORAGEROOM:
            numObjects = STORAGEOBJCOUNT;
            objects = objectsStorage;
    }

    for (int i = 0; i < numObjects; i++) {
        if (objects[i].hide) {
            shadowOAM[shadowOAMCount].attr0 |= ATTR0_HIDE;
        } else {
            shadowOAM[shadowOAMCount].attr0 = (objects[i].worldRow - vOff) | ATTR0_SQUARE;
            shadowOAM[shadowOAMCount].attr1 = (objects[i].worldCol - hOff) | ATTR1_TINY;
            shadowOAM[shadowOAMCount].attr2 = ATTR2_PALROW(OBJECTPALROW) | ATTR2_TILEID(0, OBJROW);
        }

        shadowOAMCount++;
    }
}

void initDoors() {
    for (int i = 0; i < DOORCOUNT; i++) {
        doors[i].col = doorLocations[2 * i];
        doors[i].row = doorLocations[2 * i + 1];
        
        doors[i].unlocked = FALSE;

        doors[i].width = doorWidth;
        doors[i].height = doorHeight;
    }
}

// Spawns all box puzzles in the current map
void initBoxPuzzles() {
    switch (currMap) {
        case MAIN:
            break;
        case STORAGEROOM:
            initBoxPuzzle1();
            initBoxPuzzle2();
            initBoxPuzzle3();
            initBoxPuzzle4();
            break;
        default:
            break;
    }
}

void initBoxPuzzle1() {
    boxPuzzle1.totalBoxes = 7;
    int puzzle1Init[] = {
        32, 184, 32, 200, 48, 216, 48, 232, 64, 200, 80, 184, 80, 216
    };

    if (!boxPuzzle1.solved) {
        for (int i = 0; i < boxPuzzle1.totalBoxes; i++) {
            boxPuzzle1.solved = FALSE;
            boxPuzzle1.solCol = 64;
            boxPuzzle1.solRow = 168;
            boxPuzzle1.boxes[i].beingPushed = FALSE;
            boxPuzzle1.boxes[i].currPush = 0;
            boxPuzzle1.boxes[i].maxPush = 16;
            boxPuzzle1.boxes[i].pushDirection = UP;
            boxPuzzle1.boxes[i].boxSprite.height = 16; 
            boxPuzzle1.boxes[i].boxSprite.width = 16;
            boxPuzzle1.boxes[i].boxSprite.worldCol = puzzle1Init[2 * i];
            boxPuzzle1.boxes[i].boxSprite.worldRow = puzzle1Init[2 * i + 1];
        }
    }
}

void initBoxPuzzle2() {
    boxPuzzle2.totalBoxes = 1;
    int puzzle2Init[] = {
        64, 136
    };

    if (!boxPuzzle2.solved) {
        for (int i = 0; i < boxPuzzle2.totalBoxes; i++) {
            boxPuzzle2.solved = FALSE;
            boxPuzzle2.solCol = 48;
            boxPuzzle2.solRow = 120;
            boxPuzzle2.boxes[i].beingPushed = FALSE;
            boxPuzzle2.boxes[i].currPush = 0;
            boxPuzzle2.boxes[i].maxPush = 16;
            boxPuzzle2.boxes[i].pushDirection = UP;
            boxPuzzle2.boxes[i].boxSprite.height = 16; 
            boxPuzzle2.boxes[i].boxSprite.width = 16;
            boxPuzzle2.boxes[i].boxSprite.worldCol = puzzle2Init[2 * i];
            boxPuzzle2.boxes[i].boxSprite.worldRow = puzzle2Init[2 * i + 1];
        }
    }
}

void initBoxPuzzle3() {
    boxPuzzle3.totalBoxes = 6;
    int puzzle3Init[] = {
        32, 24, 48, 24, 64, 24, 80, 8, 48, 40, 48, 56
    };

    if (!boxPuzzle3.solved) {
        for (int i = 0; i < boxPuzzle3.totalBoxes; i++) {
            boxPuzzle3.solved = FALSE;
            boxPuzzle3.solCol = 128;
            boxPuzzle3.solRow = 24;
            boxPuzzle3.boxes[i].beingPushed = FALSE;
            boxPuzzle3.boxes[i].currPush = 0;
            boxPuzzle3.boxes[i].maxPush = 16;
            boxPuzzle3.boxes[i].pushDirection = UP;
            boxPuzzle3.boxes[i].boxSprite.height = 16; 
            boxPuzzle3.boxes[i].boxSprite.width = 16;
            boxPuzzle3.boxes[i].boxSprite.worldCol = puzzle3Init[2 * i];
            boxPuzzle3.boxes[i].boxSprite.worldRow = puzzle3Init[2 * i + 1];
        }
    }
}

void initBoxPuzzle4() {
    boxPuzzle4.totalBoxes = 8;
    int puzzle4Init[] = {
        208, 8, 192, 24, 176, 40, 176, 56, 176, 88, 208, 88, 224, 104, 192, 136
    };

    if (!boxPuzzle4.solved) {
        for (int i = 0; i < boxPuzzle4.totalBoxes; i++) {
            boxPuzzle4.solved = FALSE;
            boxPuzzle4.solCol = 192;
            boxPuzzle4.solRow = 152;
            boxPuzzle4.boxes[i].beingPushed = FALSE;
            boxPuzzle4.boxes[i].currPush = 0;
            boxPuzzle4.boxes[i].maxPush = 16;
            boxPuzzle4.boxes[i].pushDirection = UP;
            boxPuzzle4.boxes[i].boxSprite.height = 16; 
            boxPuzzle4.boxes[i].boxSprite.width = 16;
            boxPuzzle4.boxes[i].boxSprite.worldCol = puzzle4Init[2 * i];
            boxPuzzle4.boxes[i].boxSprite.worldRow = puzzle4Init[2 * i + 1];
        }
    }
}

// Called when a box is pushed by the player
// Pushes the box in player's current direction by 1 tile
// Called every frame to show pushing animation
void updateBox(BOX* box, BOX* boxPuzzle, int currBox, int i) {
    if (box->maxPush == box->currPush || checkBoxCollision(box, boxPuzzle, currBox, i)) {
        box->beingPushed = FALSE;
        box->boxSprite.cdel = 0;
        box->boxSprite.rdel = 0;
        box->currPush = 0;
    } else {
        box->beingPushed = TRUE;
        box->currPush++;

        // Moves the box by one pixel
        box->boxSprite.worldCol += box->boxSprite.cdel;
        box->boxSprite.worldRow += box->boxSprite.rdel;
    }
}

void drawBoxPuzzles() {
    switch (currMap) {
        case STORAGEROOM:
            drawBoxPuzzle1();
            drawBoxPuzzle2();
            drawBoxPuzzle3();
            drawBoxPuzzle4();
            break;
    }
}

void drawBoxPuzzle1() {
    for (int i = 0; i < boxPuzzle1.totalBoxes; i++) {
        drawBox(&boxPuzzle1.boxes[i].boxSprite);
    }
}

void drawBoxPuzzle2() {
    for (int i = 0; i < boxPuzzle2.totalBoxes; i++) {
        drawBox(&boxPuzzle2.boxes[i].boxSprite);
    }
}

void drawBoxPuzzle3() {
    for (int i = 0; i < boxPuzzle3.totalBoxes; i++) {
        drawBox(&boxPuzzle3.boxes[i].boxSprite);
    }
}

void drawBoxPuzzle4() {
    for (int i = 0; i < boxPuzzle4.totalBoxes; i++) {
        drawBox(&boxPuzzle4.boxes[i].boxSprite);
    }
}

void drawBox(SPRITE* box) {
    int row = box->worldRow - vOff;
    int col;

    if (box->worldCol - hOff < 0) {
        box->hide = TRUE;
    } else {
        box->hide = FALSE;
        col = box->worldCol - hOff;
    }

    if (box->hide) {
        shadowOAM[shadowOAMCount].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[shadowOAMCount].attr0 = row | ATTR0_SQUARE;
        shadowOAM[shadowOAMCount].attr1 = col | ATTR1_SMALL;
        shadowOAM[shadowOAMCount].attr2 = ATTR2_PALROW(BOXPALROW) | ATTR2_TILEID(0, BOXROW);
    }

    shadowOAMCount++;    
}

void initEnemies() {
    int numEnemies;
    SPRITE* enemies;
    int* enemyLocations;

    switch (currMap) {
        case MAIN:
            numEnemies = ENEMYMAINCOUNT;
            enemies = enemiesMain;
            enemyLocations = enemyMainLocations;
            break;
        case STORAGEROOM:
            numEnemies = ENEMYSTORAGECOUNT;
            enemies = enemiesStorage;
            enemyLocations = enemyStorageLocations;
    }
    
    for (int i = 0; i < numEnemies; i++) {
        enemies[i].hide = FALSE;
        enemies[i].aniCounter = 0;
        enemies[i].aniState = 0;
        enemies[i].cdel = 1;
        enemies[i].rdel = 1;
        enemies[i].curFrame = 0;
        enemies[i].numFrames = 3;
        enemies[i].height = 7;
        enemies[i].width = 6;
        enemies[i].worldCol = enemyLocations[3 * i];
        enemies[i].worldRow = enemyLocations[3 * i + 1];
    }
}

void updateEnemies() {
    switch (currMap) {
        case MAIN:
            if (spawnMainEnemies) {
                updateMainEnemies();
            }
            break;
        case STORAGEROOM:
            if (spawnStorageEnemies) {
                updateStorageEnemies();
            }
            break;
    }
}

void updateMainEnemies() {
    // Moves enemy 4
    if (enemiesMain[3].aniCounter % 5 == 0) {
        if (enemiesMain[3].worldCol < 240 && enemyMainLocations[3 * 3 + 2] == RIGHT) {
            enemiesMain[3].worldCol += enemiesMain[3].cdel;

            // Changes enemy's movement to go left
            if (enemiesMain[3].worldCol >= 240) {
                enemyMainLocations[3 * 3 + 2] = LEFT;
            }
        } else {
            enemiesMain[3].worldCol -= enemiesMain[3].cdel;

            // Changes enemy's movement to go right
            if (enemiesMain[3].worldCol <= 208) {
                enemyMainLocations[3 * 3 + 2] = RIGHT;
            }
        }
    }

    // Moves enemy 5

    for (int i = 0; i < ENEMYMAINCOUNT; i++) {
        animateEnemy(&enemiesMain[i]);
    }
}

void updateStorageEnemies() {
    // Moves enemy 4
    if (enemiesStorage[3].aniCounter % 5 == 0) {

    }
    

    // Moves enemy 5

    for (int i = 0; i < ENEMYSTORAGECOUNT; i++) {
        animateEnemy(&enemiesStorage[i]);
    }
}

void animateEnemy(SPRITE* enemy) {
    if (enemy->aniCounter % 20 == 0) {
        enemy->curFrame = (enemy->curFrame + 1) % enemy->numFrames;
    }

    enemy->aniCounter++;
}

void drawEnemies() {
    switch (currMap) {
        case MAIN:
            if (spawnMainEnemies) {
                for (int i = 0; i < ENEMYMAINCOUNT; i++) {
                    drawEnemy(&enemiesMain[i]);
                }
            }
            break;
        case STORAGEROOM:
            if (spawnStorageEnemies) {
                for (int i = 0; i < ENEMYSTORAGECOUNT; i++) {
                    drawEnemy(&enemiesStorage[i]);
                }
            }
    }
}

void drawEnemy(SPRITE* enemy) {
    int row = enemy->worldRow - vOff;
    int col;

    if (enemy->worldCol - hOff < 0) {
        enemy->hide = TRUE;
    } else {
        enemy->hide = FALSE;
        col = enemy->worldCol - hOff;
    }

    if (enemy->hide) {
        shadowOAM[shadowOAMCount].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[shadowOAMCount].attr0 = row | ATTR0_SQUARE;
        shadowOAM[shadowOAMCount].attr1 = col | ATTR1_TINY;
        shadowOAM[shadowOAMCount].attr2 = ATTR2_PALROW(GHOSTPALROW) | ATTR2_TILEID(0, GHOSTROW + enemy->curFrame);
    }

    shadowOAMCount++;  
}