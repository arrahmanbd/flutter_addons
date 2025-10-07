part of 'package:flutter_addons/flutter_addons.dart';

enum CarrotDirection { up, down }

/// Model for each menu item
class UiInlinePopupItem {
  final String label;
  final IconData icon;
  final VoidCallback? onTap;

  UiInlinePopupItem({
    required this.label,
    required this.icon,
    this.onTap,
  });
}

class UiInlinePopup extends StatefulWidget {
  final List<UiInlinePopupItem> items;
  final double width;
  final Color backgroundColor;
  final Widget trigger;
  final void Function(String label)? onItemSelected;

  const UiInlinePopup({
    super.key,
    required this.items,
    required this.trigger,
    this.width = 180,
    this.backgroundColor = Colors.white,
    this.onItemSelected,
  });

  @override
  State<UiInlinePopup> createState() => _UiInlinePopupState();
}

class _UiInlinePopupState extends State<UiInlinePopup> {
  final LayerLink _layerLink = LayerLink();
  final GlobalKey _triggerKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  late CarrotDirection _carrotDirection;
  late double _carrotOffsetX;

  void _toggleMenu() {
    if (_overlayEntry != null) {
      _closeMenu();
    } else {
      _showMenu();
    }
  }

  void _showMenu() {
    _calculateCarrotPosition();

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: _closeMenu,
              behavior: HitTestBehavior.opaque,
              child: Container(color: Colors.transparent),
            ),
          ),
          Positioned(
            child: CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: _calculateMenuOffset(context),
              child: Material(
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: _carrotDirection == CarrotDirection.down
                      ? [
                          _buildCarrotIndicator(),
                          _buildMenuContainer(),
                        ]
                      : [
                          _buildMenuContainer(),
                          _buildCarrotIndicator(),
                        ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _closeMenu() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _calculateCarrotPosition() {
    final buttonSize = _getTriggerSize();
    final buttonPosition = _getTriggerPosition();
    final screenSize = MediaQuery.of(context).size;

    const menuHeight = 200.0; // approximate max height
    _carrotDirection = CarrotDirection.down;

    // Flip if menu would go off the bottom
    if (buttonPosition.dy + buttonSize.height + menuHeight > screenSize.height) {
      _carrotDirection = CarrotDirection.up;
    }

    // Align carrot horizontally with trigger center, but prevent overflow
    double centerX = buttonPosition.dx + buttonSize.width / 2;
    _carrotOffsetX = centerX - buttonPosition.dx;
    if (_carrotOffsetX < 12) _carrotOffsetX = 12; // min padding
    if (_carrotOffsetX > widget.width - 12) _carrotOffsetX = widget.width - 12;
  }

  Offset _calculateMenuOffset(BuildContext context) {
    final buttonSize = _getTriggerSize();
    final screenSize = MediaQuery.of(context).size;
    final buttonPosition = _getTriggerPosition();

    double offsetX = 0;
    double offsetY = buttonSize.height;

    // horizontal adjustment if menu overflows
    if (buttonPosition.dx + widget.width > screenSize.width) {
      offsetX = buttonSize.width - widget.width;
    }

    // vertical adjustment if menu appears above
    if (_carrotDirection == CarrotDirection.up) {
      offsetY = -200; // approximate menu height
    }

    return Offset(offsetX, offsetY);
  }

  Widget _buildCarrotIndicator() {
    return CustomPaint(
      size: const Size(16, 8),
      painter: _CarrotPainter(
        direction: _carrotDirection,
        offsetX: _carrotOffsetX,
        color: widget.backgroundColor,
      ),
    );
  }

  Widget _buildMenuContainer() {
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: widget.items.map((item) => _buildMenuItem(item)).toList(),
      ),
    );
  }

  Widget _buildMenuItem(UiInlinePopupItem item) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          item.onTap?.call();
          widget.onItemSelected?.call(item.label);
          _closeMenu();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Icon(item.icon, size: 18, color: Theme.of(context).colorScheme.onSurface),
              const SizedBox(width: 8),
              Flexible(
                child: Text(item.label, style: Theme.of(context).textTheme.bodyMedium),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Offset _getTriggerPosition() {
    final renderBox = _triggerKey.currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.localToGlobal(Offset.zero) ?? Offset.zero;
  }

  Size _getTriggerSize() {
    final renderBox = _triggerKey.currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.size ?? Size.zero;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        key: _triggerKey,
        onTap: _toggleMenu,
        child: widget.trigger,
      ),
    );
  }

  @override
  void dispose() {
    _closeMenu();
    super.dispose();
  }
}

/// Carrot painter that supports flipping
class _CarrotPainter extends CustomPainter {
  final CarrotDirection direction;
  final double offsetX;
  final Color color;

  _CarrotPainter({
    required this.direction,
    required this.offsetX,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path();

    const halfWidth = 8.0;

    if (direction == CarrotDirection.down) {
      // Menu above -> carrot points down
      path.moveTo(offsetX - halfWidth, 0);
      path.lineTo(offsetX, size.height);
      path.lineTo(offsetX + halfWidth, 0);
    } else {
      // Menu below -> carrot points up
      path.moveTo(offsetX - halfWidth, size.height);
      path.lineTo(offsetX, 0);
      path.lineTo(offsetX + halfWidth, size.height);
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
