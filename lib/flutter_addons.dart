/// *****************************************************************************
/// 🧩 **Flutter Addons Library**
/// 👨🏻‍💻 **Author:** AR Rahman
/// 🌟 **Version:** 2.4.1
/// 📅 **Updated:** Jul 8, 2025
/// 📅 **Created:** March 20, 2025
/// 📜 **License:** Apache License 2.0
/// 💡 Boost your development speed by over 7x with a robust set of micro-extensions that help you build fully responsive, theme-aware Flutter apps effortlessly.!

/// *****************************************************************************

library;

/// Dart Core Libraries
import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'dart:math' as math;
import 'dart:math';
import 'dart:ui' as ui;
import 'dart:ui';

/// Flutter SDK
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' as service;
import 'package:flutter/services.dart';

/// =======================
/// 📦 PACKAGE STRUCTURE
/// =======================

/// -----------------------
/// 🔹 Base Extensions
/// -----------------------
part 'src/extension/base/boolean_extension.dart';
part 'src/extension/base/int_extension.dart';
part 'src/extension/base/map_extension.dart';
part 'src/extension/base/string_extension.dart';
part 'src/extension/base/list_extension.dart';
part 'src/extension/base/reg_patterns.dart';
part 'src/extension/base/flutter_widgets.dart';

/// -----------------------
/// 🌐 Context Extensions
/// -----------------------
part 'src/extension/context/typo_graphy.dart';
part 'src/extension/context/quick_typo.dart';
part 'src/extension/context/responsive.dart';
part 'src/extension/context/theme_colors.dart';
part 'src/extension/context/theme_mode.dart';

/// -----------------------
/// 🧱 Widget Utilities
/// -----------------------
part 'src/ui/widget/widget_ext.dart';
part 'src/ui/widget/row_column.dart';
part 'src/ui/widget/stacking.dart';
part 'src/ui/widget/list_grid.dart';

/// -----------------------
/// 📱 Responsive Core
/// -----------------------
part 'src/core/responsive/entry/entry_scope.dart';
part 'src/core/responsive/spacing/extended_units.dart';
part 'src/core/responsive/helpers/screen_utils.dart';
part 'src/core/responsive/helpers/design_utils.dart';
part 'src/animation/responsive_effects.dart';
part 'src/core/constants/responsive_enums.dart';
part 'src/core/responsive/helpers/smart_extensions.dart';
part 'src/core/responsive/helpers/summery_logger.dart';
part 'src/core/responsive/entry/core_scale.dart';
part 'src/core/responsive/entry/responsive_builder.dart';
part 'src/core/responsive/entry/base_scaffold.dart';
part 'src/core/responsive/models/frame_model.dart';
part 'src/core/responsive/models/media_info.dart';
part 'src/core/responsive/models/orentaion_lock.dart';

/// -----------------------
/// 🔠 Spacing Extensions
/// -----------------------
part 'src/core/responsive/spacing/spacing_extensions.dart';

/// -----------------------
/// 🚦 Routing & Navigation
/// -----------------------
part 'src/routes/navigator_addons.dart';
part 'src/routes/route_extension.dart';
part 'src/routes/navigator_manager.dart';

/// -----------------------
/// 🎞️ Animations
/// -----------------------
part 'src/animation/base_wraper.dart';
part 'src/animation/basic_animation.dart';
part 'src/animation/beizer_motion.dart';
part 'src/animation/collision_effect.dart';
part 'src/animation/page_transitions.dart';
part 'src/animation/animate_proxy.dart';

/// -----------------------
/// 🧩 Reusable Functions
/// -----------------------
part 'src/extension/functions/async_functions.dart';
part 'src/extension/functions/colors_functions.dart';
part 'src/extension/functions/currency_format.dart';
part 'src/extension/functions/date_time_function.dart';
part 'src/extension/functions/debugger_function.dart';
part 'src/extension/functions/image_to_colors.dart';
part 'src/extension/functions/emojify_string.dart';
part 'src/extension/functions/scroll_controller.dart';
part 'src/extension/functions/string_functions.dart';
part 'src/extension/functions/system_ui_function.dart';
part 'src/extension/functions/math_functions.dart';

/// -----------------------
/// 🔧 Utility Classes
/// -----------------------
part 'src/utils/duration_utils.dart';
part 'src/utils/time_format.dart';
part 'src/extension/context/focus_node.dart';
part 'src/utils/data_image.dart';
part 'src/utils/network_utils.dart';
part 'src/utils/validator_utils.dart';

/// -----------------------
/// 🧪 Fake / Demo Data
/// -----------------------
part 'src/data/faker/fake_data.dart';
part 'src/data/raw/img_data.dart';
part 'src/data/faker/fake_model.dart';
part 'src/data/faker/fake_gen.dart';

/// -----------------------
/// 🎨 Decorations & Shapes
/// -----------------------
part 'src/ui/decoration/decoration.dart';
part 'src/ui/decoration/button_styles.dart';
part 'src/ui/decoration/input_decoration.dart';
part 'src/ui/decoration/shapes.dart';
part 'src/ui/decoration/box_kit.dart';

/// -----------------------
/// 🎨 Soul Theme Engine
/// -----------------------

/// -- Color Models
part 'src/core/colors/base_theme.dart';
part 'src/core/colors/seed.dart';
part 'src/core/colors/swatch.dart';
part 'src/core/colors/kolors.dart';
part 'src/core/colors/safe_colors.dart';

/// -- Theme System
part 'src/core/themes/theme_maker.dart';
part 'src/core/themes/theme_engine.dart';
part 'src/core/themes/theme_manager.dart';
part 'src/core/themes/soul_component.dart';
part 'src/core/themes/theme_helper.dart';

/// -- Color Palettes
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

/// -- Typography
part 'src/core/typography/base_styles.dart';
part 'src/core/typography/fallback_typo.dart';
part 'src/core/typography/text_weight.dart';
part 'src/core/typography/text_size.dart';

/// -----------------------
/// ❌ Error & Exception Handling
/// -----------------------
part 'src/core/errors/screen_of_death.dart';
part 'src/core/errors/error_scope.dart';
part 'src/extension/functions/retry_mechanism.dart';

/// -----------------------
/// ⚙️ State Management
/// -----------------------
part 'src/core/state/app_error.dart';
part 'src/core/state/app_state.dart';
part 'src/core/state/exception.dart';
part 'src/core/state/functional.dart';
part 'src/core/state/lifecycle.dart';

/// -----------------------
/// 📱 UI Components & Elements
/// -----------------------

/// -- Basic Elements
part 'src/ui/basic/label.dart';
part 'src/ui/basic/button.dart';
part 'src/ui/basic/theme_toggler.dart';
part 'src/ui/basic/appbar_addon.dart';
part 'src/ui/basic/avatar_circle.dart';
part 'src/ui/basic/page_indicator.dart';
part 'src/ui/components/ui_container.dart';

/// -- Advanced Components
part 'src/ui/components/ui_borderbox.dart';
part 'src/ui/components/ui_popupmenu.dart';
part 'src/ui/components/ui_miniprogress.dart';
part 'src/ui/components/ui_listview.dart';

/// -- Feedback Components
part 'src/ui/feedback/alart.dart';
part 'src/ui/feedback/snackbar.dart';
part 'src/ui/feedback/toaster.dart';
part 'src/ui/feedback/dialog.dart';

/// -- Error/Fallback Screens
part 'src/ui/screens/error_page.dart';

/// -- Author Signature
part 'src/data/raw/author_data.dart';

/// -----------------------
/// 🧩 Bootstrap-Inspired Responsive Engine
/// -----------------------
part 'src/core/constants/breakpoints.dart';
part 'src/core/responsive/bootstrap/breadcrums.dart';
part 'src/core/responsive/bootstrap/display_flex_media.dart';
part 'src/core/responsive/bootstrap/bootstrap_section.dart';
part 'src/core/responsive/bootstrap/flaxable_spacing.dart';
