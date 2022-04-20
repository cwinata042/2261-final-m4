
//{{BLOCK(storageRoom)

//======================================================================
//
//	storageRoom, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 11 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 352 + 2048 = 2912
//
//	Time-stamp: 2022-04-19, 23:22:17
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_STORAGEROOM_H
#define GRIT_STORAGEROOM_H

#define storageRoomTilesLen 352
extern const unsigned short storageRoomTiles[176];

#define storageRoomMapLen 2048
extern const unsigned short storageRoomMap[1024];

#define storageRoomPalLen 512
extern const unsigned short storageRoomPal[256];

#endif // GRIT_STORAGEROOM_H

//}}BLOCK(storageRoom)
