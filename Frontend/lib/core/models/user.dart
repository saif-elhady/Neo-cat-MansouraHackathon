import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String? fullName;
  final String? emailAddress;
  final int? phoneNumber;
  final int? nationalId;
  final String? password;
  final String? jobTitle;
  final int? monthlyIncome;
  final int? balance;
  final int? v;

  const User({
    this.id,
    this.fullName,
    this.emailAddress,
    this.phoneNumber,
    this.nationalId,
    this.password,
    this.jobTitle,
    this.monthlyIncome,
    this.balance,
    this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'] as String?,
        fullName: json['fullName'] as String?,
        emailAddress: json['emailAddress'] as String?,
        phoneNumber: json['phoneNumber'] as int?,
        nationalId: json['nationalId'] as int?,
        password: json['password'] as String?,
        jobTitle: json['jobTitle'] as String?,
        monthlyIncome: json['monthlyIncome'] as int?,
        balance: json['balance'] as int?,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'fullName': fullName,
        'emailAddress': emailAddress,
        'phoneNumber': phoneNumber,
        'nationalId': nationalId,
        'password': password,
        'jobTitle': jobTitle,
        'monthlyIncome': monthlyIncome,
        'balance': balance,
        '__v': v,
      };

  @override
  List<Object?> get props {
    return [
      id,
      fullName,
      emailAddress,
      phoneNumber,
      nationalId,
      password,
      jobTitle,
      monthlyIncome,
      balance,
      v,
    ];
  }
}
