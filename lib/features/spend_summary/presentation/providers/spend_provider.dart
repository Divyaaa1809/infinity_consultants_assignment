import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../data/datasource/spend_local_datasource.dart';
import '../../data/repository/spend_repository_impl.dart';
import '../../domain/repositories/spend_repository.dart';
import '../viewmodel/spend_state.dart';
import '../viewmodel/spend_viewmdel.dart';

final datasourceProvider =
    Provider((ref) => SpendLocalDataSource());

final repositoryProvider =
    Provider<SpendRepository>(
      (ref) => SpendRepositoryImpl(
        ref.read(datasourceProvider),
      ),
    );

final spendProvider =
    StateNotifierProvider<
      SpendViewModel,
      SpendState>((ref) {

      return SpendViewModel(
        ref.read(repositoryProvider),
      );
});