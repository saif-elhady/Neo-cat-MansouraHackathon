import 'package:bloc/bloc.dart';
import 'package:gdg_hackathon/features/home/data/repos/balance_repo.dart';
import 'package:meta/meta.dart';

part 'balance_state.dart';

class BalanceCubit extends Cubit<BalanceState> {
  BalanceCubit(this.balanceRepo) : super(BalanceInitial());
  final BalanceRepo balanceRepo;
}
