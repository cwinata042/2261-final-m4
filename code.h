#define MAXDIGITS 5

typedef struct codePuzzle {
    int solution[MAXDIGITS];
    int currCode[MAXDIGITS];
    int length;
    int currDigit;      // Which digit the player is editing
} CODEPUZZLE;

#define CODEROW 52        // Where on the screen (row) the digits should be

#define CODECOL 54    // Where on the screen (col) the digits start at
#define CODESPACING 32      // How many pixels apart each digit is
#define FINDDIGITCOL(x) (CODECOL + x * CODESPACING)

// Index of empty tile and cursor tile
#define EMPTYTILE 0x1004
#define CURSORTILE 0x1005

// Finds the col and row of a digit's cursor TILE
#define CURSORROW 4
#define CURSORCOL 6
#define CURSORSPACING 4
#define FINDCURSORCOL(x) (CURSORCOL + x * CURSORSPACING)

// Variables
extern CODEPUZZLE codepuzzle1;
extern int codePuzzles[CODEPUZZLECOUNT];

// Prototypes
void showCodeScreen();
void initCodePuzzle();
void initCodePuzzle1();
void updateCode();
void drawCode();
void updateCurose(int old, int new);
int checkSolution();