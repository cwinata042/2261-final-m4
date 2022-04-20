
//{{BLOCK(dialogueBox)

//======================================================================
//
//	dialogueBox, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 9 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 288 + 2048 = 2848
//
//	Time-stamp: 2022-04-11, 20:19:44
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_DIALOGUEBOX_H
#define GRIT_DIALOGUEBOX_H

#define dialogueBoxTilesLen 288
extern const unsigned short dialogueBoxTiles[144];

#define dialogueBoxMapLen 2048
extern const unsigned short dialogueBoxMap[1024];

#define dialogueBoxPalLen 512
extern const unsigned short dialogueBoxPal[256];

#endif // GRIT_DIALOGUEBOX_H

//}}BLOCK(dialogueBox)
