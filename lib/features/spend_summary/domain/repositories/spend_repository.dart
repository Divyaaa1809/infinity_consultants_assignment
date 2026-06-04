import '../entities/category.dart';
import '../entities/transaction.dart';

abstract class SpendRepository {
  Future<List<Category>> getCategories();

  Future<List<TransactionEntity>> getTransactions();

  Future<double> getMonthlySpend();

  Future<double> getPercentageChange();
}