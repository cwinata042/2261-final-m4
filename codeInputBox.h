
//{{BLOCK(codeInputBox)

//======================================================================
//
//	codeInputBox, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 9 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 288 + 2048 = 2848
//
//	Time-stamp: 2022-04-12, 13:57:53
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_CODEINPUTBOX_H
#define GRIT_CODEINPUTBOX_H

#define codeInputBoxTilesLen 288
extern const unsigned short codeInputBoxTiles[144];

#define codeInputBoxMapLen 2048
extern const unsigned short codeInputBoxMap[1024];

#define codeInputBoxPalLen 512
extern const unsigned short codeInputBoxPal[256];

#endif // GRIT_CODEINPUTBOX_H

//}}BLOCK(codeInputBox)
