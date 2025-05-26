/// *****************************************************************************
/// 🧩 **Flutter Addons Library**
///
/// 🌟 **Version:** 1.3.2
/// 👨🏻‍💻 **Author:** AR Rahman
/// 📅 **Created On:** March 20, 2025
/// 📜 **License:** Apache License 2.0
///
/// 💡 Flutter Addons is a collection of powerful and useful Flutter extensions to supercharge your app development!
/// Let's build something amazing! 💥
///
/// *****************************************************************************

library;

import 'dart:collection';
import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'dart:math' as math;
import 'dart:math';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as service;

// Import necessary parts of the package
//
// Base
part 'src/base/boolean_extension.dart';
part 'src/base/int_extension.dart';
part 'src/base/map_extension.dart';
part 'src/base/string_extension.dart';
part 'src/base/dart_extension.dart';
part 'src/base/reg_patterns.dart';
part 'src/base/flutter_widgets.dart';

// Context
part 'src/context/typo_graphy.dart';
part 'src/context/quick_typo.dart';
part 'src/context/responsive.dart';
part 'src/context/theme_colors.dart';

// Widgets
part 'src/widgets/widget_ext.dart';
part 'src/widgets/row_column.dart';
part 'src/widgets/stacking.dart';
part 'src/widgets/list_grid.dart';

// Responsive
part 'src/core/adaptive/responsive_app.dart';
part 'src/core/spacing/responsive_space.dart';
part 'src/core/adaptive/screen_utils.dart';

// Spacing
part 'src/core/spacing/spacing_extensions.dart';

// Routes
part 'src/routes/navigator_addons.dart';
part 'src/routes/route_extension.dart';

// Animation
part 'src/animation/base_wraper.dart';
part 'src/animation/basic_animation.dart';
part 'src/animation/beizer_motion_effect.dart';
part 'src/animation/collision_effect.dart';
part 'src/animation/page_transitions.dart';

// Functions
part 'src/functions/async_functions.dart';
part 'src/functions/colors_functions.dart';
part 'src/functions/currency_format.dart';
part 'src/functions/date_time_function.dart';
part 'src/functions/debugger_function.dart';
part 'src/functions/image_to_colors.dart';
part 'src/functions/emojify_string.dart';
part 'src/functions/scroll_controller.dart';
part 'src/functions/string_functions.dart';
part 'src/functions/system_ui_function.dart';
part 'src/functions/math_functions.dart';

// Utility
part 'src/utility/duration_delay.dart';
part 'src/utility/time_format.dart';
part 'src/utility/focus_node.dart';
part 'src/utility/image_provider.dart';
part 'src/utility/network_utils.dart';

// Fake Data
part 'src/data/fake_data.dart';
part 'src/data/img_data.dart';

//  Shapes & Decoration
part 'src/decoration/decoration.dart';
part 'src/decoration/shapes.dart';

/// [Soul Theme Engine]
/// Colors
part 'src/core/colors/palette.dart';
part 'src/core/colors/kolors.dart';
part 'src/core/colors/seed.dart';
part 'src/core/colors/swatch.dart';

/// Themes
part 'src/core/themes/theme_maker.dart';
part 'src/core/themes/theme_engine.dart';
part 'src/core/themes/theme_manager.dart';
part 'src/core/themes/soul_component.dart';

/// Color Plattes
part 'src/core/palettes/soul_colors.dart';
part 'src/core/palettes/forest_colors.dart';
part 'src/core/palettes/aura_colors.dart';
part 'src/core/palettes/mid_night_soul.dart';
part 'src/core/palettes/cyber_soul.dart';
part 'src/core/palettes/retro_soul.dart';
part 'src/core/palettes/ocean_soul.dart';
part 'src/core/palettes/summer_soul.dart';
part 'src/core/palettes/autumn_soul.dart';

/// Typography
part 'src/core/typography/base_styles.dart';
part 'src/core/typography/fallback_typo.dart';

/// FallBack View
part 'src/core/components/error_page.dart';
part 'src/utility/author_speech.dart';

/// Errors
part 'src/core/errors/screen_of_death.dart';

/// App Exception
part 'src/core/errors/default_error_maper.dart';
part 'src/core/errors/error_maper.dart';
part 'src/core/errors/app_exception.dart';
part 'src/core/errors/common_exception.dart';

/// Components
/// Alert , Snackbar, Toaster, Dialog, Theme Toggler
part 'src/core/components/alart.dart';
part 'src/core/components/snackbar.dart';
part 'src/core/components/toaster.dart';
part 'src/core/components/dialog.dart';
part 'src/core/components/theme_toggler.dart';
part 'src/core/components/border_maker.dart';

//responsive helper
part 'src/core/adaptive/design_utils.dart';
part 'src/routes/navigator_manager.dart';

part 'src/core/adaptive/rs_extensions.dart';
part 'src/core/adaptive/unified_scale.dart';
part 'src/core/adaptive/smart_utils.dart';
part 'src/core/adaptive/unified_enams.dart';