import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/spend_provider.dart';
import '../widgets/category_card.dart';
import '../widgets/spend_card.dart';
import '../widgets/transaction_list.dart';

class SpendSummaryScreen extends ConsumerWidget {
  const SpendSummaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(spendProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpendCard(state: state),

            const SizedBox(height: 5),

            SizedBox(
              height: 120,
              child: ListView.builder(
                padding: const EdgeInsets.only(right: 16),
                scrollDirection: Axis.horizontal,
                itemCount: state.categories.length,
                itemBuilder: (_, index) {
                  final category = state.categories[index];

                  return CategoryCard(category);
                },
              ),
            ),

            const SizedBox(height: 24),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recent Transactions',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 12),

            Expanded(child: TransactionList(state: state)),
          ],
        ),
      ),
    );
  }
}
