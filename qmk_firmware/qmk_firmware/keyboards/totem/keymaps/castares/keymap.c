/*
                                             ▀▀▀▀▀     ▀▀▀▀▀          ▀▀█▀▀
                                             ▄▀▀▀▄  ▄  ▄▀▀▀▄  ▄  ▄▀▀▀▄  █  ▄▀▀▀▄
                                             █   █  █  █   █  █  █   █  █  █   █
                                              ▀▀▀   █   ▀▀▀   █   ▀▀▀   ▀   ▀▀▀
                                                    █      ▄▄▄█▄▄▄    █   █
                                                    ▀      █  █  █     █▄█
                                                  ▀▀▀▀▀    █  █  █      ▀
                                                           ▀  ▀  ▀  D E F A U L T

▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
*/

#include QMK_KEYBOARD_H
#include <stdio.h>
#include "totem.h"

// ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
// │ D E F I N I T I O N S                                                                                                  │
// └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
// ▝▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▘

// ┌─────────────────────────────────────────────────┐
// │ d e f i n e   l a y e r s                       │
// └─────────────────────────────────────────────────┘

enum totem_layers {
    _QWERTY,
    _QWERTY_MAC,
    _COLEMAK,
    _NAVIGATION,
    _NUMBERS,
    _SYMBOLS,
    _FUNCTION_KEYS,
    _SYSTEM_CONFIG,
};

// ┌─────────────────────────────────────────────────┐
// │ d e f i n e   k e y c o d e s                   │
// └─────────────────────────────────────────────────┘

enum custom_keycodes {
    COLEMAK = SAFE_RANGE,
    QWERTY,
    LTHUMB_2,
    RTHUMB2,
    ADJUST,
    OS_SWAP,
    MAKE_H,
    SNAP,
    MAC,
    LINUX
};


// ┌─────────────────────────────────────────────────┐
// │ d e f i n e   m a c r o n a m e s               │
// └─────────────────────────────────────────────────┘

// LEFT HAND HOME ROW MODS QWERTY ├──────────────────┐

#define GUI_A MT(MOD_LGUI, KC_A)
#define ALT_S MT(MOD_LALT, KC_S)
#define CTL_D MT(MOD_LCTL, KC_D)
#define SHT_F MT(MOD_LSFT, KC_F)
#define ALTGR_V MT(MOD_RALT, KC_V)

// RIGHT HAND HOME ROW MODS QWERTY ├─────────────────┐

#define SHT_J MT(MOD_RSFT, KC_J)
#define CTL_K MT(MOD_LCTL, KC_K)
#define ALT_L MT(MOD_LALT, KC_L)
#define GUI_S MT(MOD_LGUI, KC_SCLN)
#define ALTGR_M MT(MOD_RALT, KC_M)


// LEFT HAND HOME ROW MODS COLEMAK ├─────────────────┐

#define GUI_A MT(MOD_LGUI, KC_A)
#define ALT_R MT(MOD_LALT, KC_R)
#define CTL_S MT(MOD_LCTL, KC_S)
#define SHT_T MT(MOD_LSFT, KC_T)

// RIGHT HAND HOME ROW MODS COLEMAK ├────────────────┐

#define SHT_N MT(MOD_RSFT, KC_N)
#define CTL_E MT(MOD_LCTL, KC_E)
#define ALT_I MT(MOD_LALT, KC_I)
#define GUI_O MT(MOD_LGUI, KC_O)

// Thumb Keys
#define LPINKY LT(_SYSTEM_CONFIG, XXXXXXX) // TODO: Add Repeat key
#define RPINKY LT(_FUNCTION_KEYS, KC_DEL)

#define LTHUMB1 LT(_NAVIGATION, KC_ENT)
#define LTHUMB2 LT(_NUMBERS, KC_TAB)
#define LTHUMB3 MT(MOD_LCTL, KC_ESC)
#define LTHUMB3_MAC MT(MOD_LGUI, KC_ESC)

#define RTHUMB1 MEH_T(KC_SPC)
#define RTHUMB2 LT(_SYMBOLS, KC_BSPC)
#define RTHUMB3 CW_TOGG

// Switch to workspace keys
#define WKS1 LGUI(KC_1)
#define WKS2 LGUI(KC_2)
#define WKS3 LGUI(KC_3)
#define WKS4 LGUI(KC_4)
#define WKS5 LGUI(KC_5)
#define WKS6 LGUI(KC_6)
#define WKS7 LGUI(KC_7)
#define WKS8 LGUI(KC_8)
#define WKS9 LGUI(KC_9)
#define WKS0 LGUI(KC_0)

// ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
// │ K E Y M A P S                                                                                                          │
// └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
// ▝▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▘

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

 /*
   ┌─────────────────────────────────────────────────┐
   │ q w e r t y                                     │      ╭╮╭╮╭╮╭╮
   └─────────────────────────────────────────────────┘      │╰╯╰╯╰╯│
             ┌─────────┬─────────┬─────────┬─────────┬──────╨──┐┌──╨──────┬─────────┬─────────┬─────────┬─────────┐
     ╌┄┈┈───═╡    Q    │    W    │    E    │    R    │    T    ││    Y    │    U    │    I    │    O    │    P    │
             ├─────────┼─────────┼─────────┼─────────┼─────────┤├─────────┼─────────┼─────────┼─────────┼─────────┤
             │    A    │    S    │    D    │    F    │    G    ││    H    │    J    │    K    │    L    │    ;    │
   ┌─────────┼─────────┼─────────┼─────────┼─────────┼─────────┤├─────────┼─────────┼─────────┼─────────┼─────────┼─────────┐
   │ OS SFT  │    Z    │    X    │    C    │    V    │    B    ││    N    │    M    │    ,    │    .    │    /    │CAPS WORD│
   └─────────┴─────────┴─────────┼─────────┼─────────┼─────────┤├─────────┼─────────┼─────────┼─────────┴─────────┴─────────┘
                                 │CTRL/CMD │ NAV/TAB │NUM/SPC  ││ MEH/ENT │SYM/BSPC │SYST/DEL │
                                 └─────────┴─────────┴─────────┘└─────────┴─────────┴─────────┘*/

   [_QWERTY] = LAYOUT(
 //╷         ╷         ╷         ╷         ╷         ╷         ╷╷         ╷         ╷         ╷         ╷         ╷         ╷
              KC_Q,     KC_W,     KC_E,     KC_R,     KC_T,      KC_Y,     KC_U,     KC_I,     KC_O,     KC_P,
              GUI_A,    ALT_S,    CTL_D,    SHT_F,    KC_G,      KC_H,     SHT_J,    CTL_K,    ALT_L,    GUI_S,
    LPINKY,   KC_Z,     KC_X,     KC_C,     ALTGR_V,  KC_B,      KC_N,     ALTGR_M,  KC_COMM,  KC_DOT,   KC_SLSH,  RPINKY,
                                  LTHUMB3,  LTHUMB2, LTHUMB1,   RTHUMB1,   RTHUMB2,    RTHUMB3
 ),
/*

   ╺━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╸

   ┌─────────────────────────────────────────────────┐
   │ c o l e m a k                                   │      ╭╮╭╮╭╮╭╮
   └─────────────────────────────────────────────────┘      │╰╯╰╯╰╯│
             ┌─────────┬─────────┬─────────┬─────────┬──────╨──┐┌──╨──────┬─────────┬─────────┬─────────┬─────────┐
     ╌┄┈┈───═╡    Q    │    W    │    F    │    P    │    G    ││    J    │    L    │    U    │    Y    │    ;    │
             ├─────────┼─────────┼─────────┼─────────┼─────────┤├─────────┼─────────┼─────────┼─────────┼─────────┤
             │    A    │    R    │    S    │    T    │    D    ││    H    │    N    │    E    │    I    │    O    │
   ┌─────────┼─────────┼─────────┼─────────┼─────────┼─────────┤├─────────┼─────────┼─────────┼─────────┼─────────┼─────────┐
   │ OS SFT  │    Z    │    X    │    C    │    V    │    B    ││    K    │    M    │    ,    │    .    │    /    │CAPS WORD│
   └─────────┴─────────┴─────────┼─────────┼─────────┼─────────┤├─────────┼─────────┼─────────┼─────────┴─────────┴─────────┘
                                 │CTRL/CMD │ NAV/TAB │NUM/SPC  ││ MEH/ENT │SYM/BSPC │SYST/DEL │
                                 └─────────┴─────────┴─────────┘└─────────┴─────────┴─────────┘*/
   [_QWERTY_MAC] = LAYOUT(
 //╷         ╷         ╷         ╷         ╷         ╷         ╷╷         ╷         ╷         ╷         ╷         ╷         ╷
              KC_Q,     KC_W,     KC_E,     KC_R,     KC_T,      KC_Y,     KC_U,     KC_I,     KC_O,     KC_P,
              GUI_A,    ALT_S,    CTL_D,    SHT_F,    KC_G,      KC_H,     SHT_J,    CTL_K,    ALT_L,    GUI_S,
    LPINKY,   KC_Z,     KC_X,     KC_C,     ALTGR_V,  KC_B,      KC_N,     ALTGR_M,  KC_COMM,  KC_DOT,   KC_SLSH,  RPINKY,
                                  LTHUMB3_MAC,  LTHUMB2, LTHUMB1,   RTHUMB1,   RTHUMB2,    RTHUMB3
 ),
/*

   ╺━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╸

   ┌─────────────────────────────────────────────────┐
   │ c o l e m a k                                   │      ╭╮╭╮╭╮╭╮
   └─────────────────────────────────────────────────┘      │╰╯╰╯╰╯│
             ┌─────────┬─────────┬─────────┬─────────┬──────╨──┐┌──╨──────┬─────────┬─────────┬─────────┬─────────┐
     ╌┄┈┈───═╡    Q    │    W    │    F    │    P    │    G    ││    J    │    L    │    U    │    Y    │    ;    │
             ├─────────┼─────────┼─────────┼─────────┼─────────┤├─────────┼─────────┼─────────┼─────────┼─────────┤
             │    A    │    R    │    S    │    T    │    D    ││    H    │    N    │    E    │    I    │    O    │
   ┌─────────┼─────────┼─────────┼─────────┼─────────┼─────────┤├─────────┼─────────┼─────────┼─────────┼─────────┼─────────┐
   │ OS SFT  │    Z    │    X    │    C    │    V    │    B    ││    K    │    M    │    ,    │    .    │    /    │CAPS WORD│
   └─────────┴─────────┴─────────┼─────────┼─────────┼─────────┤├─────────┼─────────┼─────────┼─────────┴─────────┴─────────┘
                                 │CTRL/CMD │ NAV/TAB │NUM/SPC  ││ MEH/ENT │SYM/BSPC │SYST/DEL │
                                 └─────────┴─────────┴─────────┘└─────────┴─────────┴─────────┘*/

   [_COLEMAK] = LAYOUT(
 //╷         ╷         ╷         ╷         ╷         ╷         ╷╷         ╷         ╷         ╷         ╷         ╷         ╷
              KC_Q,     KC_W,     KC_F,     KC_P,     KC_G,      KC_J,     KC_L,     KC_U,     KC_Y,     KC_SCLN,
              GUI_A,    ALT_R,    CTL_S,    SHT_T,    KC_D,      KC_H,     SHT_N,    CTL_E,    ALT_I,    GUI_O,
    LPINKY,   KC_Z,     KC_X,     KC_C,     ALTGR_V,  KC_B,      KC_K,     ALTGR_M,  KC_COMM,  KC_DOT,   KC_SLSH,  RPINKY,
                                  LTHUMB3,  LTHUMB2, LTHUMB1,   RTHUMB1,   RTHUMB2,    RTHUMB3
 ),
 /*
   ╺━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╸

   ┌─────────────────────────────────────────────────┐
   │ NUMBERS                                         │      ╭╮╭╮╭╮╭╮
   └─────────────────────────────────────────────────┘      │╰╯╰╯╰╯│
             ┌─────────┬─────────┬─────────┬─────────┬──────╨──┐┌──╨──────┬─────────┬─────────┬─────────┬─────────┐
     ╌┄┈┈───═╡         │         │         │         │         ││    *    │    7    │    8    │    9    │    ,    │
             ├─────────┼─────────┼─────────┼─────────┼─────────┤├─────────┼─────────┼─────────┼─────────┼─────────┤
             │   GUI   │   ALT   │  CTRL   │  SHIFT  │         ││    +    │    4    │    5    │    6    │    .    │
   ┌─────────┼─────────┼─────────┼─────────┼─────────┼─────────┤├─────────┼─────────┼─────────┼─────────┼─────────┼─────────┐
   │         │         │         │         │  RALT   │         ││    +    │    1    │    2    │    3    │    /    │         │
   └─────────┴─────────┴─────────┼─────────┼─────────┼─────────┤├─────────┼─────────┼─────────┼─────────┴─────────┴─────────┘
                                 │  _____  │  _____  │  _____  ││   SPC   │  BSPC   │    0    │
                                 └─────────┴─────────┴─────────┘└─────────┴─────────┴─────────┘ */

   [_NUMBERS] = LAYOUT(
 //╷         ╷         ╷         ╷         ╷         ╷         ╷╷         ╷         ╷         ╷         ╷         ╷         ╷
                WKS6,     WKS7,     WKS8,     WKS9,     WKS0,     KC_ASTR,    KC_7,      KC_8,    KC_9,    KC_COMM,
               KC_LGUI,  KC_LALT,  KC_LCTL,  KC_RSFT,  KC_RALT,   KC_PLUS,    KC_4,      KC_5,    KC_6,    KC_DOT ,
    XXXXXXX,    WKS5,     WKS4,     WKS3,     WKS2,     WKS1,     KC_MINUS,   KC_1,      KC_2,    KC_3,    KC_SLSH,  XXXXXXX,
                                   KC_ESC,   XXXXXXX,   KC_ENT,   KC_SPC,     KC_BSPC,   KC_0
 ),
 /*
   ╺━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╸

   ┌─────────────────────────────────────────────────┐
   │ NAVIGATION                                      │      ╭╮╭╮╭╮╭╮
   └─────────────────────────────────────────────────┘      │╰╯╰╯╰╯│
             ┌─────────┬─────────┬─────────┬─────────┬──────╨──┐┌──╨──────┬─────────┬─────────┬─────────┬─────────┐
     ╌┄┈┈───═╡  WKS6   │  WKS7   │   WKS8  │   WKS9  │  WKS0   ││    #    │    ^    │    $    │    *    │    %    │
             ├─────────┼─────────┼─────────┼─────────┼─────────┤├─────────┼─────────┼─────────┼─────────┼─────────┤
             │   GUI   │   ALT   │  CTRL   │  SHIFT  │  RALT   ││    ←    │    ↓    │    ↑    │    →    │    :    │
   ┌─────────┼─────────┼─────────┼─────────┼─────────┼─────────┤├─────────┼─────────┼─────────┼─────────┼─────────┼─────────┐
   │         │  WKS5   │  WKS4   │   WKS3  │   WKS2  │  WKS1   ││   ~     │    `    │    \    │    |    │    ?    │         │
   └─────────┴─────────┴─────────┼─────────┼─────────┼─────────┤├─────────┼─────────┼─────────┼─────────┴─────────┴─────────┘
                                 │  _____  │  _____  │  _____  ││   SPC   │  DEL    │  BSPC   │
                                 └─────────┴─────────┴─────────┘└─────────┴─────────┴─────────┘ */

   [_NAVIGATION] = LAYOUT(
 //╷         ╷         ╷         ╷         ╷         ╷         ╷╷         ╷         ╷         ╷         ╷         ╷         ╷
              XXXXXXX,  XXXXXXX,   XXXXXXX,  XXXXXXX,  XXXXXXX,   XXXXXXX,  XXXXXXX,  XXXXXXX,  XXXXXXX,  XXXXXXX,
              KC_LGUI,  KC_LALT,   KC_LCTL,  KC_RSFT,  XXXXXXX,   KC_LEFT,  KC_DOWN,  KC_UP,   KC_RIGHT, KC_COLON,
    XXXXXXX,  XXXXXXX,  XXXXXXX,   XXXXXXX,  KC_RALT,  XXXXXXX,   XXXXXXX,  XXXXXXX,  KC_LABK, KC_RABK,  KC_QUESTION, XXXXXXX,
                                   KC_ESC,   KC_TAB,   XXXXXXX,   KC_SPC,   KC_DEL,   XXXXXXX
 ),
 /*
   ╺━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╸

   ┌─────────────────────────────────────────────────┐
   │ SYMBOLS                                         │      ╭╮╭╮╭╮╭╮
   └─────────────────────────────────────────────────┘      │╰╯╰╯╰╯│
             ┌─────────┬─────────┬─────────┬─────────┬──────╨──┐┌──╨──────┬─────────┬─────────┬─────────┬─────────┐
     ╌┄┈┈───═╡    !    │    @    │    '    │    {    │    }    ││         │         │         │         │         │
             ├─────────┼─────────┼─────────┼─────────┼─────────┤├─────────┼─────────┼─────────┼─────────┼─────────┤
             │    -    │    _    │    "    │    (    │    )    ││         │  SHIFT  │   CTRL  │   ALT   │   GUI   │
   ┌─────────┼─────────┼─────────┼─────────┼─────────┼─────────┤├─────────┼─────────┼─────────┼─────────┼─────────┼─────────┐
   │         │    &    │    +    │    =    │   [     │    ]    ││         │  RALT   │         │         │         │         │
   └─────────┴─────────┴─────────┼─────────┼─────────┼─────────┤├─────────┼─────────┼─────────┼─────────┴─────────┴─────────┘
                                 │   ESC   │   TAB   │  ENTER  ││   SPC   │  _____  │   DEL   │
                                 └─────────┴─────────┴─────────┘└─────────┴─────────┴─────────┘ */

   [_SYMBOLS] = LAYOUT(
 //╷         ╷         ╷         ╷         ╷         ╷         ╷╷         ╷         ╷         ╷         ╷         ╷         ╷
              KC_EXLM,  KC_AT,    KC_QUOT,  KC_LCBR,  KC_RCBR,   KC_PERC,  KC_ASTR,  XXXXXXX,   XXXXXXX,  XXXXXXX,
              KC_MINUS, KC_UNDS,  KC_DQT,   KC_LPRN,  KC_RPRN,   KC_HASH,  KC_RSFT,  KC_RCTL,  KC_LALT,  KC_RGUI,
    XXXXXXX,  KC_AMPR,  KC_PLUS,  KC_EQUAL, KC_LBRC,  KC_RBRC,   KC_CIRC,  KC_DLR,   KC_GRAVE,  XXXXXXX, XXXXXXX,  XXXXXXX,
                                  KC_TILDE, KC_BSLS,  KC_PIPE,   KC_SPC,  XXXXXXX,  KC_DEL
 ),
 /*
   ╺━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╸

   ┌─────────────────────────────────────────────────┐
   │ FUNCTION KEYS                                   │      ╭╮╭╮╭╮╭╮
   └─────────────────────────────────────────────────┘      │╰╯╰╯╰╯│
             ┌─────────┬─────────┬─────────┬─────────┬──────╨──┐┌──╨──────┬─────────┬─────────┬─────────┬─────────┐
     ╌┄┈┈───═╡  RESET  │         │         │         │         ││         │   F7    │   F8    │   F9    │   F12   │
             ├─────────┼─────────┼─────────┼─────────┼─────────┤├─────────┼─────────┼─────────┼─────────┼─────────┤
             │ DEBUG   │ QWERTY  │         │         │         ││         │   F4    │   F5    │   F6    │   F11   │
   ┌─────────┼─────────┼─────────┼─────────┼─────────┼─────────┤├─────────┼─────────┼─────────┼─────────┼─────────┼─────────┐
   │  MAKE   │ OS SWAP │ COLEMAK │         │         │         ││         │   F1    │   F2    │   F3    │   F10   │   F13   │
   └─────────┴─────────┴─────────┼─────────┼─────────┼─────────┤├─────────┼─────────┼─────────┼─────────┴─────────┴─────────┘
                                 │    ▼    │    ▼    │    ▼    ││    ▼    │    ▼    │    ▼    │
                                 └─────────┴─────────┴─────────┘└─────────┴─────────┴─────────┘ */

   [_FUNCTION_KEYS] = LAYOUT(
 //╷         ╷         ╷         ╷         ╷         ╷         ╷╷         ╷         ╷         ╷         ╷         ╷         ╷
                KC_F1,   KC_F2,   KC_F3,   KC_F4,    XXXXXXX,    XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
                KC_F5,   KC_F6,   KC_F7,   KC_F8,    XXXXXXX,      XXXXXXX, KC_RSFT, KC_RCTL, KC_LALT, KC_RCTL,
      XXXXXXX,  KC_F9,  KC_F10,   KC_F11,   KC_F12, XXXXXXX,      XXXXXXX, KC_RALT,  XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
                                  KC_ESC,  KC_TAB,  KC_ENT,   KC_SPC,  KC_BSPC,  XXXXXXX
 ),
 /*
   ╺━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╸

   ┌─────────────────────────────────────────────────┐
   │ a d j u s t                                     │      ╭╮╭╮╭╮╭╮
   └─────────────────────────────────────────────────┘      │╰╯╰╯╰╯│
             ┌─────────┬─────────┬─────────┬─────────┬──────╨──┐┌──╨──────┬─────────┬─────────┬─────────┬─────────┐
     ╌┄┈┈───═╡  RESET  │         │         │         │         ││         │   F7    │   F8    │   F9    │   F12   │
             ├─────────┼─────────┼─────────┼─────────┼─────────┤├─────────┼─────────┼─────────┼─────────┼─────────┤
             │ DEBUG   │ QWERTY  │         │         │         ││         │   F4    │   F5    │   F6    │   F11   │
   ┌─────────┼─────────┼─────────┼─────────┼─────────┼─────────┤├─────────┼─────────┼─────────┼─────────┼─────────┼─────────┐
   │  MAKE   │ OS SWAP │ COLEMAK │         │         │         ││         │   F1    │   F2    │   F3    │   F10   │   F13   │
   └─────────┴─────────┴─────────┼─────────┼─────────┼─────────┤├─────────┼─────────┼─────────┼─────────┴─────────┴─────────┘
                                 │    ▼    │    ▼    │    ▼    ││    ▼    │    ▼    │    ▼    │
                                 └─────────┴─────────┴─────────┘└─────────┴─────────┴─────────┘ */

   [_SYSTEM_CONFIG] = LAYOUT(
 //╷         ╷         ╷         ╷         ╷         ╷         ╷╷         ╷         ╷         ╷         ╷         ╷         ╷
              XXXXXXX,  XXXXXXX,  XXXXXXX,  QK_BOOT,  XXXXXXX,   KC_PSCR,  KC_BRID,  KC_BRIU,  XXXXXXX,  XXXXXXX,
              XXXXXXX,  XXXXXXX,  XXXXXXX,  DB_TOGG,  XXXXXXX,   KC_MPLY,  KC_VOLD,  KC_VOLU,  KC_MPRV,  KC_MNXT,
    XXXXXXX,  XXXXXXX,  XXXXXXX,  XXXXXXX,  MAKE_H,   XXXXXXX,   KC_AUDIO_MUTE, XXXXXXX,  XXXXXXX, XXXXXXX,  XXXXXXX,  XXXXXXX,
                                  XXXXXXX,  MAC,      LINUX,     XXXXXXX,  XXXXXXX,  XXXXXXX
 )

/*
   ╺━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╸

   ┌─────────────────────────────────────────────────┐
   │ t e m p l a t e                                 │      ╭╮╭╮╭╮╭╮
   └─────────────────────────────────────────────────┘      │╰╯╰╯╰╯│
             ┌─────────┬─────────┬─────────┬─────────┬──────╨──┐┌──╨──────┬─────────┬─────────┬─────────┬─────────┐
     ╌┄┈┈───═╡         │         │         │         │         ││         │         │         │         │         │
             ├─────────┼─────────┼─────────┼─────────┼─────────┤├─────────┼─────────┼─────────┼─────────┼─────────┤
             │         │         │         │         │         ││         │         │         │         │         │
   ┌─────────┼─────────┼─────────┼─────────┼─────────┼─────────┤├─────────┼─────────┼─────────┼─────────┼─────────┼─────────┐
   │         │         │         │         │         │         ││         │         │         │         │         │         │
   └─────────┴─────────┴─────────┼─────────┼─────────┼─────────┤├─────────┼─────────┼─────────┼─────────┴─────────┴─────────┘
                                 │         │         │         ││         │         │         │
                                 └─────────┴─────────┴─────────┘└─────────┴─────────┴─────────┘

   [_TEMPLATE] = LAYOUT(
 //╷         ╷         ╷         ╷         ╷         ╷         ╷╷         ╷         ╷         ╷         ╷         ╷         ╷
              XXXXXXX,  XXXXXXX,  XXXXXXX,  XXXXXXX,   XXXXXXX,  XXXXXXX,  XXXXXXX,  XXXXXXX,  XXXXXXX,   XXXXXXX,
              XXXXXXX,  XXXXXXX,  XXXXXXX,  XXXXXXX,   XXXXXXX,  XXXXXXX,  XXXXXXX,  XXXXXXX,  XXXXXXX,   XXXXXXX,
    XXXXXXX,  XXXXXXX,  XXXXXXX,  XXXXXXX,  XXXXXXX,   XXXXXXX,  XXXXXXX,  XXXXXXX,  XXXXXXX,  XXXXXXX,   XXXXXXX, XXXXXXX,
                                  XXXXXXX,  XXXXXXX,   XXXXXXX,  XXXXXXX,  XXXXXXX,  XXXXXXX,
 ),
*/
};



// ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
// │ M A C R O S                                                                                                            │
// └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
// ▝▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▘


bool process_record_user(uint16_t keycode, keyrecord_t *record) {
    switch (keycode) {

// ┌─────────────────────────────────────────────────┐
// │ Swap OS l a y e r                             │
// └─────────────────────────────────────────────────┘
        case MAC:
            if (record->event.pressed) {
                set_single_persistent_default_layer(_QWERTY_MAC);
            }
            return false;
        case LINUX:
            if (record->event.pressed) {
                set_single_persistent_default_layer(_QWERTY);
            }
            return false;

// ┌─────────────────────────────────────────────────┐
// │ Swap base l a y e r                             │
// └─────────────────────────────────────────────────┘

        case COLEMAK:
            if (record->event.pressed) {
                set_single_persistent_default_layer(_COLEMAK);
            }
            return false;
        case QWERTY:
            if (record->event.pressed) {
                set_single_persistent_default_layer(_QWERTY);
            }
            return false;

// ┌─────────────────────────────────────────────────┐
// │ q m k                                           │
// └─────────────────────────────────────────────────┘

        case MAKE_H:
          if (record->event.pressed) {
            SEND_STRING ("qmk compile -kb totem -km castares");
            tap_code(KC_ENTER);
          }
          break;

// ┌─────────────────────────────────────────────────┐
// │ p r o d u c t i v i t y                         │
// └─────────────────────────────────────────────────┘

      case SNAP:
          if (record->event.pressed) {
            if (keymap_config.swap_lctl_lgui) {
              SEND_STRING(SS_LSFT(SS_LCMD(SS_LCTL("4"))));  //MAC
            } else {
              SEND_STRING(SS_LSFT(SS_LWIN("S")));           //WIN
            }
          }
          break;
    }
    return true;
}
/*
  ╺━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╸


                                                          ██████
                                                            ██  ▄▄▄▄
                                                            ██ ██▀▀██
                                                            ▀▀ ██▄▄██
                                                        ██████  ▀▀▀▀
                                                          ██ ▄▄▄▄▄▄
                                                          ██ ██▀▀▀▀
                                                          ██ ██████
                                                             ██▄▄▄▄
                                                             ▀▀▀▀▀▀
                                                           ████████
                                                           ██ ██ ██
                                                           ██ ██ ██
                                                           ▀▀ ▀▀ ▀▀
                                                          ████████

*/
