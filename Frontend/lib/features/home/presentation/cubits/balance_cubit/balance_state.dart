part of 'balance_cubit.dart';

@immutable
sealed class BalanceState {}

final class BalanceInitial extends BalanceState {}

final class BalanceLoading extends BalanceState {}

final class BalanceSuccess extends BalanceState {
  final int balance;

  BalanceSuccess({required this.balance});
}

final class BalanceFailure extends BalanceState {
  final String errMessage;

  BalanceFailure({required this.errMessage});
}
