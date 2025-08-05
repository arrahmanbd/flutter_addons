part of 'package:flutter_addons/flutter_addons.dart';

class UiProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String? subtitle;
  final String price;

  final VoidCallback? onTap;
  final VoidCallback? onAction;
  final String actionLabel;

  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final Color? backgroundColor;

  final bool isHorizontal;

  const UiProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    this.subtitle,
    this.onTap,
    this.onAction,
    this.actionLabel = 'Buy',
    this.padding,
    this.borderRadius = 12.0,
    this.backgroundColor,
    this.isHorizontal = false,
  });

  /// Named constructor for horizontal layout
  const UiProductCard.horizontal({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    this.subtitle,
    this.onTap,
    this.onAction,
    this.actionLabel = 'Buy',
    this.padding,
    this.borderRadius = 12.0,
    this.backgroundColor,
  }) : isHorizontal = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderRadiusValue = BorderRadius.circular(borderRadius);

    return InkWell(
      onTap: onTap,
      borderRadius: borderRadiusValue,
      child: Container(
        padding: padding ?? const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: backgroundColor ?? theme.cardColor,
          borderRadius: borderRadiusValue,
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withValues(alpha: 0.08),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child:
            isHorizontal
                ? Row(
                  children: [
                    // Image
                    ClipRRect(
                      borderRadius: borderRadiusValue,
                      child: Image.network(
                        imageUrl,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (_, __, ___) =>
                                const Icon(Icons.broken_image, size: 48),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (subtitle != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                subtitle!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.hintColor,
                                ),
                              ),
                            ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                price,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (onAction != null)
                                TextButton(
                                  onPressed: onAction,
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 4,
                                    ),
                                    visualDensity: VisualDensity.compact,
                                  ),
                                  child: Text(actionLabel),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image
                    ClipRRect(
                      borderRadius: borderRadiusValue,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (_, __, ___) =>
                                  const Center(child: Icon(Icons.broken_image)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Title
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    // Subtitle
                    if (subtitle != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          subtitle!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.hintColor,
                          ),
                        ),
                      ),

                    const SizedBox(height: 8),

                    // Price + Action Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          price,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (onAction != null)
                          TextButton(
                            onPressed: onAction,
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              visualDensity: VisualDensity.compact,
                            ),
                            child: Text(actionLabel),
                          ),
                      ],
                    ),
                  ],
                ),
      ),
    );
  }
}
