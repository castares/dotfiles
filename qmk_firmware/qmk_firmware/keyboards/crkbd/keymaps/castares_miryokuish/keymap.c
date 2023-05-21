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
#define GUI_A LGUI_T(KC_A)
#define ALT_S LALT_T(KC_S)
#define CTL_D LCTL_T(KC_D)
#define SFT_F LSFT_T(KC_F)
#define ALTGR_V RALT_T(KC_V)

// Right-hand home row mods
#define SFT_J RSFT_T(KC_J)
#define CTL_K CTL_T(KC_K)
#define ALT_L LALT_T(KC_L)
#define GUI_SCLN RGUI_T(KC_SCLN)
#define ALTGR_M RALT_T(KC_M)

// Layers 
# define LY_NUM_TAB LT(1, KC_TAB)
# define LY_NAV_ESC LT(2, KC_ESC)
# define LY_SYM_BSPC LT(3, KC_BSPC)
# define LY_SYM2_DEL LT(4, KC_DEL)
# define LY_FN_P LT(5, KC_P)
# define LY_MEDIA_ESC LT(6, KC_ESC)

// LY_NAV One hand keys
# define UNDO LCTL(KC_Z) 
# define CUT LCTL(KC_X) 
# define COPY LCTL(KC_C) 
# define PASTE LCTL(KC_V) 
# define CTRL_B LCTL(KC_B) 

// TODO: fix this composition
# define S_ALL LGUI_T(LCTL(KC_A)) 
# define SAVE LALT_T(LCTL(KC_S))
# define GUI_D LCTL_T(LGUI(KC_D))
# define FIND LSFT_T(LCTL(KC_F))

# define FIND_NEXT LCTL(KC_G) 
# define GUI_Q LGUI(KC_Q)
# define GUI_W LGUI(KC_W)
# define GUI_E LGUI(KC_E)
# define RELOAD LCTL(KC_R) 
# define NEW_TAB LCTL(KC_T) 

// Tap Dance declarations
enum {
    TD_A,
    TD_E,
    TD_I,
    TD_O,
    TD_U,
    TD_N,
};

// TODO: only works with basic keycodes. Find another way
// // Tap Dance definitions
// tap_dance_action_t tap_dance_actions[] = {
//     // Tap once for letters with tilde in spanish 
//     [TD_A] = ACTION_TAP_DANCE_DOUBLE(KC_A, UC(0x00E1)),
//     [TD_E] = ACTION_TAP_DANCE_DOUBLE(KC_E, UC(0x00E9)),
//     [TD_I] = ACTION_TAP_DANCE_DOUBLE(KC_I, UC(0x00ED)),
//     [TD_O] = ACTION_TAP_DANCE_DOUBLE(KC_O, UC(0x00F3)),
//     [TD_U] = ACTION_TAP_DANCE_DOUBLE(KC_U, UC(0x00FA)),
//     [TD_N] = ACTION_TAP_DANCE_DOUBLE(KC_N, UC(0x00F1)),
// };

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
  [0] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      XXXXXXX , KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,                        KC_Y,    KC_U,    KC_I,    KC_O,   LY_FN_P, XXXXXXX,    
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
  LY_MEDIA_ESC, GUI_A,    ALT_S,  CTL_D,   SFT_F,   KC_G,                        KC_H,   SFT_J,   CTL_K,   ALT_L,   GUI_SCLN, CW_TOGG,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, KC_Z,    KC_X,    KC_C,    ALTGR_V,  KC_B,                        KC_N,   ALTGR_M, KC_COMM,  KC_DOT,   KC_SLSH,  XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                    LY_NAV_ESC, LY_NUM_TAB, KC_ENT,   MEH_T(KC_SPC), LY_SYM_BSPC, LY_SYM2_DEL
                                      //`--------------------------'  `--------------------------'
  ),

  [1] = LAYOUT_split_3x6_3( 
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      XXXXXXX, LGUI(KC_6), LGUI(KC_7),  LGUI(KC_8), LGUI(KC_9),LGUI(KC_0),       KC_ASTR,    KC_7,     KC_8,    KC_9, KC_COMM, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, LGUI(KC_5), LGUI(KC_4), LGUI(KC_3), LGUI(KC_2), LGUI(KC_1),       KC_PLUS,  KC_4,    KC_5,   KC_6,   KC_DOT ,  XXXXXXX, 
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX,  KC_LGUI, KC_LALT,  KC_LCTL, KC_RSFT,  KC_RALT,                   KC_MINUS,  KC_1,    KC_2,   KC_3,   KC_SLSH,  XXXXXXX, 
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                    KC_ESC, XXXXXXX, KC_ENT,           MEH_T(KC_SPC),   KC_BSPC,   KC_0
                                      //`--------------------------'  `--------------------------'
  ),

  [2] = LAYOUT_split_3x6_3( // Navigation
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      XXXXXXX, GUI_Q,  GUI_W, GUI_E, RELOAD,     NEW_TAB,                      KC_HOME, KC_PAGE_DOWN, KC_PAGE_UP, KC_END, KC_INSERT, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, KC_LGUI, KC_LALT, KC_LCTL, KC_RSFT, FIND_NEXT,                    KC_LEFT,  KC_DOWN,   KC_UP,  KC_RIGHT, XXXXXXX,  XXXXXXX,     
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, UNDO,    CUT,    COPY,   PASTE,      CTRL_B,                      KC_PSCR, XXXXXXX,  XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                    XXXXXXX, KC_TAB, KC_ENT,           MEH_T(KC_SPC), KC_BSPC, KC_DEL
                                      //`--------------------------'  `--------------------------'
  ),

  [3] = LAYOUT_split_3x6_3( //Symbols 1 - BSPC
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      XXXXXXX, KC_EXLM, KC_AT,  KC_CIRC,  KC_DLR, KC_PERC,                       XXXXXXX,  XXXXXXX,  XXXXXXX, XXXXXXX,  XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, KC_MINUS, KC_UNDS, KC_QUOT, KC_DQT, KC_TILDE,                     XXXXXXX,  KC_RSFT, KC_RCTL, KC_LALT, KC_RCTL, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, KC_GRAVE, KC_PLUS, KC_EQUAL, KC_BSLS, KC_PIPE,               XXXXXXX,  KC_RALT,  XXXXXXX, XXXXXXX,  XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                    KC_ESC, KC_TAB , KC_ENT,           MEH_T(KC_SPC), XXXXXXX, KC_BSPC
                                      //`--------------------------'  `--------------------------'
  ),

  [4] = LAYOUT_split_3x6_3( // Symbols 2 - DEL
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      XXXXXXX, KC_AMPR, KC_HASH, KC_LCBR, KC_RCBR, XXXXXXX,                     XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, KC_LBRC, KC_RBRC, KC_LPRN, KC_RPRN, KC_ASTR,                     XXXXXXX, KC_RSFT, KC_RCTL, KC_LALT, KC_RCTL, XXXXXXX,  
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, XXXXXXX, XXXXXXX, KC_LABK, KC_RABK,XXXXXXX,                     XXXXXXX, KC_RALT, XXXXXXX, XXXXXXX,  XXXXXXX, XXXXXXX,  
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                    KC_ESC, KC_TAB, KC_ENT,             MEH_T(KC_SPC), KC_BSPC, XXXXXXX
                                      //`--------------------------'  `--------------------------'
  ),


  [5] = LAYOUT_split_3x6_3( // Functions
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      XXXXXXX,  KC_F1,   KC_F2,   KC_F3,   KC_F4,    XXXXXXX,                   XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX,  KC_F5,   KC_F6,   KC_F7,   KC_F8,  XXXXXXX,                     XXXXXXX, KC_RSFT, KC_RCTL, KC_LALT, KC_RCTL, XXXXXXX,     
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, KC_F9,  KC_F10,   KC_F11,   KC_F12, XXXXXXX,                     XXXXXXX, KC_RALT,  XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          XXXXXXX, XXXXXXX, XXXXXXX,   MEH_T(KC_SPC), KC_BSPC, KC_DEL
                                      //`--------------------------'  `--------------------------'
  ),

  [6] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
     XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, RGB_TOG,                     KC_PSCR, KC_BRID, KC_BRIU, XXXXXXX, XXXXXXX, XXXXXXX, 
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
     XXXXXXX, RGB_MOD, RGB_HUI, RGB_SAI, RGB_VAI, XXXXXXX,                      KC_MPLY, KC_VOLD, KC_VOLU, KC_MPRV, KC_MNXT, KC_AUDIO_MUTE,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
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
#define L_NUM_TAB 2
#define L_NAV_ENT 4
#define L_SYM_BSPC 8
#define L_SYM2_DEL 16
#define L_FN_QUOT 32
#define L_MEDIA_ESC 64

void oled_render_layer_state(void) {
  oled_write_P(PSTR("Layer: "), false);
  switch (layer_state) {
  case L_BASE:
    oled_write_ln_P(PSTR("Qwerty"), false);
    break;
  case L_NUM_TAB:
    oled_write_ln_P(PSTR("Numbers"), false);
    break;
  case L_SYM_BSPC:
    oled_write_ln_P(PSTR("Symbols 1"), false);
    break;
  case L_SYM2_DEL:
    oled_write_ln_P(PSTR("Symbols 2"), false);
    break;
  case L_NAV_ENT:
    oled_write_ln_P(PSTR("Navigation"), false);
    break;
  case L_FN_QUOT:
    oled_write_ln_P(PSTR("Functions"), false);
    break;
  case L_MEDIA_ESC:
    oled_write_ln_P(PSTR("Media"), false);
    break;
  }
}

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
