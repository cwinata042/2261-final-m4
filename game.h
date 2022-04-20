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

#define MAXBOXCOUNT 10

typedef struct boxPuzzle {
    BOX boxes[MAXBOXCOUNT];
    int totalBoxes;
    int solCol, solRow;     // Location of "solution" tile
    int solved;
} BOXPUZZLE;

// Game Constants
#define MAXPLAYERHEALTH 1000
#define ENEMYMAINCOUNT 5
#define ENEMYSTORAGECOUNT 2
#define KEYCOUNT 3
#define DOORCOUNT 2
#define BOXWIDTH 16
#define BOXHEIGHT 16
#define CODEPUZZLECOUNT 1

// Objects
#define MAINOBJCOUNT 3
#define CLASSOBJCOUNT 3
#define STORAGEOBJCOUNT 2

// Notes
#define NOTEMAINCOUNT 1
#define NOTECLASSCOUNT 2
#define NOTESTORAGECOUNT 1
#define NOTEWIDTH 6
#define NOTEHEIGHT 8

// Collision Map Colors
#define WALLCLR 0
#define DOORCLR 1
#define LOSECLR 9
#define WINCLR 9
#define LOCKERCLR 2
#define EMPTYCLR 3 

// Other Constants
#define TRUE 1
#define FALSE 0
#define MAPWIDTH 256
#define MAPHEIGHT 256
#define MAINMAPWIDTH 256
#define MAINMAPHEIGHT 256
#define CLASSMAPWIDTH 256
#define CLASSMAPHEIGHT 176
#define STORAGEMAPWIDTH 256
#define STORAGEMAPHEIGHT 256

// Direction Constands
#define LEFT 0
#define RIGHT 1
#define UP 2
#define DOWN 3

// Sprite Palette Rows
#define PLAYERPALROW 0
#define GHOSTPALROW 1
#define OBJECTPALROW 2
#define KEYPALROW 3
#define BOXPALROW 4
#define LETTERPALROW 5
#define NUMPALROW 5

// Sprite Locations (Tile)
#define GHOSTROW 6
#define OBJROW 9
#define KEYROW 10
#define BOXROW 11
#define NUMROW 16

// Spawn locations for Player/Screen
// Used for when switching maps
// Main Map to Storage Room
#define STORAGECOL 16
#define STORAGEROW 232
#define STORAGEVOFF 96
#define STORAGEHOFF 0

// Main Map to Classroom
#define CLASSCOL 31
#define CLASSROW 232
#define CLASSVOFF 96
#define CLASSHOFF 0

// All Rooms to Main Map
#define MAINSTORAGECOL 168
#define MAINSTORAGEROW 8
#define MAINSTORAGEVOFF 0
#define MAINSTORAGEHOFF 0 
#define MAINCLASSCOL 88
#define MAINCLASSROW 8
#define MAINCLASSVOFF 0
#define MAINCLASSHOFF 0
/*#define MAINRESTCOL
#define MAINRESTROW
#define MAINRESTVOFF
#define MAINRESTHOFF*/

// Variables
extern unsigned int health;
extern int hOff;
extern int vOff;

extern int heldKeys[KEYCOUNT];
extern int keyLocations[KEYCOUNT * 2];

extern int doorLocations[DOORCOUNT * 2];
extern int doorWidth;
extern int doorHeight;

extern int codePuzzleLocations[CODEPUZZLECOUNT * 2];

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
extern SPRITE enemiesMain[ENEMYMAINCOUNT];
extern SPRITE keys[KEYCOUNT];
extern DOOR doors[DOORCOUNT];
extern BOXPUZZLE boxPuzzle1;
extern BOXPUZZLE boxPuzzle2;
extern BOXPUZZLE boxPuzzle3;
extern BOXPUZZLE boxPuzzle4;
extern BOXPUZZLE* currBoxPuzzle;

// Enums
// Map locations
enum {MAIN, CLASSROOMA, STORAGEROOM, RESTROOM};

// Prototypes
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