/*
Copyright 2019 @foostan
Copyright 2020 Drashna Jaelre <@drashna>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#include QMK_KEYBOARD_H
#include <stdio.h>

// Left-hand home row mods
#define CTL_A LCTL_T(KC_A)
#define ALT_S LALT_T(KC_S)
#define GUI_D LGUI_T(KC_D)
#define SFT_F LSFT_T(KC_F)
#define ALTGR_V RALT_T(KC_V)

// Right-hand home row mods
#define SFT_J RSFT_T(KC_J)
#define GUI_K GUI_T(KC_K)
#define ALT_L LALT_T(KC_L)
#define CTL_SCLN RCTL_T(KC_SCLN)
#define ALTGR_M RALT_T(KC_M)

// Layers 
# define LY_NUM_TAB LT(1, KC_TAB)
# define LY_SYM_BSPC LT(2, KC_BSPC)
# define LY_SYM2_DEL LT(3, KC_DEL)
# define LY_NAV_ENT LT(4, KC_ENT)
# define LY_FN_QUOT LT(5, KC_QUOT)
# define LY_MEDIA_ESC LT(6, KC_ESC)

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
  [0] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      XXXXXXX , KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,                      KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,     XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
  LY_MEDIA_ESC, CTL_A,    ALT_S,  GUI_D,   SFT_F,   KC_G,                      KC_H,   SFT_J,   GUI_K,   ALT_L,   CTL_SCLN, LY_FN_QUOT,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, KC_Z,    KC_X,    KC_C,    ALTGR_V,    KC_B,                     KC_N,   ALTGR_M, KC_COMM,  KC_DOT,   KC_SLSH,  XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                    KC_LGUI, LY_NUM_TAB, LY_NAV_ENT,   MEH_T(KC_SPC), LY_SYM_BSPC, LY_SYM2_DEL
                                      //`--------------------------'  `--------------------------'
  ),

  [1] = LAYOUT_split_3x6_3( // Numbers & Workspaces  TODO: Add home row mods on Left-hand
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      KC_CAPS, LGUI(KC_6), LGUI(KC_7),  LGUI(KC_8), LGUI(KC_9),LGUI(KC_0),       KC_ASTR,    KC_7,     KC_8,    KC_9, KC_COMM, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
 LCTL_T(KC_ESC), LGUI(KC_5), LGUI(KC_4), LGUI(KC_3), LGUI(KC_2), LGUI(KC_1),     KC_PLUS,  KC_4,    KC_5,   KC_6,   KC_DOT ,  KC_QUOT,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX,  KC_RCTL, KC_LALT,  KC_RGUI, KC_RSFT,  KC_RALT,                     KC_MINUS,  KC_1,    KC_2,   KC_3,   KC_SLSH,  XXXXXXX, 
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                    KC_LGUI, XXXXXXX, KC_ENT,           MEH_T(KC_SPC),   KC_BSPC,   KC_0
                                      //`--------------------------'  `--------------------------'
  ),

  [2] = LAYOUT_split_3x6_3( //Symbols 1 - BSPC
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      XXXXXXX, KC_EXLM, KC_AT,  KC_HASH,  KC_DLR, KC_PERC,                       XXXXXXX,  XXXXXXX,  XXXXXXX, XXXXXXX,  XXXXXXX, XXXXXXX
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      KC_ESC, KC_MINUS, KC_UNDS, KC_PLUS, KC_EQUAL, KC_TILDE,                    XXXXXXX,  KC_RSFT, KC_RGUI, KC_LALT, KC_RCTL, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, KC_BACKSLASH, KC_PIPE,                  KC_CAPS,  KC_RALT,  XXXXXXX, XXXXXXX,  XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                    KC_LGUI, KC_TAB , KC_ENT,           MEH_T(KC_SPC), XXXXXXX, KC_BSPC
                                      //`--------------------------'  `--------------------------'
  ),


  [3] = LAYOUT_split_3x6_3( // Symbols 2 - DEL
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      XXXXXXX,  KC_CIRC, KC_AMPR, KC_ASTR, KC_LBRC, KC_RBRC,                     XXXXXXX,  XXXXXXX, XXXXXXX, XXXXXXX,  XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      KC_ESC,  KC_GRAVE, KC_QUOT, KC_DQT, KC_LPRN, KC_RPRN,                      XXXXXXX,  KC_RSFT, KC_RGUI, KC_LALT, KC_RCTL, XXXXXXX,  
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, XXXXXXX,  KC_LABK, KC_RABK, KC_LCBR, KC_RCBR,                     XXXXXXX,  KC_RALT, XXXXXXX, XXXXXXX,  XXXXXXX, XXXXXXX,  
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                    KC_LGUI, KC_TAB, KC_ENT,             MEH_T(KC_SPC), KC_BSPC, XXXXXXX
                                      //`--------------------------'  `--------------------------'
  ),

  [4] = LAYOUT_split_3x6_3( 
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      KC_HOME, KC_PAGE_DOWN,  KC_PAGE_UP, KC_END, KC_INSERT, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, KC_RCTL, KC_LALT, KC_RGUI, KC_RSFT, XXXXXXX,                     KC_LEFT,  KC_DOWN,   KC_UP,  KC_RIGHT, XXXXXXX,  XXXXXXX,     
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, KC_RALT, XXXXXXX,                      XXXXXXX, XXXXXXX,  XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                    KC_LGUI, KC_TAB, XXXXXXX,           MEH_T(KC_SPC), KC_BSPC, KC_DEL
                                      //`--------------------------'  `--------------------------'
  ),

  [5] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      XXXXXXX,  KC_F1,   KC_F2,   KC_F3,   KC_F4,    XXXXXXX,                   XXXXXXX,  XXXXXXX,   XXXXXXX,  XXXXXXX, XXXXXXX,  XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX,  KC_F5,   KC_F6,   KC_F7,   KC_F8,  XXXXXXX,                     XXXXXXX,  KC_RSFT, KC_RGUI, KC_LALT, KC_RCTL, XXXXXXX,     
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, KC_F9,  KC_F10,   KC_F11,   KC_F12, XXXXXXX,                      XXXXXXX, KC_RALT,  XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          XXXXXXX, XXXXXXX, XXXXXXX,   MEH_T(KC_SPC), KC_BSPC, KC_DEL
                                      //`--------------------------'  `--------------------------'
  ),

  [6] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
     XXXXXXX, RGB_TOG, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      KC_PSCR, KC_BRID, KC_BRIU, XXXXXXX, XXXXXXX, XXXXXXX, 
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
     XXXXXXX, RGB_MOD, RGB_HUI, RGB_SAI, RGB_VAI, XXXXXXX,                      KC_MPLY, KC_VOLD, KC_VOLU, KC_MPRV, KC_MNXT, KC_AUDIO_MUTE,
     XXXXXXX, RGB_RMOD, RGB_HUD, RGB_SAD, RGB_VAD, QK_BOOT,                     DT_PRNT, DT_DOWN, DT_UP, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          XXXXXXX, XXXXXXX, XXXXXXX,   MEH_T(KC_SPC), KC_BSPC, KC_DEL
                                      //`--------------------------'  `--------------------------'
  )
};

#ifdef OLED_ENABLE
oled_rotation_t oled_init_user(oled_rotation_t rotation) {
  if (!is_keyboard_master()) {
    return OLED_ROTATION_180;  // flips the display 180 degrees if offhand
  }
  return rotation;
}

#define L_BASE 0
#define L_NUMBERS 2
#define L_SYMBOLS 4
#define L_FUNCTIONS 8
#define L_CONFIG 16

void oled_render_layer_state(void) {
    oled_write_P(PSTR("Layer: "), false);
    switch (layer_state) {
        case L_BASE:
            oled_write_ln_P(PSTR("Base"), false);
            break;
        case L_NUMBERS:
            oled_write_ln_P(PSTR("Numbers"), false);
            break;
        case L_SYMBOLS:
            oled_write_ln_P(PSTR("Symbols"), false);
            break;
        case L_FUNCTIONS:
            oled_write_ln_P(PSTR("Functions"), false);
            break;
        case L_CONFIG:
            oled_write_ln_P(PSTR("Config"), false);
            break;
    }
}

//KEY_OVERRIDE_ENABLE
const key_override_t delete_key_override = ko_make_basic(MOD_MASK_SHIFT, KC_BSPC, KC_DEL);

// This globally defines all key overrides to be used
const key_override_t **key_overrides = (const key_override_t *[]){
    &delete_key_override,
    NULL // Null terminate the array of overrides!
};

// OLED CONFIG

char keylog_str[24] = {};

const char code_to_name[60] = {
    ' ', ' ', ' ', ' ', 'a', 'b', 'c', 'd', 'e', 'f',
    'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p',
    'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
    '1', '2', '3', '4', '5', '6', '7', '8', '9', '0',
    'R', 'E', 'B', 'T', '_', '-', '=', '[', ']', '\\',
    '#', ';', '\'', '`', ',', '.', '/', ' ', ' ', ' '};

void set_keylog(uint16_t keycode, keyrecord_t *record) {
  char name = ' ';
    if ((keycode >= QK_MOD_TAP && keycode <= QK_MOD_TAP_MAX) ||
        (keycode >= QK_LAYER_TAP && keycode <= QK_LAYER_TAP_MAX)) { keycode = keycode & 0xFF; }
  if (keycode < 60) {
    name = code_to_name[keycode];
  }

  // update keylog
  snprintf(keylog_str, sizeof(keylog_str), "%dx%d, k%2d : %c",
           record->event.key.row, record->event.key.col,
           keycode, name);
}

void oled_render_keylog(void) {
    oled_write(keylog_str, false);
}

void render_bootmagic_status(bool status) {
    /* Show Ctrl-Gui Swap options */
    static const char PROGMEM logo[][2][3] = {
        {{0x97, 0x98, 0}, {0xb7, 0xb8, 0}},
        {{0x95, 0x96, 0}, {0xb5, 0xb6, 0}},
    };
    if (status) {
        oled_write_ln_P(logo[0][0], false);
        oled_write_ln_P(logo[0][1], false);
    } else {
        oled_write_ln_P(logo[1][0], false);
        oled_write_ln_P(logo[1][1], false);
    }
}

void oled_render_logo(void) {
    static const char PROGMEM crkbd_logo[] = {
        0x80, 0x81, 0x82, 0x83, 0x84, 0x85, 0x86, 0x87, 0x88, 0x89, 0x8a, 0x8b, 0x8c, 0x8d, 0x8e, 0x8f, 0x90, 0x91, 0x92, 0x93, 0x94,
        0xa0, 0xa1, 0xa2, 0xa3, 0xa4, 0xa5, 0xa6, 0xa7, 0xa8, 0xa9, 0xaa, 0xab, 0xac, 0xad, 0xae, 0xaf, 0xb0, 0xb1, 0xb2, 0xb3, 0xb4,
        0xc0, 0xc1, 0xc2, 0xc3, 0xc4, 0xc5, 0xc6, 0xc7, 0xc8, 0xc9, 0xca, 0xcb, 0xcc, 0xcd, 0xce, 0xcf, 0xd0, 0xd1, 0xd2, 0xd3, 0xd4,
        0};
    oled_write_P(crkbd_logo, false);
}

bool oled_task_user(void) {
    if (is_keyboard_master()) {
        oled_render_layer_state();
        oled_render_keylog();
    } else {
        oled_render_logo();
    }
    return false;
}

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  if (record->event.pressed) {
    set_keylog(keycode, record);
  }
  return true;
}
#endif // OLED_ENABLE
