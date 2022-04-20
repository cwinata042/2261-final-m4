# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
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
# 2 "game.c" 2
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
# 3 "game.c" 2
# 1 "print.h" 1
# 26 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 27 "print.h" 2
# 36 "print.h"

# 36 "print.h"
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
uint8_t mgba_open(void);
void mgba_close(void);
# 4 "game.c" 2
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
# 5 "game.c" 2
# 1 "collisionMap.h" 1
# 21 "collisionMap.h"
extern const unsigned short collisionMapBitmap[32768];


extern const unsigned short collisionMapPal[256];
# 6 "game.c" 2
# 1 "storageRoomCollision.h" 1
# 21 "storageRoomCollision.h"
extern const unsigned short storageRoomCollisionBitmap[32768];


extern const unsigned short storageRoomCollisionPal[256];
# 7 "game.c" 2
# 1 "classroomACollision.h" 1
# 21 "classroomACollision.h"
extern const unsigned short classroomACollisionBitmap[32768];


extern const unsigned short classroomACollisionPal[256];
# 8 "game.c" 2
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
# 9 "game.c" 2
# 1 "dialogueLines.h" 1


extern char* notesMain1D[7];
extern char* notesClass1D[8];
extern char* newspaper1D[3];



extern char* classroomAKeyD[4];
extern char* entranceKeyD[3];



extern char* classroomADoorD[2];
extern char* storageRoomDoorD[2];


extern char* classroomADoorLD[2];
extern char* storageRoomDoorLD[2];


extern char* codePuzzle1D[2];
# 10 "game.c" 2
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
# 11 "game.c" 2
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/string.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/string.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 1 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/string.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 1 3
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 143 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4

# 143 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 209 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 321 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 1 3
# 24 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_types.h" 1 3






typedef __int64_t _off_t;


typedef __int64_t _fpos_t;


typedef __uint32_t __ino_t;


typedef __uint32_t __dev_t;
# 25 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/lock.h" 1 3






typedef int32_t _LOCK_T;

struct __lock_t {
 _LOCK_T lock;
 uint32_t thread_tag;
 uint32_t counter;
};

typedef struct __lock_t _LOCK_RECURSIVE_T;

extern void __libc_lock_init(_LOCK_T *lock);
extern void __libc_lock_init_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_close(_LOCK_T *lock);
extern void __libc_lock_close_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_acquire(_LOCK_T *lock);
extern void __libc_lock_acquire_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_release(_LOCK_T *lock);
extern void __libc_lock_release_recursive(_LOCK_RECURSIVE_T *lock);


extern int __libc_lock_try_acquire(_LOCK_T *lock);
extern int __libc_lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock);
# 26 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;
# 50 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef int __pid_t;







typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;
# 88 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;
# 129 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef unsigned int __size_t;
# 145 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef signed int _ssize_t;
# 156 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef _ssize_t __ssize_t;


# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 350 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;






typedef unsigned long __clock_t;






typedef __int_least64_t __time_t;





typedef unsigned long __clockid_t;


typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef int __nl_item;
typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;




typedef char * __va_list;
# 16 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 38 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent;

struct __locale_t;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 93 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 117 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 181 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (*_read) (struct _reent *, void *,
        char *, int);
  int (*_write) (struct _reent *, void *,
         const char *,
         int);
  _fpos_t (*_seek) (struct _reent *, void *, _fpos_t, int);
  int (*_close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 287 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 319 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 610 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];


  int _unspecified_locale_info;
  struct __locale_t *_locale;

  int __sdidinit;

  void (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;



  struct _atexit *_atexit;
  struct _atexit _atexit0;



  void (**(_sig_func))(int);




  struct _glue __sglue;

  __FILE __sf[3];

  void *deviceData;
};
# 817 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);





  struct _reent * __getreent (void);
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/string.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 1 3
# 47 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 48 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/string.h" 2 3




# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 18 "/opt/devkitpro/devkitARM/arm-none-eabi/include/string.h" 2 3
# 27 "/opt/devkitpro/devkitARM/arm-none-eabi/include/string.h" 3


void * memchr (const void *, int, size_t);
int memcmp (const void *, const void *, size_t);
void * memcpy (void *restrict, const void *restrict, size_t);
void * memmove (void *, const void *, size_t);
void * memset (void *, int, size_t);
char *strcat (char *restrict, const char *restrict);
char *strchr (const char *, int);
int strcmp (const char *, const char *);
int strcoll (const char *, const char *);
char *strcpy (char *restrict, const char *restrict);
size_t strcspn (const char *, const char *);
char *strerror (int);
size_t strlen (const char *);
char *strncat (char *restrict, const char *restrict, size_t);
int strncmp (const char *, const char *, size_t);
char *strncpy (char *restrict, const char *restrict, size_t);
char *strpbrk (const char *, const char *);
char *strrchr (const char *, int);
size_t strspn (const char *, const char *);
char *strstr (const char *, const char *);

char *strtok (char *restrict, const char *restrict);

size_t strxfrm (char *restrict, const char *restrict, size_t);
# 86 "/opt/devkitpro/devkitARM/arm-none-eabi/include/string.h" 3
char *_strdup_r (struct _reent *, const char *);



char *_strndup_r (struct _reent *, const char *, size_t);
# 112 "/opt/devkitpro/devkitARM/arm-none-eabi/include/string.h" 3
char * _strerror_r (struct _reent *, int, int, int *);
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/string.h" 3
char *strsignal (int __signo);
# 175 "/opt/devkitpro/devkitARM/arm-none-eabi/include/string.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/string.h" 1 3
# 176 "/opt/devkitpro/devkitARM/arm-none-eabi/include/string.h" 2 3


# 12 "game.c" 2



# 14 "game.c"
int hOff;
int vOff;


SPRITE player;

SPRITE enemiesMain[5];
SPRITE enemiesStorage[2];

SPRITE keys[3];

SPRITE objectsMain[3];
SPRITE objectsClass[3];
SPRITE objectsStorage[2];


int heldKeys[];
int keyLocations[] = {
    70, 160, 0, 0, 240, 240
};
int currHeldKeys;
int prevHeldKeys;


DOOR doors[2];
int doorLocations[] = {
    80, 0, 160, 0
};
int doorWidth = 24;
int doorHeight = 8;


BOXPUZZLE boxPuzzle1;
BOXPUZZLE boxPuzzle2;
BOXPUZZLE boxPuzzle3;
BOXPUZZLE boxPuzzle4;

BOXPUZZLE* currBoxPuzzle;


int codePuzzleLocations[] = {
    64, 116
};


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



int enemyMainLocations[] = {
    88, 160, 0,
    88, 170, 0,
    103, 177, 0,
    208, 64, 1,
    208, 136, 1
};
int enemyStorageLocations[] = {
    20, 30, 0,
    100, 20, 0
};

int spawnMainEnemies;
int spawnStorageEnemies;




int objectMainLocations[] = {
    115, 10, 1,
    95, 11, 1,
    174, 11, 1,
};
int objectClassLocations[] = {
    71, 124, 1,
    42, 91, 1
};
int objectStorageLocations[] = {
    1, 1, 0
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



int intCD;


unsigned char* collisionMap;


enum {PLAYERFRONT, PLAYERBACK, PLAYERRIGHT, PLAYERLEFT, PLAYERIDLE};

void initGame() {
    mgba_open();


    vOff = 96;
    hOff = 0;

    showDialogue = 0;
    prevShowDialogue = 0;
    showCode = 0;
    prevShowCode = 0;

    collisionMap = (unsigned char*) collisionMapBitmap;
    currMapWidth = 256;
    currMapHeight = 256;
    prevMap = MAIN;
    currMap = MAIN;

    spawnMainEnemies = 1;
    spawnStorageEnemies = 1;
    currNoteLocations = noteMainLocations;
    currNoteCount = 1;

    initPlayer();
    initKeys();
    initDoors();
    initBoxPuzzles();
    initEnemies();
    initObjects();

    boxPuzzle1.solved = 0;
    boxPuzzle2.solved = 0;
    boxPuzzle3.solved = 0;
    boxPuzzle4.solved = 0;
}

void updateGame() {

    if (showDialogue) {
        intCD = 0;
        updateDialogue();
    } else if (showCode) {
        updateCode();
    }


    if (!showDialogue && !showCode) {
        updatePlayer();
        intCD++;

        for (int i = 0; i < 10; i++) {
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

        for (int i = 0; i < 3; i++) {
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
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 128 * 4);

    (*(volatile unsigned short *)0x04000014) = hOff;
    (*(volatile unsigned short *)0x04000016) = vOff;
}


void initPlayer() {
    player.width = 9;
    player.height = 15;
    player.rdel = 1;
    player.cdel = 1;


    player.worldRow = 136 + vOff;
    player.worldCol = 20 + hOff;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 3;
    player.aniState = PLAYERBACK;
    playerDirection = 2;

    initHeldKeys();
}

void updatePlayer() {
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 6)))) {
        playerDirection = 2;
        if (!checkPlayerCollision(playerDirection)) {
            if (player.worldRow > 0) {
                player.worldRow -= player.rdel;

                if (vOff > 0 && player.worldRow - vOff < 160 / 2) {
                    vOff--;
                }
            }
        }
    }

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 7)))) {
        playerDirection = 3;
        if (!checkPlayerCollision(playerDirection)) {
            if (player.worldRow < 256 - player.height) {
                player.worldRow += player.rdel;

                if (vOff + 160 < 256 && player.worldRow > 160 / 2) {
                    vOff++;
                }
            }
        }
    }

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 5)))) {
        playerDirection = 0;
        if (!checkPlayerCollision(playerDirection)) {
            if (player.worldCol > 0) {
                player.worldCol -= player.cdel;

                if (hOff > 0 && player.worldCol - hOff < 240 / 2) {
                    hOff--;
                }
            }
        }
    }

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 4)))) {
        playerDirection = 1;
        if (!checkPlayerCollision(playerDirection)) {
            if (player.worldCol < 256 - player.width) {
                player.worldCol += player.cdel;

                if (hOff + 240 < 256 && player.worldCol > 240 / 2) {
                    hOff++;
                }
            }
        }
    }


    if (player.worldRow > 183) {
        currBoxPuzzle = &boxPuzzle1;
    } else if (player.worldRow < 183 && player.worldRow > 86 && player.worldCol < 112) {
        currBoxPuzzle = &boxPuzzle2;
    } else if (player.worldRow < 86 && player.worldCol < 161) {
        currBoxPuzzle = &boxPuzzle3;
    } else if (player.worldRow < 169 && player.worldCol > 160) {
        currBoxPuzzle = &boxPuzzle4;
    }


    if ((!(~(oldButtons) & ((1 << 0))) && (~buttons & ((1 << 0)))) && intCD != 0) {

        int k = keyCollision(player.worldCol, player.worldRow, player.width, player.height, playerDirection);
        int d = lockedDoorCollision(player.worldCol, player.worldRow, player.width, player.height, playerDirection);
        int n = noteCollision(player.worldCol, player.worldRow, player.width, player.height, playerDirection, currNoteLocations, currNoteCount);


        int b = boxCollision(currBoxPuzzle->boxes, currBoxPuzzle->totalBoxes, player.worldCol, player.worldRow, player.width, player.height, playerDirection);

        if (k != -1 && !keys[k].hide) {
            prevShowDialogue = 0;
            showDialogue = 1;

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
            if (heldKeys[d] == 1) {
                prevShowDialogue = 0;
                showDialogue = 1;

                doors[d].unlocked = 1;

                switch (d) {
                    case 0:
                        initDialogue(classroomADoorD, 2);
                        break;
                    case 1:
                        initDialogue(storageRoomDoorD, 2);
                        break;
                }
            } else {
                prevShowDialogue = 0;
                showDialogue = 1;

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
            prevShowDialogue = 0;
            showDialogue = 1;

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
            if (!currBoxPuzzle->solved && currBoxPuzzle->boxes[b].beingPushed == 0) {
                currBoxPuzzle->boxes[b].pushDirection = playerDirection;
                currBoxPuzzle->boxes[b].beingPushed = 1;

                switch (currBoxPuzzle->boxes[b].pushDirection) {
                    case 0:
                        currBoxPuzzle->boxes[b].boxSprite.cdel = -1;
                        currBoxPuzzle->boxes[b].boxSprite.rdel = 0;
                        break;
                    case 1:
                        currBoxPuzzle->boxes[b].boxSprite.cdel = 1;
                        currBoxPuzzle->boxes[b].boxSprite.rdel = 0;
                        break;
                    case 2:
                        currBoxPuzzle->boxes[b].boxSprite.rdel = -1;
                        currBoxPuzzle->boxes[b].boxSprite.cdel = 0;
                        break;
                    case 3:
                        currBoxPuzzle->boxes[b].boxSprite.rdel = 1;
                        currBoxPuzzle->boxes[b].boxSprite.cdel = 0;
                        break;
                }
            }
        }

        if (codePuzzleCollision(player.worldCol, player.worldRow, player.width, player.height, playerDirection)) {
            prevShowCode = showCode;
            showCode = 1;
        }
    }


    if (currMap == STORAGEROOM) {
        if (!currBoxPuzzle->solved && collision(currBoxPuzzle->solCol, currBoxPuzzle->solRow, 16, 16, player.worldCol, player.worldRow, player.width, player.height)) {
            currBoxPuzzle->solved = 1;
        }
    }


    if (checkCollision(player.worldCol, player.worldRow, player.width, player.height, 0, 0) == 1) {
        moveMap(doorCollision(player.worldCol, player.worldRow, player.width, player.height));
    }

    animatePlayer();
}


void moveMap(int i) {
    hideSprites();
    if (currMap == MAIN) {
        switch (i) {
            case 0:
                currMap = CLASSROOMA;
                currNoteLocations = noteClassroomLocations;
                currNoteCount = 2;
                collisionMap = (unsigned char*) classroomACollisionBitmap;
                currMapWidth = 256;
                currMapHeight = 176;
                player.worldCol = 31;
                player.worldRow = 232;
                vOff = 96;
                hOff = 0;
                break;
            case 1:
                currMap = STORAGEROOM;
                currNoteLocations = noteStorageLocations;
                currNoteCount = 1;
                collisionMap = (unsigned char*) storageRoomCollisionBitmap;
                currMapWidth = 256;
                currMapHeight = 256;
                player.worldCol = 16;
                player.worldRow = 232;
                vOff = 96;
                hOff = 0;
                keys[2].hide = 0;
                break;
            case 2:

                break;
        }
    } else {
        currMap = MAIN;
        currNoteLocations = noteMainLocations;
        currNoteCount = 1;
        collisionMap = (unsigned char*) collisionMapBitmap;
        currMapWidth = 256;
        currMapHeight = 256;

        switch (prevMap) {
            case CLASSROOMA:
                player.worldCol = 88;
                player.worldRow = 8;
                vOff = 0;
                hOff = 0;
                break;
            case STORAGEROOM:
                player.worldCol = 168;
                player.worldRow = 8;
                vOff = 0;
                hOff = 0;
                keys[2].hide = 1;
                break;
            case RESTROOM:

                break;
        }
    }
    initBoxPuzzles();
    initEnemies();
    initObjects();
}


void animatePlayer() {
    player.prevAniState = player.aniState;
    player.aniState = PLAYERIDLE;

    if (player.aniCounter % 20 == 0) {
        player.curFrame = (player.curFrame + 1) % player.numFrames;
    }

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 6))))
        player.aniState = PLAYERBACK;
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 7))))
        player.aniState = PLAYERFRONT;
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 5))))
        player.aniState = PLAYERLEFT;
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 4))))
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
        shadowOAM[shadowOAMCount].attr0 |= (2 << 8);
    } else {
        shadowOAM[shadowOAMCount].attr0 = (player.worldRow - vOff) | (0 << 14);
        shadowOAM[shadowOAMCount].attr1 = (player.worldCol - hOff) | (1 << 14);
        shadowOAM[shadowOAMCount].attr2 = ((0) << 12) | ((player.curFrame * 2)*32 + (player.aniState * 2));
    }

    shadowOAMCount++;
}


void initHeldKeys() {
    currHeldKeys = 0;
    prevHeldKeys = 0;

    for (int i = 0; i < 3; i++) {
        heldKeys[i] = 0;
    }
}


void updateHeldKey(int key) {
    heldKeys[key] = 1;
    prevHeldKeys = currHeldKeys;
    currHeldKeys++;
}

void initKeys() {
    for (int i = 0; i < 3; i++) {
        keys[i].hide = 1;
        keys[i].width = 8;
        keys[i].height = 4;


        keys[i].worldRow = keyLocations[2 * i + 1];
        keys[i].worldCol = keyLocations[2 * i];
    }


    keys[0].hide = 0;
}

void updateKey(SPRITE* key) {
    key->hide = 1;
}

void drawKey(SPRITE* key) {
    if (key->hide) {
        shadowOAM[shadowOAMCount].attr0 |= (2 << 8);
    } else {
        shadowOAM[shadowOAMCount].attr0 = (key->worldRow - vOff) | (0 << 14);
        shadowOAM[shadowOAMCount].attr1 = (key->worldCol - hOff) | (0 << 14);
        shadowOAM[shadowOAMCount].attr2 = ((3) << 12) | ((10)*32 + (0));
    }

    shadowOAMCount++;
}


void initObjects() {
    int numObjects;
    SPRITE* objects;
    int* objectLocations;

    switch (currMap) {
        case MAIN:
            numObjects = 3;
            objects = objectsMain;
            objectLocations = objectMainLocations;
            break;
        case CLASSROOMA:
            numObjects = 3;
            objects = objectsClass;
            objectLocations = objectClassLocations;
            break;
        case STORAGEROOM:
            numObjects = 2;
            objects = objectsStorage;
            objectLocations = objectStorageLocations;
    }

    for (int i = 0; i < numObjects; i++) {
        objects[i].hide = 0;
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
            numObjects = 3;
            objects = objectsMain;
            break;
        case CLASSROOMA:
            numObjects = 3;
            objects = objectsClass;
            break;
        case STORAGEROOM:
            numObjects = 2;
            objects = objectsStorage;
    }

    for (int i = 0; i < numObjects; i++) {
        if (objects[i].hide) {
            shadowOAM[shadowOAMCount].attr0 |= (2 << 8);
        } else {
            shadowOAM[shadowOAMCount].attr0 = (objects[i].worldRow - vOff) | (0 << 14);
            shadowOAM[shadowOAMCount].attr1 = (objects[i].worldCol - hOff) | (0 << 14);
            shadowOAM[shadowOAMCount].attr2 = ((2) << 12) | ((9)*32 + (0));
        }

        shadowOAMCount++;
    }
}

void initDoors() {
    for (int i = 0; i < 2; i++) {
        doors[i].col = doorLocations[2 * i];
        doors[i].row = doorLocations[2 * i + 1];

        doors[i].unlocked = 0;

        doors[i].width = doorWidth;
        doors[i].height = doorHeight;
    }
}


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
            boxPuzzle1.solved = 0;
            boxPuzzle1.solCol = 64;
            boxPuzzle1.solRow = 168;
            boxPuzzle1.boxes[i].beingPushed = 0;
            boxPuzzle1.boxes[i].currPush = 0;
            boxPuzzle1.boxes[i].maxPush = 16;
            boxPuzzle1.boxes[i].pushDirection = 2;
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
            boxPuzzle2.solved = 0;
            boxPuzzle2.solCol = 48;
            boxPuzzle2.solRow = 120;
            boxPuzzle2.boxes[i].beingPushed = 0;
            boxPuzzle2.boxes[i].currPush = 0;
            boxPuzzle2.boxes[i].maxPush = 16;
            boxPuzzle2.boxes[i].pushDirection = 2;
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
            boxPuzzle3.solved = 0;
            boxPuzzle3.solCol = 128;
            boxPuzzle3.solRow = 24;
            boxPuzzle3.boxes[i].beingPushed = 0;
            boxPuzzle3.boxes[i].currPush = 0;
            boxPuzzle3.boxes[i].maxPush = 16;
            boxPuzzle3.boxes[i].pushDirection = 2;
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
            boxPuzzle4.solved = 0;
            boxPuzzle4.solCol = 192;
            boxPuzzle4.solRow = 152;
            boxPuzzle4.boxes[i].beingPushed = 0;
            boxPuzzle4.boxes[i].currPush = 0;
            boxPuzzle4.boxes[i].maxPush = 16;
            boxPuzzle4.boxes[i].pushDirection = 2;
            boxPuzzle4.boxes[i].boxSprite.height = 16;
            boxPuzzle4.boxes[i].boxSprite.width = 16;
            boxPuzzle4.boxes[i].boxSprite.worldCol = puzzle4Init[2 * i];
            boxPuzzle4.boxes[i].boxSprite.worldRow = puzzle4Init[2 * i + 1];
        }
    }
}




void updateBox(BOX* box, BOX* boxPuzzle, int currBox, int i) {
    if (box->maxPush == box->currPush || checkBoxCollision(box, boxPuzzle, currBox, i)) {
        box->beingPushed = 0;
        box->boxSprite.cdel = 0;
        box->boxSprite.rdel = 0;
        box->currPush = 0;
    } else {
        box->beingPushed = 1;
        box->currPush++;


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
        box->hide = 1;
    } else {
        box->hide = 0;
        col = box->worldCol - hOff;
    }

    if (box->hide) {
        shadowOAM[shadowOAMCount].attr0 |= (2 << 8);
    } else {
        shadowOAM[shadowOAMCount].attr0 = row | (0 << 14);
        shadowOAM[shadowOAMCount].attr1 = col | (1 << 14);
        shadowOAM[shadowOAMCount].attr2 = ((4) << 12) | ((11)*32 + (0));
    }

    shadowOAMCount++;
}

void initEnemies() {
    int numEnemies;
    SPRITE* enemies;
    int* enemyLocations;

    switch (currMap) {
        case MAIN:
            numEnemies = 5;
            enemies = enemiesMain;
            enemyLocations = enemyMainLocations;
            break;
        case STORAGEROOM:
            numEnemies = 2;
            enemies = enemiesStorage;
            enemyLocations = enemyStorageLocations;
    }

    for (int i = 0; i < numEnemies; i++) {
        enemies[i].hide = 0;
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

    if (enemiesMain[3].aniCounter % 5 == 0) {
        if (enemiesMain[3].worldCol < 240 && enemyMainLocations[3 * 3 + 2] == 1) {
            enemiesMain[3].worldCol += enemiesMain[3].cdel;


            if (enemiesMain[3].worldCol >= 240) {
                enemyMainLocations[3 * 3 + 2] = 0;
            }
        } else {
            enemiesMain[3].worldCol -= enemiesMain[3].cdel;


            if (enemiesMain[3].worldCol <= 208) {
                enemyMainLocations[3 * 3 + 2] = 1;
            }
        }
    }



    for (int i = 0; i < 5; i++) {
        animateEnemy(&enemiesMain[i]);
    }
}

void updateStorageEnemies() {

    if (enemiesStorage[3].aniCounter % 5 == 0) {

    }




    for (int i = 0; i < 2; i++) {
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
                for (int i = 0; i < 5; i++) {
                    drawEnemy(&enemiesMain[i]);
                }
            }
            break;
        case STORAGEROOM:
            if (spawnStorageEnemies) {
                for (int i = 0; i < 2; i++) {
                    drawEnemy(&enemiesStorage[i]);
                }
            }
    }
}

void drawEnemy(SPRITE* enemy) {
    int row = enemy->worldRow - vOff;
    int col;

    if (enemy->worldCol - hOff < 0) {
        enemy->hide = 1;
    } else {
        enemy->hide = 0;
        col = enemy->worldCol - hOff;
    }

    if (enemy->hide) {
        shadowOAM[shadowOAMCount].attr0 |= (2 << 8);
    } else {
        shadowOAM[shadowOAMCount].attr0 = row | (0 << 14);
        shadowOAM[shadowOAMCount].attr1 = col | (0 << 14);
        shadowOAM[shadowOAMCount].attr2 = ((1) << 12) | ((6 + enemy->curFrame)*32 + (0));
    }

    shadowOAMCount++;
}
