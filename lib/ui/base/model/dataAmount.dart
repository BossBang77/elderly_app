import 'package:equatable/equatable.dart';

class DataAmount extends Equatable {
  ///constructor
  const DataAmount({
    this.no = 0,
    this.name = '',
    this.amount = '',
  });
  final int no;

  final String name;

  final String amount;

  DataAmount copyWith({int? no, String? name, String? amount}) => DataAmount(
      name: name ?? this.name,
      no: no ?? this.no,
      amount: amount ?? this.amount);

  ///get empty
  static const DataAmount empty = DataAmount();

  @override
  List<Object> get props => <Object>[name, amount, no];
}
