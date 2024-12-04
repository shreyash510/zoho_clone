import 'package:flutter/material.dart';
import 'package:zoho_clone/pages/approvals/components/approvalCard.dart';

class RejectionTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Approvalcard(),
      ],
    ));
  }
}
