// Copyright 2022 Ricardo (@rsre)
// SPDX-License-Identifier: GPL-2.0-or-later

#pragma once

// Fix #error "TIM2 is not a 32bits timer"
// https://deskthority.net/viewtopic.php?p=265193&sid=2bc560dfc0e2d3b7254a652c62e042c6#p265193
#define CH_CFG_ST_RESOLUTION                16

#define LED_PIN_ON_STATE					0
#define LED_NUM_LOCK_PIN					B7
#define LED_CAPS_LOCK_PIN					B8
#define LED_SCROLL_LOCK_PIN					B9
/*
 * Feature disable options
 *  These options are also useful to firmware size reduction.
 */

/* disable debug print */
//#define NO_DEBUG

/* disable print */
//#define NO_PRINT

/* disable action features */
//#define NO_ACTION_LAYER
//#define NO_ACTION_TAPPING
//#define NO_ACTION_ONESHOT
