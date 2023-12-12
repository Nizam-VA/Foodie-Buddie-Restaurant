class SalesReport {
  final num saleCount;
  final num totalSales;

  SalesReport({required this.saleCount, required this.totalSales});

  factory SalesReport.fromJson(Map<String, dynamic> json) {
    return SalesReport(
      saleCount: json['saleCount'],
      totalSales: json['totalSales'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['saleCount'] = this.saleCount;
    data['totalSales'] = this.totalSales;
    return data;
  }
}
