import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/search/presentation/views/widgets/custom_serach_text_field.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: CustomSearchTextField()),
            SliverToBoxAdapter(child: Gap(10)),
            SliverToBoxAdapter(
              child: Text('Search Result', style: Styles.textLarge),
            ),

            SerachResultListView(),
          ],
        ),
      ),
    );
  }
}
