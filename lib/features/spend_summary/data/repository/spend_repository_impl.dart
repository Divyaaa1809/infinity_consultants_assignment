import '../../domain/entities/category.dart';
import '../../domain/entities/transaction.dart';
import '../../domain/repositories/spend_repository.dart';
import '../datasource/spend_local_datasource.dart';

class SpendRepositoryImpl implements SpendRepository {

  final SpendLocalDataSource datasource;

  SpendRepositoryImpl(this.datasource);

  @override
  Future<List<Category>> getCategories() async {
    final data = await datasource.getCategories();

    return data.map((e) =>
      Category(
        name: e["name"],
        icon: e["icon"],
        amount: e["amount"].toDouble(),
      ),
    ).toList();
  }

  @override
  Future<List<TransactionEntity>> getTransactions() async {

    final data = await datasource.getTransactions();

    return data.map((e) =>
      TransactionEntity(
        title: e["title"],
        date: e["date"],
        amount: e["amount"].toDouble(),
      ),
    ).toList();
  }

  @override
  Future<double> getMonthlySpend() =>
      datasource.getMonthlySpend();

  @override
  Future<double> getPercentageChange() =>
      datasource.getPercentageChange();
}