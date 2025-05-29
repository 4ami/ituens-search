part of '../landing_lib.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final watch = context.watch<LandingBloc>().state;
    return GradientScaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Thmanyah Task'),
            backgroundColor: Colors.transparent,
          ),

          // search bar
          const SearchField(),

          // Horizontal list (podcasts)
          if (context.watch<LandingBloc>().state.podcasts.isNotEmpty)
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              sliver: SliverToBoxAdapter(
                child: Text('Podcasts', style: context.h2),
              ),
            ),
          const HorizontalList(),

          //other related results
          if (watch.otherResults.isNotEmpty)
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              sliver: SliverToBoxAdapter(
                child: Text('Related Results', style: context.h2),
              ),
            ),
          const GridList(),

          // No podcasts found
          if (watch.podcasts.isEmpty &&
              watch.results.isEmpty &&
              watch.event is! LoadingEvent)
            SliverToBoxAdapter(
              child: Center(child: Text('Search in iTuens', style: context.h2)),
            ),
        ],
      ),
    );
  }
}
