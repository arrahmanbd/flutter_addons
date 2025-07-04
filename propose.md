<!-- - AddonButton
- AddonCard
- AddonTextField
- AddonRow / AddonColumn / AddonGrid
- AddonGap / AddonSpacer / AddonPadding
- AddonImage / AddonAvatar
- AddonSnack / AddonDialog / AddonLoader
- AddonDropdown / AddonCheckbox / AddonSwitch
- AddonScreen / AddonNavBar / AddonTabBar
- AddonResponsiveBox / AddonAnimatedBox -->

## ✅ Naming Convention: `UiXxx`

Your widget names should feel like ready-made building blocks. Here's a curated list categorized by function:

---

### 🎨 **Core Components**

| Flutter Equivalent  | Your Widget           | Purpose                                       |
| ------------------- | --------------------- | --------------------------------------------- |
| `ElevatedButton`    | `UiButton`            | Default styled button                         |
| `TextField`         | `UiTextField`         | Modern input field with padding, border, etc. |
| `OutlinedButton`    | `UiButton.outlined()` | Variant via factory                           |
| `Card`              | `UiCard`              | With elevation, padding                       |
| `Chip`              | `UiChip`              | Tag-like pill buttons                         |
| `Container` wrapper | `UiBox`               | Customizable wrapper with padding/margin      |
| `Divider`           | `UiDivider`           | Styled horizontal line                        |
| `IconButton`        | `UiIconButton`        | Icon + label optional                         |

---

### 🧩 **Layout & Structure**

| Flutter Equivalent  | Your Widget | Purpose                  |
| ------------------- | ----------- | ------------------------ |
| `Row`               | `UiRow`     | With spacing, alignment  |
| `Column`            | `UiColumn`  | Same as above            |
| `GridView.builder`  | `UiGrid`    | Responsive grid layout   |
| `Padding`           | `UiPadding` | Smart padding helper     |
| `SizedBox`          | `UiGap`     | For spacing: `UiGap(12)` |
| `Align` or `Center` | `UiAlign`   | Smart alignment wrapper  |
| `Spacer`            | `UiSpacer`  | For flex gaps            |

---

### 🖊 **Inputs & Forms**

| Flutter Equivalent  | Your Widget   | Purpose                    |
| ------------------- | ------------- | -------------------------- |
| `DropdownButton`    | `UiDropdown`  | With styling & validation  |
| `CheckboxListTile`  | `UiCheckbox`  | With label & theme         |
| `RadioListTile`     | `UiRadioTile` | For grouped options        |
| `Switch`            | `UiSwitch`    | Custom styled toggle       |
| `Slider`            | `UiSlider`    | For selecting range/value  |
| `FormField` wrapper | `UiFormField` | Abstract form logic widget |

---

### 📦 **Display & Feedback**

| Flutter Equivalent | Your Widget | Purpose                   |
| ------------------ | ----------- | ------------------------- |
| `SnackBar` / toast | `UiSnack`   | Show feedback             |
| `AlertDialog`      | `UiAlert`   | Modal dialog              |
| `Dialog`           | `UiDialog`  | Confirm/info dialog       |
| `Tooltip`          | `UiTooltip` | Hover/long-press hints    |
| `CircularProgress` | `UiLoader`  | Centered or inline loader |
| `Badge`            | `UiBadge`   | Notification/count        |

---

### 👤 **User & Profile**

| Flutter Equivalent | Your Widget     | Purpose                     |
| ------------------ | --------------- | --------------------------- |
| `CircleAvatar`     | `UiAvatar`      | Profile image with fallback |
| `ListTile`         | `UiListTile`    | With leading icon/avatar    |
| `ExpansionTile`    | `UiAccordion`   | Collapsible sections        |
| Profile card       | `UiProfileCard` | Name, avatar, subtitle      |

---

### 🌐 **Navigation & Screens**

| Flutter Equivalent    | Your Widget  | Purpose                           |
| --------------------- | ------------ | --------------------------------- |
| `Scaffold` wrapper    | `UiScreen`   | Basic page structure              |
| `AppBar`              | `UiAppBar`   | With title/actions                |
| `TabBar`              | `UiTabBar`   | Styled tabs                       |
| `BottomNavigationBar` | `UiNavBar`   | Bottom nav with state             |
| `PageView`            | `UiCarousel` | For image swiping                 |
| Drawer/Menu           | `UiDrawer`   | Sidebar nav (optional badge etc.) |

---

### ✨ **Extras / Utilities**

| Purpose          | Widget Name       | Notes                       |
| ---------------- | ----------------- | --------------------------- |
| Theme handling   | `UiThemeSwitcher` | Light/Dark mode toggle      |
| Animated wrapper | `UiAnimatedBox`   | Fade/scale transitions      |
| Empty state      | `UiEmpty`         | Placeholder when no content |
| Error banner     | `UiErrorBanner`   | Global or inline error      |
| Shimmer          | `UiShimmer`       | Loading skeleton            |
| Section header   | `UiSectionTitle`  | Headline-style divider      |

---

### 📁 Example Folder Structure

```
/lib
  /ui_components
    ui_button.dart
    ui_text_field.dart
    ui_card.dart
    ui_avatar.dart
    ... // barrel export
flutter_addons.dart   // exports everything
```

---



