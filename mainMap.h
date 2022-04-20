
//{{BLOCK(mainMap)

//======================================================================
//
//	mainMap, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 33 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1056 + 2048 = 3616
//
//	Time-stamp: 2022-04-18, 17:48:50
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MAINMAP_H
#define GRIT_MAINMAP_H

#define mainMapTilesLen 1056
extern const unsigned short mainMapTiles[528];

#define mainMapMapLen 2048
extern const unsigned short mainMapMap[1024];

#define mainMapPalLen 512
extern const unsigned short mainMapPal[256];

#endif // GRIT_MAINMAP_H

//}}BLOCK(mainMap)
