part of 'landing_widgets.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          onChanged: (value) {
            context.read<LandingBloc>().add(SearchTermChanged(term: value));
          },
          decoration: InputDecoration(
            hintText: 'Search',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
