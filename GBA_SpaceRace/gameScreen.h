
//{{BLOCK(gameScreen)

//======================================================================
//
//	gameScreen, 256x512@4, 
//	+ palette 256 entries, not compressed
//	+ 1901 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x64 
//	Total size: 512 + 60832 + 4096 = 65440
//
//	Time-stamp: 2019-04-11, 14:03:34
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMESCREEN_H
#define GRIT_GAMESCREEN_H

#define gameScreenTilesLen 60832
extern const unsigned short gameScreenTiles[30416];

#define gameScreenMapLen 4096
extern const unsigned short gameScreenMap[2048];

#define gameScreenPalLen 512
extern const unsigned short gameScreenPal[256];

#endif // GRIT_GAMESCREEN_H

//}}BLOCK(gameScreen)
