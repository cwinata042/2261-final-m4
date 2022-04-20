#define MAXDIALOGUELINES 3
#define MAXLETTERS 130

typedef struct dialogue {
    char** text[MAXLETTERS];
    int numLines;
    int currLine;
} DIALOGUE;

// Constants
#define DIALOGUESTARTCOL 16
#define DIALOGUESTARTROW 110
#define CHARWIDTH 5
#define CHARHEIGHT 8
#define SPACEWIDTH 3
#define KERNING 1
#define PUNCTROW 17
#define LETTERROWSTART 13

// Macros
#define LETTERCOL(c) ((c - 65) % 32)
#define LETTERROW(c) ((c / 97) + LETTERROWSTART)

// Prototypes
void drawDialogueText(char* text, int length);
void drawDialogueBox();
void hideDialogueBox();
void drawLetter(char c);
void initDialogue(char** text, int numLines);
void updateDialogue();
void drawDialogue();