#define CHAR_TABLE "mp/characterTable.csv"

#ifndef BUTTON_ALIGN
#define BUTTON_ALIGN HORIZONTAL_ALIGN_FULLSCREEN VERTICAL_ALIGN_FULLSCREEN
#endif

// #define CHARACTER( row, column, itemID ) \
// itemDef \
// { \
// 	rect			(-170+column*50) (-115+row*50) 60 50 HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_CENTER	\
// 	origin			(68*row) (65*column) \
// 	style			WINDOW_STYLE_SHADER \
// 	exp				material( tableLookup(CHAR_TABLE,0,(itemID-40),3) ) \
// 	visible			1 \
// 	border			1 \
// 	bordercolor		0 0 0 1 \
// 	decoration \
// } \
// itemDef \
// { \
// 	rect			(-170+column*50) (-115+row*50) 60 50 HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_CENTER	\
// 	origin			(68*row) (65*column) \
// 	style			WINDOW_STYLE_SHADER \
// 	background		"black" \
// 	forecolor		0 0 0 0.8 \
// 	visible			1 \
// 	decoration \
// } \
// itemDef \
// { \
// 	visible		1 \
// 	rect			(-170+column*50) (-115+row*50) 0 0 HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_CENTER	\
// 	origin			(68*row) (65*column) \
// 	textalignx	24 \
// 	textaligny	44 \
// 	forecolor	1 1 1 0.8 \
// 	exp			text( "^1Glove:" + (tableLookup(CHAR_TABLE, 0, (itemID-40), 2) )-1) \
// 	textfont	UI_FONT_NORMAL \
// 	textalign	ITEM_ALIGN_CENTER \
// 	textscale	0.19 \
// 	decoration \
// } \
// itemDef \
// { \
// 	style		WINDOW_STYLE_FILLED \
// 	rect			(-170+column*50) (-115+row*50) 60 50 HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_CENTER	\
// 	origin			(68*row) (65*column) \
// 	forecolor	1 1 1 0.8 \
// 	type		ITEM_TYPE_BUTTON \
// 	exp			text( "  " ) \
// 	textfont	UI_FONT_NORMAL \
// 	textstyle	ITEM_TEXTSTYLE_SHADOWED \
// 	textalign	ITEM_ALIGN_CENTER \
// 	textscale	0.2 \
// 	textalignx	0 \
// 	textaligny	45 \
// 	visible     0 \
// 	mouseEnter \
// 	{ \
// 		play "so_mouse_over"; \
// 	} \
// 	action \
// 	{ \
// 		scriptMenuResponse itemID; \
// 		close self; \
// 	} \
// } 
#include "ui/vc.inc"

#define	CHARACTER( col, row, itemID )	\
		itemDef	\
		{	\
			rect			(-247+col*70) (-140+row*75) 60 50 HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_CENTER	\
			style			WINDOW_STYLE_SHADER	\
			type 			ITEM_TYPE_BUTTON	\
			border			1	\
			bordercolor		VC_COLOR2 0.5;	\
			exp				material( tableLookup(CHAR_TABLE,0,(itemID-40),3) ) \
			exp				text( "^1Glove:" + (tableLookup(CHAR_TABLE, 0, (itemID-40), 2) )-1) \
			textfont		UI_FONT_NORMAL	\
			textalign		ITEM_ALIGN_LEFT	\
			textscale		TEXTSIZE_SMALL	\
			visible			1	\
			action			{ play mouse_click;scriptmenuresponse itemID;close self; }	\
			mouseEnter		{ play "so_mouse_over"; setcolor bordercolor VC_COLOR2 1; }	\
			mouseExit		{ setcolor bordercolor VC_COLOR2 0.5; }	\
		}
