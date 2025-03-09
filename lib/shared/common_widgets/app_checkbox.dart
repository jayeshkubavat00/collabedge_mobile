import 'package:flutter/material.dart';
import 'package:flutter_sample/utils/contants/app_colors.dart';
import 'package:flutter_sample/utils/responsive/responsive_helper.dart';

class AppCheckbox extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const AppCheckbox(
      {super.key, required this.initialValue, required this.onChanged});

  @override
  State<AppCheckbox> createState() => _AppCheckboxState();
}

class _AppCheckboxState extends State<AppCheckbox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }

  void _handleCheckboxChanged(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
    widget.onChanged(_isChecked); // Pass the updated value back
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleCheckboxChanged(!_isChecked),
      child: Checkbox(
        fillColor: _isChecked
            ? WidgetStatePropertyAll(AppColors.primaryColor1)
            : WidgetStatePropertyAll(AppColors.white),
        side: BorderSide(
          color: AppColors.lightergray, // Use your desired border color here
          width: ResponsiveHelper.responsiveWidth(
              context, 0.005), // Set the width of the border
        ),
        focusColor: AppColors.primaryColor1,
        activeColor: AppColors.primaryColor1,
        value: _isChecked,
        onChanged: _handleCheckboxChanged,
      ),
    );
  }
}
