import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:setiket/src/common_widgets/common_widgets.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/features/common/domain/ticket.dart';
import 'package:setiket/src/features/common/presentation/checkout/checkout_controller.dart';
import 'package:setiket/src/features/common/presentation/checkout/checkout_state.dart';
import 'package:setiket/src/features/common/presentation/checkout/widget/widget.dart';
import 'package:setiket/src/routes/routes.dart';
import 'package:setiket/src/services/services.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

class CheckoutPage extends ConsumerStatefulWidget {
  final Ticket ticket;
  const CheckoutPage({
    super.key,
    required this.ticket,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends ConsumerState<CheckoutPage> {
  CheckoutController get controller =>
      ref.read(checkoutControllerProvider.notifier);
  CheckoutState get state => ref.watch(checkoutControllerProvider);

  @override
  void initState() {
    safeRebuild(() {
      controller.setTicket(widget.ticket);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(checkoutControllerProvider, (prevState, state) {
      if (prevState?.checkoutValue != state.checkoutValue) {
        state.checkoutValue.whenOrNull(
          data: (message) {
            if (message != null) {
              appSnackBar(context, ColorApp.green, message);
              context.goNamed(Routes.home.name);
            }
          },
          error: (error, stackTrace) {
            final message =
                NetworkExceptions.getErrorMessage(error as NetworkExceptions);
            appSnackBar(context, ColorApp.red, message);
          },
        );
      }
    });

    return StatusBarWidget(
      child: Scaffold(
        body: AsyncValueWidget(
          value: state.ticketValue,
          data: (data) {
            return const Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      CheckoutContentSection(),
                    ],
                  ),
                ),
                CheckoutButtonSection(),
              ],
            );
          },
        ),
      ),
    );
  }
}
