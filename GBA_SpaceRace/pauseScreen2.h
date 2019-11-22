
//{{BLOCK(pauseScreen2)

//======================================================================
//
//	pauseScreen2, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 128 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 4096 + 2048 = 6656
//
//	Time-stamp: 2019-04-26, 14:10:14
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSESCREEN2_H
#define GRIT_PAUSESCREEN2_H

#define pauseScreen2TilesLen 4096
extern const unsigned short pauseScreen2Tiles[2048];

#define pauseScreen2MapLen 2048
extern const unsigned short pauseScreen2Map[1024];

#define pauseScreen2PalLen 512
extern const unsigned short pauseScreen2Pal[256];

#endif // GRIT_PAUSESCREEN2_H

//}}BLOCK(pauseScreen2)
