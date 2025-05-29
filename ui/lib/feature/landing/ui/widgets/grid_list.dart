part of 'landing_widgets.dart';

class GridList extends StatelessWidget {
  const GridList({super.key});

  int _getCrossAxisCount(double width) {
    if (width >= 900) return 3; // large screens
    if (width >= 1100) return 2; // medium screens
    return 1; // small screens
  }

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<LandingBloc>().state;
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = _getCrossAxisCount(screenWidth);
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      sliver: SliverGrid.builder(
        itemCount: watch.otherResults.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.5,
        ),
        itemBuilder:
            (context, index) =>
                LandingCard(content: watch.otherResults[index], isGrid: true),
      ),
    );
  }
}
