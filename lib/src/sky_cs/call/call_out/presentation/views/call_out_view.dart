import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idnstd/fake_data/person_contact.dart';
import 'package:idnstd/src/sky_cs/call/call_out/presentation/cubit/call_out_cubit.dart';
import 'package:idnstd/src/sky_cs/call/call_out/presentation/widgets/call_out_calling.dart';
import 'package:idnstd/src/sky_cs/call/call_out/presentation/widgets/call_out_succes.dart';

import '../widgets/call_out_input_loaded.dart';


class CallOutView extends StatefulWidget {
  const CallOutView({super.key});

  @override
  State<CallOutView> createState() => _CallOutViewState();
}

class _CallOutViewState extends State<CallOutView> {
  final List<String> listCall = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '*', '0', '#'];
  String dropdownValue = PersonContact.listPhone.first;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CallOutCubit()..input(''),
      child: BlocConsumer<CallOutCubit, CallOutState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          if(state is CallOutLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is CallOutInputLoaded) {
            return const CallOutInputLoadedView();
          }
          if(state is CallOutCalling) {
            return const CallOutCallingView();
          }
          if(state is CallOutCallSuccess) {
            return const CallOutCallSuccessView();
          }
          return Expanded(child: Container());
        },
      ),
    );
  }
}
