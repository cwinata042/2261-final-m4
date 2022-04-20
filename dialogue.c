#include "mode0.h"
#include "game.h"
#include "dialogue.h"
#include "dialogueBox.h"
#include "code.h"
#include <string.h>

// Current dialogue line to be displayed
char* currDialogueLine;
// Current dialogue to be displayed
char** currDialogue;
int currLine;
int prevLine;
int startDialogue;
int totalLines;

int prevCol;

// Width of each character sprite, upper case then lower case
int charWidths[] = {
    5, 4, 4, 4, 4, 4, 5, 4, 3, 4, 4, 4, 5, 5, 4, 4, 5, 4, 4, 3, 4, 5, 5, 5, 5, 4,
    5, 4, 4, 4, 4, 3, 4, 4, 1, 3, 3, 1, 5, 4, 4, 4, 4, 4, 5, 3, 4, 5, 5, 5, 5, 4
};

// Width of each punctuation/special characters
int punctWidths[] = {
    1, 2, 5, 5, 7, 6, 1, 2, 2, 5, 5, 2, 3, 1, 5,
    1, 1, 4, 4, 4, 5, 7,
    2, 5, 2, 3, 3, 3,
    4, 1, 4, 5
};

void initDialogue(char** lines, int numLines) {
    drawDialogueBox();

    currDialogue = lines;
    currLine = 0;
    prevLine = 0;
    startDialogue = TRUE;
    totalLines = numLines;

    currDialogueLine = currDialogue[currLine];
}

void updateDialogue() {
    // Moves to next line
    if (BUTTON_PRESSED(BUTTON_A)) {
        if (currLine == totalLines - 1) {
            showDialogue = FALSE;
            hideDialogueBox();
        } else {
            prevLine = currLine;
            currLine++;
            currDialogueLine = currDialogue[currLine];
        }
    }
}

void drawDialogue() {
    if (startDialogue || currLine != prevLine) {
        startDialogue = FALSE;
        hideSprites();
        drawDialogueText(currDialogueLine, strlen(currDialogueLine));
        prevLine = currLine;
    }
}

// Draws the box onto a separate background to hold the dialogue
void drawDialogueBox() {
    REG_DISPCTL |= BG0_ENABLE;
    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(30);

    DMANow(3, dialogueBoxTiles, &CHARBLOCK[1], dialogueBoxTilesLen / 2);
    DMANow(3, dialogueBoxMap, &SCREENBLOCK[30], dialogueBoxMapLen / 2);

    hideSprites();
}

// Hides the dialogue box by deactivating the background
void hideDialogueBox() {
    REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE;
    hideSprites();
}

// Draws the dialogue text
void drawDialogueText(char* text, int length) {
    prevCol = 0;
    for (int i = 0; i < length; i++) {
        if (text[i] != 32) {
            drawLetter(text[i]);
        } else {
            prevCol += SPACEWIDTH;
        }
    }
}

// Handles hanging letters with descenders (g, j, p, q, and y)
// Handles letters to have the same gaps between them no matter their width
// Handles punctuation
void drawLetter(char c) {
    // Finds the width of the current char
    int width;
    int isLetter = FALSE;
    int isNumber = FALSE;

    // Uppercase letters, lowercase letters
    if (c > 64 && c < 91) {
        isLetter = TRUE;
        width = charWidths[c - 65];
    } else if (c > 96 && c < 123) {
        isLetter = TRUE;
        width = charWidths[c - 71];
    } else if (c > 47 && c < 58) {
        isNumber = TRUE;
        if (c == 49) {
            width = 1;
        } else {
            width = 4;
        }
    } else {
        if (c > 32 && c < 48) {
            width = punctWidths[c - 33];
        } else if (c > 57 && c < 65) {
            width = punctWidths[c - 43];
        } else if (c > 90 && c < 97) {
            width = punctWidths[c - 69];
        } else {
            width = punctWidths[c - 95];
        }
    }

    int col, row;
    if (isLetter) {
        col = LETTERCOL(c);
        row = LETTERROW(c);
    } else if (isNumber) {
        col = c - 48;
        row = NUMROW;
    } else {
        col = findPunctCol(c);
        row = PUNCTROW;
    }

    shadowOAM[shadowOAMCount].attr0 = (DIALOGUESTARTROW) | ATTR0_SQUARE;
    shadowOAM[shadowOAMCount].attr1 = (DIALOGUESTARTCOL + prevCol) | ATTR1_TINY;
    shadowOAM[shadowOAMCount].attr2 = ATTR2_PALROW(LETTERPALROW) | ATTR2_TILEID(col, row);
    
    shadowOAMCount++;

    // Letters/Punctuation with descenders (g, j, p, q, y, and comma)
    if (c == 103 || c == 106 || c == 112 || c == 113 || c == 121 || c == 44) {
        shadowOAM[shadowOAMCount].attr0 = (DIALOGUESTARTROW + CHARHEIGHT) | ATTR0_SQUARE;
        shadowOAM[shadowOAMCount].attr1 = (DIALOGUESTARTCOL + prevCol) | ATTR1_TINY;
        shadowOAM[shadowOAMCount].attr2 = ATTR2_PALROW(LETTERPALROW) | ATTR2_TILEID(col, row + 1);

        shadowOAMCount++;
    }

    prevCol += (width + KERNING);
}

// Finds the column of punctuation w/ASCII value c in the spritesheet
int findPunctCol(int c) {
    if (c > 122) {
        return c - 95;
    } else if (c > 90) {
        return c - 69;
    } else if (c > 57) {
        return c - 43;
    } else {
        return c - 33;
    }
}