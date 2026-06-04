import 'package:flutter/material.dart';
import '../../domain/entities/transaction.dart';

class TransactionTile extends StatelessWidget {
  final TransactionEntity transaction;

  const TransactionTile(
    this.transaction, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      child: Row(
        children: [
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .primaryContainer,
              borderRadius:
                  BorderRadius.circular(12),
            ),
            child: Icon(
              _getTransactionIcon(
                transaction.title,
              ),
              size: 20,
              color: Theme.of(context)
                  .colorScheme
                  .primary,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  maxLines: 1,
                  overflow:
                      TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight:
                        FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 2),

                Text(
                  transaction.date,
                  style: TextStyle(
                    fontSize: 12,
                    color:
                        Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          Text(
            "-₹${transaction.amount.toStringAsFixed(0)}",
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getTransactionIcon(String title) {
    final value = title.toLowerCase();

    if (value.contains('swiggy') ||
        value.contains('zomato')) {
      return Icons.fastfood_rounded;
    }

    if (value.contains('uber') ||
        value.contains('ola')) {
      return Icons.directions_car_rounded;
    }

    if (value.contains('amazon') ||
        value.contains('flipkart')) {
      return Icons.shopping_bag_rounded;
    }

    if (value.contains('bill')) {
      return Icons.receipt_long_rounded;
    }

    return Icons.account_balance_wallet_rounded;
  }
}