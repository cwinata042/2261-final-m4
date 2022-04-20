# 1 "code.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "code.c"
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
# 2 "code.c" 2
# 1 "dialogueLines.h" 1


extern char* notesMain1D[7];
extern char* newspaper1D[3];



extern char* classroomAKeyD[4];
extern char* entranceKeyD[3];



extern char* classroomADoorD[2];
extern char* storageRoomDoorD[2];


extern char* classroomADoorLD[2];
extern char* storageRoomDoorLD[2];


extern char* codePuzzle1D[2];
# 3 "code.c" 2
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
# 4 "code.c" 2
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
# 5 "code.c" 2
# 1 "dialogue.h" 1



typedef struct dialogue {
    char** text[130];
    int numLines;
    int currLine;
} DIALOGUE;
# 25 "dialogue.h"
void drawDialogueText(char* text, int length);
void drawDialogueBox();
void hideDialogueBox();
void drawLetter(char c);
void initDialogue(char** text, int numLines);
void updateDialogue();
void drawDialogue();
# 6 "code.c" 2

# 1 "codeInputBox.h" 1
# 22 "codeInputBox.h"
extern const unsigned short codeInputBoxTiles[144];


extern const unsigned short codeInputBoxMap[1024];


extern const unsigned short codeInputBoxPal[256];
# 8 "code.c" 2

CODEPUZZLE codePuzzle1;
CODEPUZZLE* currCodePuzzle;


int codePuzzles[] = {
    0
};


void showCodeScreen() {
    (*(volatile unsigned short *)0x4000000) |= (1 << 8);
    (*(volatile unsigned short *)0x4000008) = (0 << 7) | (0 << 14) | ((2) << 2) | ((29) << 8);

    DMANow(3, codeInputBoxTiles, &((charblock *)0x6000000)[2], 288 / 2);
    DMANow(3, codeInputBoxMap, &((screenblock *)0x6000000)[29], 2048 / 2);

    hideSprites();
}

void hideCodeScreen() {
    (*(volatile unsigned short *)0x4000000) = 0 | (1 << 9) | (1 << 12);
}

void initCodePuzzle() {
    showCodeScreen();

    switch (currMap) {
        case CLASSROOMA:
            if (!codePuzzles[0]) {
                initCodePuzzle1();
                currCodePuzzle = &codePuzzle1;
            }

            break;
    }
}

void initCodePuzzle1() {
    codePuzzle1.length = 5;

    for (int i = 0; i < codePuzzle1.length; i++) {
        codePuzzle1.currCode[i] = 0;
    }

    codePuzzle1.currDigit = 0;
    codePuzzle1.solution[0] = 6;
    codePuzzle1.solution[1] = 2;
    codePuzzle1.solution[2] = 3;
    codePuzzle1.solution[3] = 8;
    codePuzzle1.solution[4] = 0;
}

void updateCode() {
    if ((!(~(oldButtons) & ((1 << 5))) && (~buttons & ((1 << 5))))) {
        currCodePuzzle->currDigit--;

        if (currCodePuzzle->currDigit == -1) {
            currCodePuzzle->currDigit = currCodePuzzle->length - 1;
            updateCursor(0, currCodePuzzle->currDigit);
        } else {
            updateCursor(currCodePuzzle->currDigit + 1, currCodePuzzle->currDigit);
        }

    } else if ((!(~(oldButtons) & ((1 << 4))) && (~buttons & ((1 << 4))))) {
        currCodePuzzle->currDigit++;

        if (currCodePuzzle->currDigit == currCodePuzzle->length) {
            currCodePuzzle->currDigit = 0;
            updateCursor(currCodePuzzle->length - 1, currCodePuzzle->currDigit);
        } else {
            updateCursor(currCodePuzzle->currDigit - 1, currCodePuzzle->currDigit);
        }
    } else if ((!(~(oldButtons) & ((1 << 6))) && (~buttons & ((1 << 6))))) {
        currCodePuzzle->currCode[currCodePuzzle->currDigit]++;

        if (currCodePuzzle->currCode[currCodePuzzle->currDigit] == 10) {
            currCodePuzzle->currCode[currCodePuzzle->currDigit] = 0;
        }
    } else if ((!(~(oldButtons) & ((1 << 7))) && (~buttons & ((1 << 7))))) {
        currCodePuzzle->currCode[currCodePuzzle->currDigit]--;

        if (currCodePuzzle->currCode[currCodePuzzle->currDigit] == -1) {
            currCodePuzzle->currCode[currCodePuzzle->currDigit] = 9;
        }
    }


    if ((!(~(oldButtons) & ((1 << 0))) && (~buttons & ((1 << 0))))) {
        if (checkSolution()) {
            hideCodeScreen();
            hideSprites();
            showCode = 0;

            if (currMap == CLASSROOMA) {
                codePuzzles[0] = 1;
                updateHeldKey(1);
            }

            prevShowDialogue = 0;
            showDialogue = 1;
            initDialogue(codePuzzle1D, 2);
        }
    }


    if ((!(~(oldButtons) & ((1 << 1))) && (~buttons & ((1 << 1))))) {
        hideCodeScreen();
        hideSprites();
        showCode = 0;
    }
}


void updateCursor(int old, int new) {
    int oldCursorCol = (6 + old * 4);
    int oldCursorRow = 4;
    int newCursorCol = (6 + new * 4);
    int newCursorRow = 4;


    ((screenblock *)0x6000000)[29].tilemap[((oldCursorRow) * (32) + (oldCursorCol))] = 0x1004;
    ((screenblock *)0x6000000)[29].tilemap[((oldCursorRow) * (32) + (oldCursorCol + 1))] = 0x1004;


    ((screenblock *)0x6000000)[29].tilemap[((newCursorRow) * (32) + (newCursorCol))] = 0x1005;
    ((screenblock *)0x6000000)[29].tilemap[((newCursorRow) * (32) + (newCursorCol + 1))] = 0x1005;
}


int checkSolution() {
    for (int i = 0; i < currCodePuzzle->length; i++) {
        if (currCodePuzzle->currCode[i] != currCodePuzzle->solution[i]) {
            return 0;
        }
    }

    return 1;
}

void drawCode() {
    for (int i = 0; i < currCodePuzzle->length; i++) {
        int col = currCodePuzzle->currCode[i];

        shadowOAM[shadowOAMCount].attr0 = 52 | (0 << 14);
        shadowOAM[shadowOAMCount].attr1 = (54 + i * 32) | (0 << 14);
        shadowOAM[shadowOAMCount].attr2 = ((5) << 12) | ((16)*32 + (col));

        shadowOAMCount++;
    }
}
