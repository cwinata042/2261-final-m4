#include "mode0.h"
#include "dialogueLines.h"
#include "game.h"
#include "code.h"
#include "dialogue.h"

#include "codeInputBox.h"

CODEPUZZLE codePuzzle1;
CODEPUZZLE* currCodePuzzle;

// Keeps track of which puzzles have been solved
int codePuzzles[] = {
    FALSE
};

// Displays the code input screen
void showCodeScreen() {
    REG_DISPCTL |= BG0_ENABLE;
    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(2) | BG_SCREENBLOCK(29);

    DMANow(3, codeInputBoxTiles, &CHARBLOCK[2], codeInputBoxTilesLen / 2);
    DMANow(3, codeInputBoxMap, &SCREENBLOCK[29], codeInputBoxMapLen / 2);

    hideSprites();
}

void hideCodeScreen() {
    REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE;
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
    if (BUTTON_PRESSED(BUTTON_LEFT)) {
        currCodePuzzle->currDigit--;

        if (currCodePuzzle->currDigit == -1) {
            currCodePuzzle->currDigit = currCodePuzzle->length - 1;
            updateCursor(0, currCodePuzzle->currDigit);
        } else {
            updateCursor(currCodePuzzle->currDigit + 1, currCodePuzzle->currDigit);
        }
        
    } else if (BUTTON_PRESSED(BUTTON_RIGHT)) {
        currCodePuzzle->currDigit++;

        if (currCodePuzzle->currDigit == currCodePuzzle->length) {
            currCodePuzzle->currDigit = 0;
            updateCursor(currCodePuzzle->length - 1, currCodePuzzle->currDigit);
        } else {
            updateCursor(currCodePuzzle->currDigit - 1, currCodePuzzle->currDigit);
        }
    } else if (BUTTON_PRESSED(BUTTON_UP)) {
        currCodePuzzle->currCode[currCodePuzzle->currDigit]++;

        if (currCodePuzzle->currCode[currCodePuzzle->currDigit] == 10) {
            currCodePuzzle->currCode[currCodePuzzle->currDigit] = 0;
        } 
    } else if (BUTTON_PRESSED(BUTTON_DOWN)) {
        currCodePuzzle->currCode[currCodePuzzle->currDigit]--;

        if (currCodePuzzle->currCode[currCodePuzzle->currDigit] == -1) {
            currCodePuzzle->currCode[currCodePuzzle->currDigit] = 9;
        } 
    }

    // Inputs current code
    if (BUTTON_PRESSED(BUTTON_A)) {
        if (checkSolution()) {
            hideCodeScreen();
            hideSprites();
            showCode = FALSE;

            if (currMap == CLASSROOMA) {
                codePuzzles[0] = TRUE;
                updateHeldKey(1);
            }

            prevShowDialogue = FALSE;
            showDialogue = TRUE;
            initDialogue(codePuzzle1D, 2);
        }
    }

    // Closes code screen
    if (BUTTON_PRESSED(BUTTON_B)) {
        hideCodeScreen();
        hideSprites();
        showCode = FALSE;
    }
}

// Moves the cursor from the old digit to the new digit
void updateCursor(int old, int new) {
    int oldCursorCol = FINDCURSORCOL(old);
    int oldCursorRow = CURSORROW;
    int newCursorCol = FINDCURSORCOL(new);
    int newCursorRow = CURSORROW;

    // Removes old cursor
    SCREENBLOCK[29].tilemap[OFFSET(oldCursorCol, oldCursorRow, 32)] = EMPTYTILE;
    SCREENBLOCK[29].tilemap[OFFSET(oldCursorCol + 1, oldCursorRow, 32)] = EMPTYTILE;

    // Draws new cursor
    SCREENBLOCK[29].tilemap[OFFSET(newCursorCol, newCursorRow, 32)] = CURSORTILE;
    SCREENBLOCK[29].tilemap[OFFSET(newCursorCol + 1, newCursorRow, 32)] = CURSORTILE;
}

// Returns if the current code matches the solution
int checkSolution() {
    for (int i = 0; i < currCodePuzzle->length; i++) {
        if (currCodePuzzle->currCode[i] != currCodePuzzle->solution[i]) {
            return FALSE;
        }
    }

    return TRUE;
}

void drawCode() {
    for (int i = 0; i < currCodePuzzle->length; i++) {
        int col = currCodePuzzle->currCode[i];
        
        shadowOAM[shadowOAMCount].attr0 = CODEROW | ATTR0_SQUARE;
        shadowOAM[shadowOAMCount].attr1 = FINDDIGITCOL(i) | ATTR1_TINY;
        shadowOAM[shadowOAMCount].attr2 = ATTR2_PALROW(NUMPALROW) | ATTR2_TILEID(col, NUMROW);

        shadowOAMCount++;
    }
}