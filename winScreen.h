
//{{BLOCK(winScreen)

//======================================================================
//
//	winScreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 69 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 2208 + 2048 = 4768
//
//	Time-stamp: 2022-04-02, 15:16:53
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WINSCREEN_H
#define GRIT_WINSCREEN_H

#define winScreenTilesLen 2208
extern const unsigned short winScreenTiles[1104];

#define winScreenMapLen 2048
extern const unsigned short winScreenMap[1024];

#define winScreenPalLen 512
extern const unsigned short winScreenPal[256];

#endif // GRIT_WINSCREEN_H

//}}BLOCK(winScreen)
