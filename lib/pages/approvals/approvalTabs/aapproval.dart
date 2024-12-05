import 'package:flutter/material.dart';
import 'package:zoho_clone/pages/approvals/components/approvalCard.dart';
import 'package:zoho_clone/pages/approvals/requestTabs/rapproval.dart';

class AApprovalTab extends StatelessWidget {
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
