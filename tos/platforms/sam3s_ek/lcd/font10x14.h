#ifndef LCD_FONT_10x14_H
#define LCD_FONT_10x14_H

//------------------------------------------------------------------------------
//         Definitions
//------------------------------------------------------------------------------

const unsigned char pCharset10x14[] = {
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xCC,
	0xFF, 0xCC, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0xF0, 0x00, 0xF0, 0x00, 0x00, 0x00,
	0x00, 0x00, 0xF0, 0x00, 0xF0, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x0C, 0xC0, 0x0C, 0xC0, 0xFF, 0xFC, 0xFF, 0xFC, 0x0C, 0xC0,
	0x0C, 0xC0, 0xFF, 0xFC, 0xFF, 0xFC, 0x0C, 0xC0, 0x0C, 0xC0,
	0x0C, 0x60, 0x1E, 0x70, 0x3F, 0x30, 0x33, 0x30, 0xFF, 0xFC,
	0xFF, 0xFC, 0x33, 0x30, 0x33, 0xF0, 0x39, 0xE0, 0x18, 0xC0,
	0x60, 0x00, 0xF0, 0x0C, 0xF0, 0x3C, 0x60, 0xF0, 0x03, 0xC0,
	0x0F, 0x00, 0x3C, 0x18, 0xF0, 0x3C, 0xC0, 0x3C, 0x00, 0x18,
	0x3C, 0xF0, 0x7F, 0xF8, 0xC3, 0x1C, 0xC7, 0x8C, 0xCF, 0xCC,
	0xDC, 0xEC, 0x78, 0x78, 0x30, 0x30, 0x00, 0xFC, 0x00, 0xCC,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x00, 0xEC, 0x00,
	0xF8, 0x00, 0x70, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x0F, 0xC0, 0x3F, 0xF0, 0x78, 0x78,
	0x60, 0x18, 0xC0, 0x0C, 0xC0, 0x0C, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0xC0, 0x0C, 0xC0, 0x0C, 0x60, 0x18,
	0x78, 0x78, 0x3F, 0xF0, 0x0F, 0xC0, 0x00, 0x00, 0x00, 0x00,
	0x0C, 0x60, 0x0E, 0xE0, 0x07, 0xC0, 0x03, 0x80, 0x3F, 0xF8,
	0x3F, 0xF8, 0x03, 0x80, 0x07, 0xC0, 0x0E, 0xE0, 0x0C, 0x60,
	0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x3F, 0xF0,
	0x3F, 0xF0, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00,
	0x00, 0x44, 0x00, 0xEC, 0x00, 0xF8, 0x00, 0x70, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00,
	0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00,
	0x00, 0x18, 0x00, 0x3C, 0x00, 0x3C, 0x00, 0x18, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x0C, 0x00, 0x3C, 0x00, 0xF0, 0x03, 0xC0,
	0x0F, 0x00, 0x3C, 0x00, 0xF0, 0x00, 0xC0, 0x00, 0x00, 0x00,
	0x3F, 0xF0, 0x7F, 0xF8, 0xE0, 0xFC, 0xC1, 0xCC, 0xC3, 0x8C,
	0xC7, 0x0C, 0xCE, 0x0C, 0xFC, 0x1C, 0x7F, 0xF8, 0x3F, 0xF0,
	0x00, 0x00, 0x00, 0x00, 0x30, 0x0C, 0x70, 0x0C, 0xFF, 0xFC,
	0xFF, 0xFC, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00,
	0x30, 0x0C, 0x70, 0x1C, 0xE0, 0x3C, 0xC0, 0x7C, 0xC0, 0xEC,
	0xC1, 0xCC, 0xC3, 0x8C, 0xE7, 0x0C, 0x7E, 0x0C, 0x3C, 0x0C,
	0x30, 0x30, 0x70, 0x38, 0xE0, 0x1C, 0xC0, 0x0C, 0xC0, 0x0C,
	0xC3, 0x0C, 0xC3, 0x0C, 0xE3, 0x1C, 0x7F, 0xF8, 0x3C, 0xF0,
	0x03, 0xC0, 0x07, 0xC0, 0x0E, 0xC0, 0x1C, 0xC0, 0x38, 0xC0,
	0x70, 0xC0, 0xFF, 0xFC, 0xFF, 0xFC, 0x00, 0xC0, 0x00, 0xC0,
	0xFC, 0x30, 0xFC, 0x38, 0xCC, 0x1C, 0xCC, 0x0C, 0xCC, 0x0C,
	0xCC, 0x0C, 0xCC, 0x0C, 0xCE, 0x1C, 0xC7, 0xF8, 0xC3, 0xF0,
	0x3F, 0xF0, 0x7F, 0xF8, 0xE3, 0x1C, 0xC3, 0x0C, 0xC3, 0x0C,
	0xC3, 0x0C, 0xC3, 0x0C, 0xE3, 0x9C, 0x71, 0xF8, 0x30, 0xF0,
	0xC0, 0x00, 0xC0, 0x00, 0xC0, 0x00, 0xC0, 0x00, 0xC3, 0xFC,
	0xC7, 0xFC, 0xCE, 0x00, 0xDC, 0x00, 0xF8, 0x00, 0xF0, 0x00,
	0x3C, 0xF0, 0x7F, 0xF8, 0xE7, 0x9C, 0xC3, 0x0C, 0xC3, 0x0C,
	0xC3, 0x0C, 0xC3, 0x0C, 0xE7, 0x9C, 0x7F, 0xF8, 0x3C, 0xF0,
	0x3C, 0x00, 0x7E, 0x00, 0xE7, 0x0C, 0xC3, 0x0C, 0xC3, 0x1C,
	0xC3, 0x38, 0xC3, 0x70, 0xE7, 0xE0, 0x7F, 0xC0, 0x3F, 0x80,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x60, 0x3C, 0xF0,
	0x3C, 0xF0, 0x18, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x44, 0x3C, 0xEC,
	0x3C, 0xF8, 0x18, 0x70, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x03, 0x00, 0x07, 0x80, 0x0F, 0xC0, 0x1C, 0xE0,
	0x38, 0x70, 0x70, 0x38, 0xE0, 0x1C, 0xC0, 0x0C, 0x00, 0x00,
	0x0C, 0xC0, 0x0C, 0xC0, 0x0C, 0xC0, 0x0C, 0xC0, 0x0C, 0xC0,
	0x0C, 0xC0, 0x0C, 0xC0, 0x0C, 0xC0, 0x0C, 0xC0, 0x0C, 0xC0,
	0x00, 0x00, 0xC0, 0x0C, 0xE0, 0x1C, 0x70, 0x38, 0x38, 0x70,
	0x1C, 0xE0, 0x0F, 0xC0, 0x07, 0x80, 0x03, 0x00, 0x00, 0x00,
	0x30, 0x00, 0x70, 0x00, 0xE0, 0x00, 0xC0, 0x00, 0xC1, 0xEC,
	0xC3, 0xEC, 0xC3, 0x00, 0xE6, 0x00, 0x7E, 0x00, 0x3C, 0x00,
	0x30, 0xF0, 0x71, 0xF8, 0xE3, 0x9C, 0xC3, 0x0C, 0xC3, 0xFC,
	0xC3, 0xFC, 0xC0, 0x0C, 0xE0, 0x1C, 0x7F, 0xF8, 0x3F, 0xF0,
	0x3F, 0xFC, 0x7F, 0xFC, 0xE0, 0xC0, 0xC0, 0xC0, 0xC0, 0xC0,
	0xC0, 0xC0, 0xC0, 0xC0, 0xE0, 0xC0, 0x7F, 0xFC, 0x3F, 0xFC,
	0xFF, 0xFC, 0xFF, 0xFC, 0xC3, 0x0C, 0xC3, 0x0C, 0xC3, 0x0C,
	0xC3, 0x0C, 0xC3, 0x0C, 0xE7, 0x9C, 0x7F, 0xF8, 0x3C, 0xF0,
	0x3F, 0xF0, 0x7F, 0xF8, 0xE0, 0x1C, 0xC0, 0x0C, 0xC0, 0x0C,
	0xC0, 0x0C, 0xC0, 0x0C, 0xE0, 0x1C, 0x70, 0x38, 0x30, 0x30,
	0xFF, 0xFC, 0xFF, 0xFC, 0xC0, 0x0C, 0xC0, 0x0C, 0xC0, 0x0C,
	0xC0, 0x0C, 0xC0, 0x0C, 0xE0, 0x1C, 0x7F, 0xF8, 0x3F, 0xF0,
	0xFF, 0xFC, 0xFF, 0xFC, 0xC3, 0x0C, 0xC3, 0x0C, 0xC3, 0x0C,
	0xC3, 0x0C, 0xC3, 0x0C, 0xC3, 0x0C, 0xC0, 0x0C, 0xC0, 0x0C,
	0xFF, 0xFC, 0xFF, 0xFC, 0xC3, 0x00, 0xC3, 0x00, 0xC3, 0x00,
	0xC3, 0x00, 0xC3, 0x00, 0xC3, 0x00, 0xC0, 0x00, 0xC0, 0x00,
	0x3F, 0xF0, 0x7F, 0xF8, 0xE0, 0x1C, 0xC0, 0x0C, 0xC0, 0x0C,
	0xC3, 0x0C, 0xC3, 0x0C, 0xE3, 0x1C, 0x73, 0xF8, 0x33, 0xF0,
	0xFF, 0xFC, 0xFF, 0xFC, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00,
	0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0xFF, 0xFC, 0xFF, 0xFC,
	0x00, 0x00, 0x00, 0x00, 0xC0, 0x0C, 0xC0, 0x0C, 0xFF, 0xFC,
	0xFF, 0xFC, 0xC0, 0x0C, 0xC0, 0x0C, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x30, 0x00, 0x38, 0xC0, 0x1C, 0xC0, 0x0C, 0xC0, 0x0C,
	0xC0, 0x1C, 0xFF, 0xF8, 0xFF, 0xF0, 0xC0, 0x00, 0xC0, 0x00,
	0xFF, 0xFC, 0xFF, 0xFC, 0x07, 0x80, 0x07, 0x80, 0x0F, 0xC0,
	0x1C, 0xE0, 0x38, 0x70, 0x70, 0x38, 0xE0, 0x1C, 0xC0, 0x0C,
	0xFF, 0xFC, 0xFF, 0xFC, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0C,
	0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0C,
	0xFF, 0xFC, 0xFF, 0xFC, 0x70, 0x00, 0x38, 0x00, 0x1F, 0x00,
	0x1F, 0x00, 0x38, 0x00, 0x70, 0x00, 0xFF, 0xFC, 0xFF, 0xFC,
	0xFF, 0xFC, 0xFF, 0xFC, 0x1C, 0x00, 0x0E, 0x00, 0x07, 0x00,
	0x03, 0x80, 0x01, 0xC0, 0x00, 0xE0, 0xFF, 0xFC, 0xFF, 0xFC,
	0x3F, 0xF0, 0x7F, 0xF8, 0xE0, 0x1C, 0xC0, 0x0C, 0xC0, 0x0C,
	0xC0, 0x0C, 0xC0, 0x0C, 0xE0, 0x1C, 0x7F, 0xF8, 0x3F, 0xF0,
	0xFF, 0xFC, 0xFF, 0xFC, 0xC3, 0x00, 0xC3, 0x00, 0xC3, 0x00,
	0xC3, 0x00, 0xC3, 0x00, 0xE7, 0x00, 0x7E, 0x00, 0x3C, 0x00,
	0x3F, 0xF0, 0x7F, 0xF8, 0xE0, 0x1C, 0xC0, 0x0C, 0xC0, 0xCC,
	0xC0, 0xEC, 0xC0, 0x7C, 0xE0, 0x38, 0x7F, 0xFC, 0x3F, 0xEC,
	0xFF, 0xFC, 0xFF, 0xFC, 0xC3, 0x00, 0xC3, 0x80, 0xC3, 0x80,
	0xC3, 0xC0, 0xC3, 0xC0, 0xE7, 0x70, 0x7E, 0x3C, 0x3C, 0x1C,
	0x3C, 0x18, 0x7E, 0x1C, 0xE7, 0x0C, 0xC3, 0x0C, 0xC3, 0x0C,
	0xC3, 0x0C, 0xC3, 0x0C, 0xC3, 0x9C, 0xE1, 0xF8, 0x60, 0xF0,
	0xC0, 0x00, 0xC0, 0x00, 0xC0, 0x00, 0xC0, 0x00, 0xFF, 0xFC,
	0xFF, 0xFC, 0xC0, 0x00, 0xC0, 0x00, 0xC0, 0x00, 0xC0, 0x00,
	0xFF, 0xF0, 0xFF, 0xF8, 0x00, 0x1C, 0x00, 0x0C, 0x00, 0x0C,
	0x00, 0x0C, 0x00, 0x0C, 0x00, 0x1C, 0xFF, 0xF8, 0xFF, 0xF0,
	0xFF, 0xC0, 0xFF, 0xE0, 0x00, 0x70, 0x00, 0x38, 0x00, 0x1C,
	0x00, 0x1C, 0x00, 0x38, 0x00, 0x70, 0xFF, 0xE0, 0xFF, 0xC0,
	0xFF, 0xF0, 0xFF, 0xF8, 0x00, 0x1C, 0x00, 0x3C, 0x00, 0xF8,
	0x00, 0xF8, 0x00, 0x3C, 0x00, 0x1C, 0xFF, 0xF8, 0xFF, 0xF0,
	0xF0, 0x3C, 0xF8, 0x7C, 0x1C, 0xE0, 0x0F, 0xC0, 0x07, 0x80,
	0x07, 0x80, 0x0F, 0xC0, 0x1C, 0xE0, 0xF8, 0x7C, 0xF0, 0x3C,
	0xFC, 0x00, 0xFE, 0x00, 0x07, 0x00, 0x03, 0x80, 0x01, 0xFC,
	0x01, 0xFC, 0x03, 0x80, 0x07, 0x00, 0xFE, 0x00, 0xFC, 0x00,
	0xC0, 0x3C, 0xC0, 0x7C, 0xC0, 0xEC, 0xC1, 0xCC, 0xC3, 0x8C,
	0xC7, 0x0C, 0xCE, 0x0C, 0xDC, 0x0C, 0xF8, 0x0C, 0xF0, 0x0C,
	0x00, 0x00, 0x00, 0x00, 0xFF, 0xFC, 0xFF, 0xFC, 0xC0, 0x0C,
	0xC0, 0x0C, 0xC0, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x30, 0x00, 0x30, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x03, 0x00,
	0x03, 0x00, 0x00, 0xC0, 0x00, 0xC0, 0x00, 0x30, 0x00, 0x30,
	0x00, 0x00, 0x00, 0x00, 0xC0, 0x0C, 0xC0, 0x0C, 0xC0, 0x0C,
	0xFF, 0xFC, 0xFF, 0xFC, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x0C, 0x00, 0x1C, 0x00, 0x38, 0x00, 0x70, 0x00, 0xE0, 0x00,
	0xE0, 0x00, 0x70, 0x00, 0x38, 0x00, 0x1C, 0x00, 0x0C, 0x00,
	0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0C,
	0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0C,
	0x00, 0x00, 0x00, 0x00, 0xC0, 0x00, 0xE0, 0x00, 0x70, 0x00,
	0x38, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x30, 0x06, 0x78, 0x0E, 0xFC, 0x0C, 0xCC, 0x0C, 0xCC,
	0x0C, 0xCC, 0x0C, 0xCC, 0x0E, 0xCC, 0x07, 0xFC, 0x03, 0xF8,
	0xFF, 0xFC, 0xFF, 0xFC, 0x03, 0x0C, 0x03, 0x0C, 0x03, 0x0C,
	0x03, 0x0C, 0x03, 0x0C, 0x03, 0x9C, 0x01, 0xF8, 0x00, 0xF0,
	0x03, 0xF0, 0x07, 0xF8, 0x0E, 0x1C, 0x0C, 0x0C, 0x0C, 0x0C,
	0x0C, 0x0C, 0x0C, 0x0C, 0x0E, 0x1C, 0x07, 0x38, 0x03, 0x30,
	0x00, 0xF0, 0x01, 0xF8, 0x03, 0x9C, 0x03, 0x0C, 0x03, 0x0C,
	0x03, 0x0C, 0x03, 0x0C, 0x03, 0x0C, 0xFF, 0xFC, 0xFF, 0xFC,
	0x03, 0xF0, 0x07, 0xF8, 0x0E, 0xDC, 0x0C, 0xCC, 0x0C, 0xCC,
	0x0C, 0xCC, 0x0C, 0xCC, 0x0E, 0xDC, 0x07, 0xD8, 0x03, 0x90,
	0x00, 0x00, 0x03, 0x00, 0x3F, 0xFC, 0x7F, 0xFC, 0xE3, 0x00,
	0xE3, 0x00, 0x70, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x03, 0x18, 0x07, 0x9C, 0x0F, 0xCC, 0x0C, 0xCC, 0x0C, 0xCC,
	0x0C, 0xCC, 0x0C, 0xCC, 0x0C, 0xDC, 0x0F, 0xF8, 0x07, 0xF0,
	0xFF, 0xFC, 0xFF, 0xFC, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00,
	0x03, 0x00, 0x03, 0x80, 0x01, 0xFC, 0x00, 0xFC, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1B, 0xFC,
	0x1B, 0xFC, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x30, 0x00, 0x38, 0x00, 0x1C, 0x00, 0x0C,
	0x00, 0x0C, 0x00, 0x1C, 0xCF, 0xF8, 0xCF, 0xF0, 0x00, 0x00,
	0x00, 0x00, 0xFF, 0xFC, 0xFF, 0xFC, 0x00, 0xE0, 0x01, 0xE0,
	0x03, 0xF0, 0x07, 0x38, 0x0E, 0x1C, 0x0C, 0x0C, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0xC0, 0x0C, 0xC0, 0x0C, 0xFF, 0xFC,
	0xFF, 0xFC, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00,
	0x0F, 0xFC, 0x0F, 0xFC, 0x0E, 0x00, 0x07, 0x00, 0x03, 0xC0,
	0x03, 0xC0, 0x07, 0x00, 0x0E, 0x00, 0x0F, 0xFC, 0x0F, 0xFC,
	0x0F, 0xFC, 0x0F, 0xFC, 0x03, 0x00, 0x07, 0x00, 0x0E, 0x00,
	0x0C, 0x00, 0x0C, 0x00, 0x0E, 0x00, 0x07, 0xFC, 0x03, 0xFC,
	0x03, 0xF0, 0x07, 0xF8, 0x0E, 0x1C, 0x0C, 0x0C, 0x0C, 0x0C,
	0x0C, 0x0C, 0x0C, 0x0C, 0x0E, 0x1C, 0x07, 0xF8, 0x03, 0xF0,
	0x0F, 0xFC, 0x0F, 0xFC, 0x0C, 0xC0, 0x0C, 0xC0, 0x0C, 0xC0,
	0x0C, 0xC0, 0x0C, 0xC0, 0x0F, 0xC0, 0x07, 0x80, 0x03, 0x00,
	0x03, 0x00, 0x07, 0x80, 0x0F, 0xC0, 0x0C, 0xC0, 0x0C, 0xC0,
	0x0C, 0xC0, 0x0C, 0xC0, 0x0C, 0xC0, 0x0F, 0xFC, 0x0F, 0xFC,
	0x0F, 0xFC, 0x0F, 0xFC, 0x03, 0x80, 0x07, 0x00, 0x0E, 0x00,
	0x0C, 0x00, 0x0C, 0x00, 0x0E, 0x00, 0x07, 0x00, 0x03, 0x00,
	0x03, 0x18, 0x07, 0x9C, 0x0F, 0xCC, 0x0C, 0xCC, 0x0C, 0xCC,
	0x0C, 0xCC, 0x0C, 0xCC, 0x0C, 0xFC, 0x0E, 0x78, 0x06, 0x30,
	0x00, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0xFF, 0xF0, 0xFF, 0xF8,
	0x0C, 0x1C, 0x0C, 0x1C, 0x0C, 0x38, 0x0C, 0x30, 0x00, 0x00,
	0x0F, 0xF0, 0x0F, 0xF8, 0x00, 0x1C, 0x00, 0x0C, 0x00, 0x0C,
	0x00, 0x0C, 0x00, 0x0C, 0x00, 0x1C, 0x0F, 0xF8, 0x0F, 0xF0,
	0x0F, 0xC0, 0x0F, 0xE0, 0x00, 0x70, 0x00, 0x38, 0x00, 0x1C,
	0x00, 0x1C, 0x00, 0x38, 0x00, 0x70, 0x0F, 0xE0, 0x0F, 0xC0,
	0x0F, 0xF0, 0x0F, 0xF8, 0x00, 0x1C, 0x00, 0x1C, 0x00, 0xF8,
	0x00, 0xF8, 0x00, 0x1C, 0x00, 0x1C, 0x0F, 0xF8, 0x0F, 0xF0,
	0x0C, 0x0C, 0x0E, 0x1C, 0x07, 0x38, 0x03, 0xF0, 0x01, 0xE0,
	0x01, 0xE0, 0x03, 0xF0, 0x07, 0x38, 0x0E, 0x1C, 0x0C, 0x0C,
	0x0C, 0x00, 0x0E, 0x00, 0x07, 0x0C, 0x03, 0x9C, 0x01, 0xF8,
	0x01, 0xF0, 0x03, 0x80, 0x07, 0x00, 0x0E, 0x00, 0x0C, 0x00,
	0x0C, 0x0C, 0x0C, 0x1C, 0x0C, 0x3C, 0x0C, 0x7C, 0x0C, 0xEC,
	0x0D, 0xCC, 0x0F, 0x8C, 0x0F, 0x0C, 0x0E, 0x0C, 0x0C, 0x0C,
	0x00, 0x00, 0x03, 0x00, 0x07, 0x80, 0x3F, 0xF0, 0x7C, 0xF8,
	0xE0, 0x1C, 0xC0, 0x0C, 0xC0, 0x0C, 0xC0, 0x0C, 0x00, 0x00,
	0x03, 0x0C, 0x03, 0x0C, 0x3F, 0xFC, 0x7F, 0xFC, 0xE3, 0x0C,
	0xC3, 0x0C, 0xC0, 0x0C, 0xE0, 0x0C, 0x70, 0x0C, 0x30, 0x0C,
	0x00, 0x00, 0xC0, 0x0C, 0xC0, 0x0C, 0xC0, 0x0C, 0xE0, 0x1C,
	0x7C, 0xF8, 0x3F, 0xF0, 0x07, 0x80, 0x03, 0x00, 0x00, 0x00,
	0xC0, 0x00, 0xC0, 0x00, 0xC0, 0x00, 0xC0, 0x00, 0xC0, 0x00,
	0xC0, 0x00, 0xC0, 0x00, 0xC0, 0x00, 0xC0, 0x00, 0xC0, 0x00,
	0xFF, 0xFC, 0xFF, 0xFC, 0xFF, 0xFC, 0xFF, 0xFC, 0xFF, 0xFC,
	0xFF, 0xFC, 0xFF, 0xFC, 0xFF, 0xFC, 0xFF, 0xFC, 0xFF, 0xFC
};


#endif // #ifdef _LCD_FONT_10x14_h
