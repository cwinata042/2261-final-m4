#include "mode0.h"
#include "game.h"
#include "collision.h"
#include "code.h"

// Combines box, door, and wall collision checks into one
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
        // Left, Right, Up, Down
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
            wall = FALSE;
            break;
    }

    return (wall == WALLCLR || wall == LOCKERCLR) || door != -1 || box != -1;
}

// Finds which key the player has interacted with.
// Returns -1 if there is no key
// or the index of the key if there is.
int keyCollision(int col, int row, int width, int height, int direction) {
    for (int i = 0; i < KEYCOUNT; i++) {
        // Checks in front of the player based on their current direction
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

// Finds which door the player is at
int doorCollision(int col, int row, int width, int height) {
    for (int i = 0; i < DOORCOUNT; i++) {
        if (collision(doorLocations[2 * i], doorLocations[2 * i + 1], doorWidth, doorHeight, col, row, width, height)) {
            return i;
        }
    }
    return -1;
}

// Finds which note the player is looking at
int noteCollision(int col, int row, int width, int height, int direction, int* locations, int size) {
    for (int i = 0; i < size; i++) {
        switch (direction) {
            case 0:
                if (collision(locations[2 * i], locations[2 * i + 1], NOTEWIDTH, NOTEHEIGHT, col - 1, row, width, height)) {
                    return i;
                }
                break;
            case 1:
                if (collision(locations[2 * i], locations[2 * i + 1], NOTEWIDTH, NOTEHEIGHT, col + 1, row, width, height)) {
                    return i;
                }
                break;
            case 2:
                if (collision(locations[2 * i], locations[2 * i + 1], NOTEWIDTH, NOTEHEIGHT, col, row - 1, width, height)) {
                    return i;
                }
                break;
            case 3:
                if (collision(locations[2 * i], locations[2 * i + 1], NOTEWIDTH, NOTEHEIGHT, col, row + 1, width, height)) {
                    return i;
                }
                break;
            default:
                break;
        }
    }
    return -1;
}

// Checks if the player is next to an unsolved code puzzle
// based on their current map
int codePuzzleCollision(int col, int row, int width, int height, int playerDirection) {
    int rdel, cdel;
    switch (playerDirection) {
        case LEFT:
            cdel = -1;
            rdel = 0;
            break;
        case RIGHT:
            cdel = 1;
            rdel = 0;
            break;
        case UP:
            cdel = 0;
            rdel = -1;
            break;
        case DOWN:
            cdel = 0;
            rdel = 1;
            break;
    }

    switch (currMap) {
        case CLASSROOMA:
            return !codePuzzles[0] && collision(codePuzzleLocations[0], codePuzzleLocations[1], 16, 16, col + cdel, row + rdel, width, height);
            break;
    }

    return FALSE;
}

// Finds which locked door the player has interacted with.
// Returns -1 if there is no locked door
// or the index of the locked door if there is
int lockedDoorCollision(int col, int row, int width, int height, int direction) {
    for (int i = 0; i < DOORCOUNT; i++) {
        // Checks in front of the player based on their current direction
        switch (direction) {
            case LEFT:
                if (collision(doorLocations[2 * i], doorLocations[2 * i + 1], doorWidth, doorHeight, col - 1, row, width, height) && !doors[i].unlocked) {
                    return i;
                }
                break;
            case RIGHT:
                if (collision(doorLocations[2 * i], doorLocations[2 * i + 1], doorWidth, doorHeight, col + 1, row, width, height) && !doors[i].unlocked) {
                    return i;
                }
                break;
            case UP:
                if (collision(doorLocations[2 * i], doorLocations[2 * i + 1], doorWidth, doorHeight, col, row - 1, width, height) && !doors[i].unlocked) {
                    return i;
                }
                break;
            case DOWN:
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

// Finds which box the player has interacted with.
// Returns -1 if there is no box
// or the index of the box if there is
int boxCollision(BOX* boxes, int count, int col, int row, int width, int height, int direction) {
    for (int i = 0; i < count; i++) {
        // Checks in front of the player based on their current direction
        switch (direction) {
            case LEFT:
                if (collision(boxes[i].boxSprite.worldCol, boxes[i].boxSprite.worldRow, boxes[i].boxSprite.width, boxes[i].boxSprite.height, col - 1, row, width, height)) {
                    return i;
                }
                break;
            case RIGHT:
                if (collision(boxes[i].boxSprite.worldCol, boxes[i].boxSprite.worldRow, boxes[i].boxSprite.width, boxes[i].boxSprite.height, col + 1, row, width, height)) {
                    return i;
                }
                break;
            case UP:
                if (collision(boxes[i].boxSprite.worldCol, boxes[i].boxSprite.worldRow, boxes[i].boxSprite.width, boxes[i].boxSprite.height, col, row - 1, width, height)) {
                    return i;
                }
                break;
            case DOWN:
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

// Checks if the box will collide with a wall
// or another box within the puzzle.
// Skips over the current box being checked
// since it would always return TRUE.
int checkBoxCollision(BOX* box, BOX* boxPuzzle, int currBox, int i) {
    int wall;

    // Checks if the box will be pushed outside of the screen
    int left = (box->boxSprite.worldCol == 0 && box->pushDirection == LEFT);
    int right = (box->boxSprite.worldCol == (MAPWIDTH - BOXWIDTH) && box->pushDirection == RIGHT);

    // Checks for collision between boxes within the puzzle
    SPRITE temp = box->boxSprite;
    for (int count = 0; count < i; count++) {
        SPRITE temp1 = boxPuzzle[count].boxSprite;

        if (count != currBox && collision(temp.worldCol + temp.cdel, temp.worldRow + temp.rdel, temp.width, temp.height, temp1.worldCol, temp1.worldRow, temp1.width, temp1.height)) {
            return TRUE;
        }
    }

    wall = checkCollision(temp.worldCol, temp.worldRow, BOXWIDTH, BOXHEIGHT, temp.cdel, temp.rdel);

    return (wall == WALLCLR || wall == LOCKERCLR) || left || right;
}

// Checks collision based on collision map
int checkCollision(int col, int row, int width, int height, int colShift, int rowShift) {
    int smallestSoFar = 256;
    int current;

    // Checks bottom and top
    for (int i = 0; i < width; i++) {
        current = collisionMap[OFFSET(col + i + colShift, row + height + rowShift - 1, MAPWIDTH)];

        if (current < smallestSoFar) {
            smallestSoFar = current;
        }

        current = collisionMap[OFFSET(col + i + colShift, row + rowShift, MAPWIDTH)];

        if (current < smallestSoFar) {
            smallestSoFar = current;
        }
    }
    
    // Checks left and right
    for (int i = 0; i < height; i++) {
        current = collisionMap[OFFSET(col + colShift, row + i, MAPWIDTH)];

        if (current < smallestSoFar) {
            smallestSoFar = current;
        }

        current = collisionMap[OFFSET(col + width + colShift - 1, row + i, MAPWIDTH)];

        if (current < smallestSoFar) {
            smallestSoFar = current;
        }
    }
    
    return smallestSoFar;
}

// Temporary collision methods for lose/win condition
// Returns whether or not player touches red tile
int loseCollision(int col, int row, int width, int height) {
    int bottomLeft = FALSE;
    int bottomRight = FALSE;
    int topLeft = FALSE;
    int topRight = FALSE;
    int current;

    
    // Checks bottom left corner
    current = collisionMap[OFFSET(col, row + height - 1, MAPWIDTH)];
    if (current == LOSECLR) {
        bottomLeft = TRUE;
    }

    // Checks bottom right corner
    current = collisionMap[OFFSET(col + width - 1, row + height - 1, MAPWIDTH)];
    if (current == LOSECLR) {
        bottomRight = TRUE;
    }

    // Checks top left corner
    current = collisionMap[OFFSET(col, row, MAPWIDTH)];
    if (current == LOSECLR) {
        topLeft = TRUE;
    }

    // Checks top right corner
    current = collisionMap[OFFSET(col + width - 1, row, MAPWIDTH)];
    if (current == LOSECLR) {
        topRight = TRUE;
    }

    return bottomLeft || bottomRight || topLeft || topRight;
}

// Returns whether or not player touches green tile
int winCollision(int col, int row, int width, int height) {
    int bottomLeft = FALSE;
    int bottomRight = FALSE;
    int topLeft = FALSE;
    int topRight = FALSE;
    int current;

    
    // Checks bottom left corner
    current = collisionMap[OFFSET(col, row + height - 1, MAPWIDTH)];
    if (current == WINCLR) {
        bottomLeft = TRUE;
    }

    // Checks bottom right corner
    current = collisionMap[OFFSET(col + width - 1, row + height - 1, MAPWIDTH)];
    if (current == WINCLR) {
        bottomRight = TRUE;
    }

    // Checks top left corner
    current = collisionMap[OFFSET(col, row, MAPWIDTH)];
    if (current == WINCLR) {
        topLeft = TRUE;
    }

    // Checks top right corner
    current = collisionMap[OFFSET(col + width - 1, row, MAPWIDTH)];
    if (current == WINCLR) {
        topRight = TRUE;
    }

    return heldKeys[2] && (bottomLeft || bottomRight || topLeft || topRight);
}