part of 'sales_report_bloc.dart';

class SalesReportState {
  final SalesReport? report;
  SalesReportState({required this.report});
}

final class SalesReportInitial extends SalesReportState {
  SalesReportInitial() : super(report: null);
}
