part of 'package:flutter_addons/flutter_addons.dart';

class UiAccordion extends StatefulWidget {
  final String title;
  final Widget? leading;
  final Widget? trailing;
  final Widget content;
  final bool initiallyExpanded;

  const UiAccordion({
    super.key,
    required this.title,
    required this.content,
    this.leading,
    this.trailing,
    this.initiallyExpanded = false,
  });

  @override
  State<UiAccordion> createState() => _UiAccordionState();
}

class _UiAccordionState extends State<UiAccordion> {
  late bool isExpanded;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Column(
        children: [
          ListTile(
            leading: widget.leading,
            title: Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing:
                widget.trailing ??
                Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
            onTap: () => setState(() => isExpanded = !isExpanded),
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Padding(
              padding: const EdgeInsets.all(16.0),
              child: widget.content,
            ),
            crossFadeState:
                isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }
}
