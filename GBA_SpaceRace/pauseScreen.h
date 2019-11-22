
//{{BLOCK(pauseScreen)

//======================================================================
//
//	pauseScreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 202 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 6464 + 2048 = 9024
//
//	Time-stamp: 2019-04-23, 00:04:33
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSESCREEN_H
#define GRIT_PAUSESCREEN_H

#define pauseScreenTilesLen 6464
extern const unsigned short pauseScreenTiles[3232];

#define pauseScreenMapLen 2048
extern const unsigned short pauseScreenMap[1024];

#define pauseScreenPalLen 512
extern const unsigned short pauseScreenPal[256];

#endif // GRIT_PAUSESCREEN_H

//}}BLOCK(pauseScreen)
