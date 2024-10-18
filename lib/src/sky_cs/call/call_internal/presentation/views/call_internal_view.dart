import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idnstd/fake_data/person_contact.dart';
import 'package:idnstd/src/sky_cs/call/call_out/presentation/cubit/call_out_cubit.dart';
import 'package:idnstd/src/sky_cs/call/call_out/presentation/widgets/call_out_calling.dart';

import '../cubit/call_internal_cubit.dart';
import '../widgets/call_internal_calling.dart';
import '../widgets/call_internal_input_loaded.dart';




class CallInternalView extends StatefulWidget {
  const CallInternalView({super.key});
  @override
  State<CallInternalView> createState() => _CallInViewState();
}

class _CallInViewState extends State<CallInternalView> {
  final List<String> listCall = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '*', '0', '#'];
  String dropdownValue = PersonContact.listPhone.first;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CallInternalCubit()..input(''),
      child: BlocConsumer<CallInternalCubit, CallInternalState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          if(state is CallInternalLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is CallOutInputLoaded) {
            return const CallInternalInputLoadedView();
          }
          if(state is CallOutCalling) {
            return const CallInternalCallingView();
          }
          return Expanded(child: Container());
        },
      ),

    );
  }
}
