# 1 "collision.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "collision.c"
# 1 "mode0.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 62 "mode0.h"
extern volatile unsigned short *videoBuffer;
# 83 "mode0.h"
typedef struct {
    u16 tileimg[8192];
} charblock;


typedef struct {
    u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();


typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
void clearShadowOAM();
# 153 "mode0.h"
void hideSprites();






typedef struct {
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} SPRITE;
# 191 "mode0.h"
extern unsigned short oldButtons;
extern unsigned short buttons;






typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 239 "mode0.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);


int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "collision.c" 2
# 1 "game.h" 1
typedef struct door {
    int col, row;
    int unlocked;
    int width, height;
} DOOR;

typedef struct box {
    SPRITE boxSprite;
    int beingPushed;
    int maxPush;
    int currPush;
    int pushDirection;
} BOX;



typedef struct boxPuzzle {
    BOX boxes[10];
    int totalBoxes;
    int solCol, solRow;
    int solved;
} BOXPUZZLE;
# 117 "game.h"
extern unsigned int health;
extern int hOff;
extern int vOff;

extern int heldKeys[3];
extern int keyLocations[3 * 2];

extern int doorLocations[2 * 2];
extern int doorWidth;
extern int doorHeight;

extern int codePuzzleLocations[1 * 2];

extern int shadowOAMCount;
extern unsigned char* collisionMap;

extern int currMapWidth;
extern int currMapHeight;
extern int currMap;
extern int prevMap;

extern int showDialogue;
extern int prevShowDialogue;

extern int showCode;
extern int prevShowCode;

extern SPRITE player;
extern SPRITE enemiesMain[5];
extern SPRITE keys[3];
extern DOOR doors[2];
extern BOXPUZZLE boxPuzzle1;
extern BOXPUZZLE boxPuzzle2;
extern BOXPUZZLE boxPuzzle3;
extern BOXPUZZLE boxPuzzle4;
extern BOXPUZZLE* currBoxPuzzle;



enum {MAIN, CLASSROOMA, STORAGEROOM, RESTROOM};


void initGame();
void updateGame();
void drawGame();

void initPlayer();
void updatePlayer();
void drawPlayer();
int checkPlayerCollision(int direction);
void moveMap(int i);

void initHeldKeys();
void updateHeldKey(int k);
void initKeys();
void updateKey(SPRITE* key);
void drawKey(SPRITE* key);

void initDoors();

void initBoxPuzzles();
void initBoxPuzzle1();
void updateBox(BOX* box, BOX* boxPuzzle, int currBox, int i);
void drawBox(SPRITE* box);
void drawBoxPuzzles();
void drawBoxPuzzle1();
# 3 "collision.c" 2
# 1 "collision.h" 1

int checkPlayerCollision(int direction);
int keyCollision(int col, int row, int width, int height, int direction);
int lockedDoorCollision(int col, int row, int width, int height, int direction);
int codePuzzleCollision(int col, int row, int width, int height, int playerDirection);
int boxCollision(BOX* boxes, int count, int col, int row, int width, int height, int direction);
int checkBoxCollision(BOX* box, BOX* boxPuzzle, int currBox, int i);
int checkCollision(int col, int row, int width, int height, int colShift, int rowShift);
int doorCollision(int col, int row, int width, int height);

int loseCollision(int col, int row, int width, int height);
int winCollision(int col, int row, int width, int height);
# 4 "collision.c" 2
# 1 "code.h" 1


typedef struct codePuzzle {
    int solution[5];
    int currCode[5];
    int length;
    int currDigit;
} CODEPUZZLE;
# 27 "code.h"
extern CODEPUZZLE codepuzzle1;
extern int codePuzzles[1];


void showCodeScreen();
void initCodePuzzle();
void initCodePuzzle1();
void updateCode();
void drawCode();
void updateCurose(int old, int new);
int checkSolution();
# 5 "collision.c" 2


int checkPlayerCollision(int direction) {
    int wall;
    int door = lockedDoorCollision(player.worldCol, player.worldRow, player.width, player.height, direction);
    int box;

    switch (currMap) {
        case STORAGEROOM:
            box = boxCollision(currBoxPuzzle->boxes, currBoxPuzzle->totalBoxes, player.worldCol, player.worldRow, player.width, player.height, direction);
            break;
        default:
            box = -1;
            break;
    }

    switch (direction) {

        case 0:
            wall = checkCollision(player.worldCol, player.worldRow, player.width, player.height, player.cdel * -1, 0);
            break;
        case 1:
            wall = checkCollision(player.worldCol, player.worldRow, player.width, player.height, player.cdel, 0);
            break;
        case 2:
            wall = checkCollision(player.worldCol, player.worldRow, player.width, player.height, 0, player.rdel * -1);
            break;
        case 3:
            wall = checkCollision(player.worldCol, player.worldRow, player.width, player.height, 0, player.rdel);
            break;
        default:
            wall = 0;
            break;
    }

    return (wall == 0 || wall == 2) || door != -1 || box != -1;
}




int keyCollision(int col, int row, int width, int height, int direction) {
    for (int i = 0; i < 3; i++) {

        switch (direction) {
            case 0:
                if (collision(keyLocations[2 * i], keyLocations[2 * i + 1], keys[i].width, keys[i].height, col - 1, row, width, height)) {
                    return i;
                }
                break;
            case 1:
                if (collision(keyLocations[2 * i], keyLocations[2 * i + 1], keys[i].width, keys[i].height, col + 1, row, width, height)) {
                    return i;
                }
                break;
            case 2:
                if (collision(keyLocations[2 * i], keyLocations[2 * i + 1], keys[i].width, keys[i].height, col, row - 1, width, height)) {
                    return i;
                }
                break;
            case 3:
                if (collision(keyLocations[2 * i], keyLocations[2 * i + 1], keys[i].width, keys[i].height, col, row + 1, width, height)) {
                    return i;
                }
                break;
            default:
                break;
        }
    }

    return -1;
}


int doorCollision(int col, int row, int width, int height) {
    for (int i = 0; i < 2; i++) {
        if (collision(doorLocations[2 * i], doorLocations[2 * i + 1], doorWidth, doorHeight, col, row, width, height)) {
            return i;
        }
    }
    return -1;
}


int noteCollision(int col, int row, int width, int height, int direction, int* locations, int size) {
    for (int i = 0; i < size; i++) {
        switch (direction) {
            case 0:
                if (collision(locations[2 * i], locations[2 * i + 1], 6, 8, col - 1, row, width, height)) {
                    return i;
                }
                break;
            case 1:
                if (collision(locations[2 * i], locations[2 * i + 1], 6, 8, col + 1, row, width, height)) {
                    return i;
                }
                break;
            case 2:
                if (collision(locations[2 * i], locations[2 * i + 1], 6, 8, col, row - 1, width, height)) {
                    return i;
                }
                break;
            case 3:
                if (collision(locations[2 * i], locations[2 * i + 1], 6, 8, col, row + 1, width, height)) {
                    return i;
                }
                break;
            default:
                break;
        }
    }
    return -1;
}



int codePuzzleCollision(int col, int row, int width, int height, int playerDirection) {
    int rdel, cdel;
    switch (playerDirection) {
        case 0:
            cdel = -1;
            rdel = 0;
            break;
        case 1:
            cdel = 1;
            rdel = 0;
            break;
        case 2:
            cdel = 0;
            rdel = -1;
            break;
        case 3:
            cdel = 0;
            rdel = 1;
            break;
    }

    switch (currMap) {
        case CLASSROOMA:
            return !codePuzzles[0] && collision(codePuzzleLocations[0], codePuzzleLocations[1], 16, 16, col + cdel, row + rdel, width, height);
            break;
    }

    return 0;
}




int lockedDoorCollision(int col, int row, int width, int height, int direction) {
    for (int i = 0; i < 2; i++) {

        switch (direction) {
            case 0:
                if (collision(doorLocations[2 * i], doorLocations[2 * i + 1], doorWidth, doorHeight, col - 1, row, width, height) && !doors[i].unlocked) {
                    return i;
                }
                break;
            case 1:
                if (collision(doorLocations[2 * i], doorLocations[2 * i + 1], doorWidth, doorHeight, col + 1, row, width, height) && !doors[i].unlocked) {
                    return i;
                }
                break;
            case 2:
                if (collision(doorLocations[2 * i], doorLocations[2 * i + 1], doorWidth, doorHeight, col, row - 1, width, height) && !doors[i].unlocked) {
                    return i;
                }
                break;
            case 3:
                if (collision(doorLocations[2 * i], doorLocations[2 * i + 1], doorWidth, doorHeight, col, row + 1, width, height) && !doors[i].unlocked) {
                    return i;
                }
                break;
            default:
                return -1;
        }
    }

    return -1;
}




int boxCollision(BOX* boxes, int count, int col, int row, int width, int height, int direction) {
    for (int i = 0; i < count; i++) {

        switch (direction) {
            case 0:
                if (collision(boxes[i].boxSprite.worldCol, boxes[i].boxSprite.worldRow, boxes[i].boxSprite.width, boxes[i].boxSprite.height, col - 1, row, width, height)) {
                    return i;
                }
                break;
            case 1:
                if (collision(boxes[i].boxSprite.worldCol, boxes[i].boxSprite.worldRow, boxes[i].boxSprite.width, boxes[i].boxSprite.height, col + 1, row, width, height)) {
                    return i;
                }
                break;
            case 2:
                if (collision(boxes[i].boxSprite.worldCol, boxes[i].boxSprite.worldRow, boxes[i].boxSprite.width, boxes[i].boxSprite.height, col, row - 1, width, height)) {
                    return i;
                }
                break;
            case 3:
                if (collision(boxes[i].boxSprite.worldCol, boxes[i].boxSprite.worldRow, boxes[i].boxSprite.width, boxes[i].boxSprite.height, col, row + 1, width, height)) {
                    return i;
                }
                break;
            default:
                break;
        }
    }

    return -1;
}





int checkBoxCollision(BOX* box, BOX* boxPuzzle, int currBox, int i) {
    int wall;


    int left = (box->boxSprite.worldCol == 0 && box->pushDirection == 0);
    int right = (box->boxSprite.worldCol == (256 - 16) && box->pushDirection == 1);


    SPRITE temp = box->boxSprite;
    for (int count = 0; count < i; count++) {
        SPRITE temp1 = boxPuzzle[count].boxSprite;

        if (count != currBox && collision(temp.worldCol + temp.cdel, temp.worldRow + temp.rdel, temp.width, temp.height, temp1.worldCol, temp1.worldRow, temp1.width, temp1.height)) {
            return 1;
        }
    }

    wall = checkCollision(temp.worldCol, temp.worldRow, 16, 16, temp.cdel, temp.rdel);

    return (wall == 0 || wall == 2) || left || right;
}


int checkCollision(int col, int row, int width, int height, int colShift, int rowShift) {
    int smallestSoFar = 256;
    int current;


    for (int i = 0; i < width; i++) {
        current = collisionMap[((row + height + rowShift - 1) * (256) + (col + i + colShift))];

        if (current < smallestSoFar) {
            smallestSoFar = current;
        }

        current = collisionMap[((row + rowShift) * (256) + (col + i + colShift))];

        if (current < smallestSoFar) {
            smallestSoFar = current;
        }
    }


    for (int i = 0; i < height; i++) {
        current = collisionMap[((row + i) * (256) + (col + colShift))];

        if (current < smallestSoFar) {
            smallestSoFar = current;
        }

        current = collisionMap[((row + i) * (256) + (col + width + colShift - 1))];

        if (current < smallestSoFar) {
            smallestSoFar = current;
        }
    }

    return smallestSoFar;
}



int loseCollision(int col, int row, int width, int height) {
    int bottomLeft = 0;
    int bottomRight = 0;
    int topLeft = 0;
    int topRight = 0;
    int current;



    current = collisionMap[((row + height - 1) * (256) + (col))];
    if (current == 9) {
        bottomLeft = 1;
    }


    current = collisionMap[((row + height - 1) * (256) + (col + width - 1))];
    if (current == 9) {
        bottomRight = 1;
    }


    current = collisionMap[((row) * (256) + (col))];
    if (current == 9) {
        topLeft = 1;
    }


    current = collisionMap[((row) * (256) + (col + width - 1))];
    if (current == 9) {
        topRight = 1;
    }

    return bottomLeft || bottomRight || topLeft || topRight;
}


int winCollision(int col, int row, int width, int height) {
    int bottomLeft = 0;
    int bottomRight = 0;
    int topLeft = 0;
    int topRight = 0;
    int current;



    current = collisionMap[((row + height - 1) * (256) + (col))];
    if (current == 9) {
        bottomLeft = 1;
    }


    current = collisionMap[((row + height - 1) * (256) + (col + width - 1))];
    if (current == 9) {
        bottomRight = 1;
    }


    current = collisionMap[((row) * (256) + (col))];
    if (current == 9) {
        topLeft = 1;
    }


    current = collisionMap[((row) * (256) + (col + width - 1))];
    if (current == 9) {
        topRight = 1;
    }

    return heldKeys[2] && (bottomLeft || bottomRight || topLeft || topRight);
}
