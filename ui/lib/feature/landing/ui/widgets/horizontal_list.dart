part of 'landing_widgets.dart';

class HorizontalList extends StatefulWidget {
  const HorizontalList({super.key});

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  @override
  Widget build(BuildContext context) {
    final watch = context.watch<LandingBloc>().state;
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          width: double.infinity,
          height: 330,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (watch.event is LoadingEvent) {
                return LandingCard.shimmer();
              }
              return LandingCard(
                content: context.read<LandingBloc>().state.podcasts[index],
              );
            },
            itemCount:
                (watch.event is LoadingEvent) ? 6 : watch.podcasts.length,
          ),
        ),
      ),
    );
  }
}
