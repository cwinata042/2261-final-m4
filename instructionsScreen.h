
//{{BLOCK(instructionsScreen)

//======================================================================
//
//	instructionsScreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 146 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 4672 + 2048 = 7232
//
//	Time-stamp: 2022-04-02, 15:30:05
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTIONSSCREEN_H
#define GRIT_INSTRUCTIONSSCREEN_H

#define instructionsScreenTilesLen 4672
extern const unsigned short instructionsScreenTiles[2336];

#define instructionsScreenMapLen 2048
extern const unsigned short instructionsScreenMap[1024];

#define instructionsScreenPalLen 512
extern const unsigned short instructionsScreenPal[256];

#endif // GRIT_INSTRUCTIONSSCREEN_H

//}}BLOCK(instructionsScreen)
