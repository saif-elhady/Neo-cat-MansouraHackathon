import 'package:equatable/equatable.dart';

class UserSignup extends Equatable {
  final String? fullName;
  final String? emailAddress;
  final int? phoneNumber;
  final int? nationalId;
  final String? password;
  final String? jobTitle;
  final int? monthlyIncome;
  final String? resetCode;

  const UserSignup({
    this.fullName,
    this.emailAddress,
    this.phoneNumber,
    this.nationalId,
    this.password,
    this.jobTitle,
    this.monthlyIncome,
    this.resetCode,
  });

  factory UserSignup.fromJson(Map<String, dynamic> json) => UserSignup(
        fullName: json['fullName'] as String?,
        emailAddress: json['emailAddress'] as String?,
        phoneNumber: json['phoneNumber'] as int?,
        nationalId: json['nationalId'] as int?,
        password: json['password'] as String?,
        jobTitle: json['jobTitle'] as String?,
        monthlyIncome: json['monthlyIncome'] as int?,
        resetCode: json['resetCode'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'emailAddress': emailAddress,
        'phoneNumber': phoneNumber,
        'nationalId': nationalId,
        'password': password,
        'jobTitle': jobTitle,
        'monthlyIncome': monthlyIncome,
        'resetCode': resetCode,
      };

  @override
  List<Object?> get props {
    return [
      fullName,
      emailAddress,
      phoneNumber,
      nationalId,
      password,
      jobTitle,
      monthlyIncome,
      resetCode,
    ];
  }
}
