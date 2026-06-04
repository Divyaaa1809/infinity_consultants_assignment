import 'package:flutter_riverpod/legacy.dart';

import '../../domain/repositories/spend_repository.dart';
import 'spend_state.dart';

class SpendViewModel extends StateNotifier<SpendState> {

  final SpendRepository repository;

  SpendViewModel(this.repository)
      : super(SpendState.initial()) {
    loadData();
  }

  Future<void> loadData() async {

    state = state.copyWith(isLoading: true);

    final spend =
        await repository.getMonthlySpend();

    final percentage =
        await repository.getPercentageChange();

    final categories =
        await repository.getCategories();

    final transactions =
        await repository.getTransactions();

    state = state.copyWith(
      isLoading: false,
      monthlySpend: spend,
      percentage: percentage,
      categories: categories,
      transactions: transactions,
    );
  }
}