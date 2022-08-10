#ifndef CONFIG_GAME_H
#define CONFIG_GAME_H

/*****************
 * GAME SETTINGS *
 *****************/
 
/*****************
*** Allocation ***
/****************/
/*******************************************
*GI models or "Get Item" models are*********
*the models that appear over Link's head****
*when he picks up a item. the normal memory*
*allocated for the is 0x3008. a safe number*
*is 1024 * 32 which is way more than normal*
*******************************************/
#define GET_ITEM_OBJECT_SEGMENT_SPACE 0x3008

#endif
