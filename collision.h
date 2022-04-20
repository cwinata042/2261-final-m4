// Prototypes
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