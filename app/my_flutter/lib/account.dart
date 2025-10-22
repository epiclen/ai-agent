import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [Text('Account')]),
        // SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Container(
            width: 300,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.deepPurple[300],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text('Score',style: TextStyle(color: Colors.white),),
                SizedBox(height: 10,),
                Text('5,101',style: TextStyle(color: Colors.white,fontSize: 28),),
                Row(children: [Text('1000')]),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
