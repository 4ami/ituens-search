part of 'landing_widgets.dart';

class LandingCard extends StatefulWidget {
  const LandingCard({super.key, required this.content, this.isGrid = false})
    : _isShimmer = false;

  final bool isGrid;
  const LandingCard._shimmer()
    : _isShimmer = true,
      content = null,
      isGrid = false;

  final bool _isShimmer;
  final ContentModel? content;

  factory LandingCard.shimmer() {
    return LandingCard._shimmer();
  }

  @override
  State<LandingCard> createState() => _LandingCardState();
}

class _LandingCardState extends State<LandingCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    if (!widget._isShimmer) return;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _controller.repeat();
  }

  @override
  void dispose() {
    if (widget._isShimmer) _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget._isShimmer ? _buildShimmer() : _buildCard();
  }

  Container _buildCard() {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment:
            widget.isGrid
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _imageElement(),
          SizedBox(
            width: 150,
            child: SelectableText(
              widget.content!.trackName,
              style: context.titleMedium,
            ),
          ),
          SizedBox(
            width: 150,
            child: SelectableText(
              widget.content!.collectionName,
              style: context.bodySmall,
              textAlign: TextAlign.justify,
              maxLines: 4,
            ),
          ),
        ],
      ),
    );
  }

  Container _imageElement() {
    return Container(
      height: 100,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: .5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(widget.content!.artworkUrl100, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildShimmer() {
    return Container(
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Container
          _shimmerElement(width: 150, height: 100),

          // Title Container
          _shimmerElement(width: 70, height: 20),

          // Description Container
          _shimmerElement(width: 150, height: 20),
          _shimmerElement(width: 150, height: 20),
          _shimmerElement(width: 100, height: 20),
        ],
      ),
    );
  }

  Widget _shimmerElement({required double width, required double height}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      foregroundDecoration: _ShimmerDecoration(
        borderRadius: 16,
        animation: _controller,
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      width: width,
      height: height,
      decoration: _shimmerElementsDecoration(),
    );
  }

  BoxDecoration _shimmerElementsDecoration() {
    return BoxDecoration(
      color: Colors.grey.withValues(alpha: .1),
      borderRadius: BorderRadius.circular(16),
    );
  }
}

class _ShimmerDecoration extends Decoration {
  const _ShimmerDecoration({this.borderRadius = 16.0, required this.animation});
  final double borderRadius;
  final Animation<double> animation;
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _ShimmerBoxPainter(
      borderRadius: borderRadius,
      animation: animation,
      onChanged: onChanged,
    );
  }
}

class _ShimmerBoxPainter extends BoxPainter {
  _ShimmerBoxPainter({
    this.borderRadius = 16.0,
    required this.animation,
    required VoidCallback? onChanged,
  }) : _onChanged = onChanged,
       super(onChanged) {
    animation.addListener(_handleAnimation);
  }

  final Animation<double> animation;
  final double borderRadius;
  final VoidCallback? _onChanged;

  void _handleAnimation() {
    if (_onChanged != null) {
      _onChanged();
    }
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = offset & configuration.size!;
    final radius = BorderRadius.circular(borderRadius);
    final RRect rRect = radius.toRRect(rect);

    //animate shimmer
    final double width = rect.width * 0.4;
    final double dx =
        rect.left + (rect.width + width) * animation.value - width;
    final Rect shaderRect = Rect.fromLTWH(dx, rect.top, width, rect.height);
    final Paint paint = Paint();
    paint.shader = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Colors.grey.shade300.withValues(alpha: .2),
        Colors.grey.shade100.withValues(alpha: .4),
        Colors.grey.shade300.withValues(alpha: .2),
      ],
      stops: const [0.1, 0.3, 0.4],
      tileMode: TileMode.clamp,
    ).createShader(shaderRect);

    canvas.drawRRect(rRect, paint);
  }
}
