import 'package:health_application/ui/base/master_address/model/address_detail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_detail_list.g.dart';

@JsonSerializable()
class AddressDetailList {
  const AddressDetailList({
    this.data = const <AddressDetail>[],
  });

  ///convert from json
  factory AddressDetailList.fromJson(Map<String, dynamic> json) =>
      _$AddressDetailListFromJson(json);
  Map<String, dynamic> toJson() => _$AddressDetailListToJson(this);
  final List<AddressDetail> data;

  AddressDetailList copyWith({List<AddressDetail>? data}) =>
      AddressDetailList(data: data ?? this.data);

  List<Object?> get props => <Object>[data];
}
