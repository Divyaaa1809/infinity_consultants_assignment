import '../../domain/entities/category.dart';
import '../../domain/entities/transaction.dart';

class SpendState {
  final bool isLoading;
  final double monthlySpend;
  final double percentage;

  final List<Category> categories;
  final List<TransactionEntity> transactions;

  const SpendState({
    required this.isLoading,
    required this.monthlySpend,
    required this.percentage,
    required this.categories,
    required this.transactions,
  });

  factory SpendState.initial() {
    return const SpendState(
      isLoading: false,
      monthlySpend: 0,
      percentage: 0,
      categories: [],
      transactions: [],
    );
  }

  SpendState copyWith({
    bool? isLoading,
    double? monthlySpend,
    double? percentage,
    List<Category>? categories,
    List<TransactionEntity>? transactions,
  }) {
    return SpendState(
      isLoading: isLoading ?? this.isLoading,
      monthlySpend: monthlySpend ?? this.monthlySpend,
      percentage: percentage ?? this.percentage,
      categories: categories ?? this.categories,
      transactions: transactions ?? this.transactions,
    );
  }
}