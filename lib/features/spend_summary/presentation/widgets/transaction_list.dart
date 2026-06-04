import 'package:flutter/material.dart';

import '../viewmodel/spend_state.dart';
import 'transaction_tile.dart';

class TransactionList extends StatefulWidget {
  final SpendState state;
  const TransactionList({super.key, required this.state});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final ScrollController controller = ScrollController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0.0),
      child: Scrollbar(
        controller: controller,
        thumbVisibility: true,
        radius: const Radius.circular(20),
        thickness: 4,
        interactive: true,
        trackVisibility: true,
        child: ListView.builder(
          controller: controller,
          padding: const EdgeInsets.only(bottom: 80),
          itemCount: widget.state.transactions.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                TransactionTile(widget.state.transactions[index]),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Divider(height: 1),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
