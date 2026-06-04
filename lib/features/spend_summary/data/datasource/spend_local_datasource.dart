class SpendLocalDataSource {
  Future<double> getMonthlySpend() async {
    return 25450;
  }

  Future<double> getPercentageChange() async {
    return 12.5;
  }

  Future<List<Map<String, dynamic>>> getCategories() async {
    return [
      {"name": "Food", "icon": "🍔", "amount": 5400},
      {"name": "Travel", "icon": "✈️", "amount": 3200},
      {"name": "Shopping", "icon": "🛍️", "amount": 8500},
      {"name": "Bills", "icon": "💡", "amount": 4300},
    ];
  }

  Future<List<Map<String, dynamic>>> getTransactions() async {
    return List.generate(57, (index) {
      final titles = [
        "Swiggy",
        "Zomato",
        "Uber",
        "Ola",
        "Amazon",
        "Flipkart",
        "Netflix",
        "Electricity Bill",
        "Water Bill",
        "Mobile Recharge",
        "BookMyShow",
        "BigBasket",
      ];

      return {
        "title": titles[index % titles.length],
        "date": "${(index % 30) + 1} Jun",
        "amount": ((index + 1) * 83) % 3000 + 100,
      };
    });
  }
}
