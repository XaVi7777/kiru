import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiru/register/presentation/temp_bloc/temp_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:kiru/app_colors.dart';
// import 'package:kiru/register/presentation/bloc/send_status_bloc/send_status_bloc.dart';
// import 'package:kiru/widgets/app_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider<TempBloc>(
          create: (context) => TempBloc(),
          child: Center(
            child: Column(
              spacing: 20,
              children: [
                Spacer(),
                BlocBuilder<TempBloc, TempState>(
                  builder: (context, state) {
                    final counter = (state as TempStateData).count;
                    return Text(counter.toString());
                  },
                ),
                Text('increment'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 12,
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text('increment')),
                    ElevatedButton(onPressed: () {}, child: Text('decrement')),
                    ElevatedButton(onPressed: () {}, child: Text('clear')),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class RegisterScreen extends StatelessWidget {
//   const RegisterScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: SafeArea(
//         child: BlocProvider(
//           create: (BuildContext context) => SendStatusBloc(),
//           child: BlocListener<SendStatusBloc, SendStatusState>(
//             listener: (context, state) {
//              if(state is SendStatusStateSuccess){
//               context.go('/home');
//              }
//             },
//             child: BlocBuilder<SendStatusBloc, SendStatusState>(
//               builder: (context, state) {
//                 if(state is SendStatusStateError){
//                   return Center(child: Text('Что-то пошло не так'),);
//                 }
//                 return Form(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: Column(
//                       spacing: 12,
//                       children: [
//                         Spacer(),
//                         TextFormField(
//                           decoration: InputDecoration(labelText: 'Логин'),
//                         ),
//                         TextFormField(
//                           decoration: InputDecoration(labelText: 'Пароль'),
//                         ),
//                         TextFormField(
//                           decoration: InputDecoration(labelText: 'Повторите пароль'),
//                         ),
//                         Spacer(),
//                         BlocBuilder<SendStatusBloc, SendStatusState>(
//                           builder: (context, state) {
//                             Color buttonColor = AppColors.black;
//                             bool isLoading = false;
//                             if (state is SendStatusStateDisabled) {
//                               buttonColor = AppColors.black.withOpacity(.5);
//                             } else if (state is SendStatusStateLoading) {
//                               isLoading = true;
//                             }
//                             return AppButton(
//                               onTap: () {
//                                 context.read<SendStatusBloc>().add(SendStatusPressedEvent());
//                               },
//                               backgroundColor: buttonColor,
//                               isLoading: isLoading,
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               }
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
