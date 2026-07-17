import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:roomgenius_mobile/shared/widgets/custom_drop_down.dart';

void main() {
  testWidgets(
    'shows the initial value and reports selection changes',
    (tester) async {
      String? selectedValue;

      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(390, 844),
          builder: (context, child) {
            return MaterialApp(
              home: Scaffold(
                body: CustomDropdown(
                  items: const [
                    'Modern',
                    'Classic',
                  ],
                  initialValue: 'Modern',
                  onChanged: (value) {
                    selectedValue = value;
                  },
                ),
              ),
            );
          },
        ),
      );

      expect(find.text('Modern'), findsOneWidget);

      await tester.tap(find.text('Modern'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Classic').last);
      await tester.pumpAndSettle();

      expect(selectedValue, 'Classic');
      expect(find.text('Classic'), findsOneWidget);
    },
  );
}
