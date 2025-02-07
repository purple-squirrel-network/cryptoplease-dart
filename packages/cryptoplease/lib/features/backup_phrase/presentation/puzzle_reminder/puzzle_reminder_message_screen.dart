import 'package:auto_route/auto_route.dart';
import 'package:cryptoplease/app/components/info_widget.dart';
import 'package:cryptoplease/app/routes.gr.dart';
import 'package:cryptoplease/features/backup_phrase/presentation/puzzle_reminder/components/puzzle_screen.dart';
import 'package:cryptoplease/l10n/l10n.dart';
import 'package:cryptoplease_ui/cryptoplease_ui.dart';
import 'package:flutter/material.dart';

class PuzzleReminderMessageScreen extends StatelessWidget {
  const PuzzleReminderMessageScreen({Key? key}) : super(key: key);

  void _remindMeLater(BuildContext context) {
    context.router.push(const PuzzleReminderSetupRoute());
  }

  @override
  Widget build(BuildContext context) => PuzzleScreen(
        title: context.l10n.protectWalletTitle,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 24),
              MessageInfoWidget(
                padding: const EdgeInsets.all(32),
                content: Wrap(
                  runSpacing: 20,
                  children: [
                    Text(context.l10n.protectYourWalletParagraph1),
                    Text(context.l10n.protectYourWalletParagraph2),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              CpButton(
                text: context.l10n.protectWallet,
                size: CpButtonSize.big,
                minWidth: 300,
                onPressed: () async {
                  final result = await context.router
                      .push<bool>(const BackupPhraseFlowRoute());
                  if (result == true) {
                    await context.router.pop();
                  }
                },
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => _remindMeLater(context),
                child: Text(
                  context.l10n.remindMeLater,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
