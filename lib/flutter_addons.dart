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

import 'dart:async';
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
import 'package:flutter/services.dart';

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
part 'src/context/theme_mode.dart';

// Widgets
part 'src/ui/widget/widget_ext.dart';
part 'src/ui/widget/row_column.dart';
part 'src/ui/widget/stacking.dart';
part 'src/ui/widget/list_grid.dart';

// Responsive
part 'src/core/responsive/entry/entry_scope.dart';
part 'src/core/responsive/spacing/extended_units.dart';
part 'src/core/responsive/helpers/screen_utils.dart';
part 'src/core/responsive/constants/responsive_effects.dart';

// Spacing
part 'src/core/responsive/spacing/spacing_extensions.dart';

// Routes
part 'src/routes/navigator_addons.dart';
part 'src/routes/route_extension.dart';

// Animation
part 'src/animation/base_wraper.dart';
part 'src/animation/basic_animation.dart';
part 'src/animation/beizer_motion.dart';
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
part 'src/utility/valodator.dart';

// Fake Data
part 'src/data/fake_data.dart';
part 'src/data/img_data.dart';

//  Shapes & Decoration
part 'src/core/decoration/decoration.dart';
part 'src/core/decoration/button_styles.dart';

/// [Soul Theme Engine]
/// Colors
part 'src/core/colors/base_theme.dart';
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
part 'src/core/palettes/lost_night.dart';
part 'src/core/palettes/cyber_soul.dart';
part 'src/core/palettes/retro_soul.dart';
part 'src/core/palettes/ocean_soul.dart';
part 'src/core/palettes/summer_soul.dart';
part 'src/core/palettes/autumn_soul.dart';
part 'src/core/palettes/apple.dart';
part 'src/core/palettes/mint.dart';
part 'src/core/palettes/ubuntu.dart';
part 'src/core/palettes/soul_themes.dart';

/// Typography
part 'src/core/typography/base_styles.dart';
part 'src/core/typography/fallback_typo.dart';

/// FallBack View
part 'src/ui/screens/error_page.dart';
part 'src/utility/author_speech.dart';

/// Errors
part 'src/core/errors/screen_of_death.dart';

/// App Exception
part 'src/core/errors/error_scope.dart';
part 'src/core/errors/retry_mechanism.dart';

/// Components
/// Alert , Snackbar, Toaster, Dialog, Theme Toggler
part 'src/ui/extras/alart.dart';
part 'src/ui/extras/snackbar.dart';
part 'src/ui/extras/toaster.dart';
part 'src/ui/extras/dialog.dart';
part 'src/ui/basic/theme_toggler.dart';
//part 'src/decoration/border_box.dart';

//responsive helper
part 'src/core/responsive/helpers/design_utils.dart';
part 'src/routes/navigator_manager.dart';

part 'src/core/responsive/helpers/smart_extensions.dart';
part 'src/core/responsive/entry/core_scale.dart';
part 'src/core/responsive/helpers/smartui_utils.dart';
part 'src/core/responsive/constants/responsive_enums.dart';
part 'src/core/responsive/models/frame_model.dart';
part 'src/core/responsive/entry/responsive_builder.dart';
part 'src/core/responsive/entry/base_scaffold.dart';
// Colors
part 'src/core/colors/kolors.dart';
part 'src/core/typography/text_weight.dart';
part 'src/core/typography/text_size.dart';
part 'src/ui/basic/label.dart';
part 'src/ui/basic/button.dart';
part 'src/core/colors/safe_colors.dart';

// decoration
part 'src/core/decoration/input_decoration.dart';
part 'src/core/decoration/shapes.dart';

// Responsive Utilities
part 'src/core/responsive/helpers/summery_logger.dart';
part 'src/core/responsive/models/media_info.dart';
part 'src/core/responsive/models/orentaion_lock.dart';
part 'src/animation/animate_proxy.dart';

// flexing
part 'src/core/responsive/bootstrap/breadcrums.dart';
part 'src/ui/basic/fx_container.dart';
part 'src/core/responsive/bootstrap/flex_core.dart';
part 'src/core/responsive/bootstrap/bootstrap_section.dart';
part 'src/core/responsive/bootstrap/flaxable_spacing.dart';

//components
part 'src/ui/basic/appbar_addon.dart';
part 'src/ui/basic/avatar_circle.dart';
part 'src/ui/basic/page_indicator.dart';
part 'src/ui/components/ui_miniprogress.dart';
part 'src/core/decoration/box_kit.dart';

// state management
part 'src/core/state/app_error.dart';
part 'src/core/state/app_state.dart';
part 'src/core/state/exception.dart';
part 'src/core/state/functional.dart';

// ui component
part 'src/ui/components/ui_borderbox.dart';
part 'src/ui/components/ui_popupmenu.dart';
