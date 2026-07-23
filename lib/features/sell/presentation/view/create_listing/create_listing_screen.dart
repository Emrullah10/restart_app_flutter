import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/features/sell/presentation/view/create_listing/widgets/category_selector.dart';
import 'package:mobile_flutter/features/sell/presentation/view/create_listing/widgets/listing_form_fields.dart';
import 'package:mobile_flutter/features/sell/presentation/view/create_listing/widgets/photo_upload_section.dart';
import 'package:mobile_flutter/features/sell/presentation/view/create_listing/widgets/safe_selling_info_card.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class CreateListingScreen extends StatefulWidget {
  const CreateListingScreen({super.key});

  @override
  State<CreateListingScreen> createState() => _CreateListingScreenState();
}

class _CreateListingScreenState extends State<CreateListingScreen> {
  int _selectedCategoryIndex = 0;
  late List<String> _categories;

  bool _isNegotiable = false;
  String _selectedCondition = 'Sıfır';
  String _selectedCity = 'İstanbul';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _categories = [
      context.l10n.categoryPart,
      context.l10n.categoryDevice,
      context.l10n.categoryCable,
    ];
    _selectedCondition = context.l10n.conditionNew;
    _selectedCity = context.l10n.cityIstanbul;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111827),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F50C1), // Strong Blue Header
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          context.l10n.createListingTitle,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategorySelector(
              categories: _categories,
              selectedIndex: _selectedCategoryIndex,
              onSelected: (index) =>
                  setState(() => _selectedCategoryIndex = index),
            ),

            Divider(color: Colors.white.withOpacity(0.1), height: 1),

            const PhotoUploadSection(),

            Divider(color: Colors.white.withOpacity(0.1), height: 1),

            // Form Fields
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildFormLabel(context.l10n.labelTitle),
                  buildFormTextField(context.l10n.hintTitle),
                  SizedBox(height: 20.h),

                  buildFormLabel(context.l10n.labelDescription),
                  buildFormTextField(
                    context.l10n.hintDescription,
                    maxLines: 4,
                  ),
                  SizedBox(height: 20.h),

                  buildFormLabel(context.l10n.labelCondition),
                  buildFormDropdown(
                    [
                      context.l10n.conditionNew,
                      context.l10n.conditionUsed,
                      context.l10n.conditionRefurbished,
                    ],
                    _selectedCondition,
                    (val) => setState(() => _selectedCondition = val!),
                  ),
                  SizedBox(height: 20.h),

                  buildFormLabel(context.l10n.labelPrice),
                  Stack(
                    children: [
                      buildFormTextField('0'),
                      Positioned(
                        right: 16.w,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: Text(
                            '₺',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),

                  Row(
                    children: [
                      SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: Checkbox(
                          value: _isNegotiable,
                          onChanged: (val) =>
                              setState(() => _isNegotiable = val!),
                          activeColor: const Color(0xFF0F50C1),
                          side: BorderSide(color: Colors.grey[600]!, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        context.l10n.negotiable,
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Divider(color: Colors.white.withOpacity(0.1), height: 1),

            const SafeSellingInfoCard(),

            Divider(color: Colors.white.withOpacity(0.1), height: 1),

            // Contact Info
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.contactInfo,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  buildFormLabel(context.l10n.labelPhone),
                  buildFormTextField('+90 5XX XXX XX XX'),
                  SizedBox(height: 20.h),

                  buildFormLabel(context.l10n.labelCity),
                  buildFormDropdown(
                    [
                      context.l10n.cityIstanbul,
                      context.l10n.cityAnkara,
                      context.l10n.cityIzmir,
                    ],
                    _selectedCity,
                    (val) => setState(() => _selectedCity = val!),
                  ),
                ],
              ),
            ),

            // Publish Button
            Padding(
              padding: EdgeInsets.all(20.w),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0F50C1), // Strong Blue
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(LucideIcons.send, color: Colors.white, size: 20.sp),
                      SizedBox(width: 8.w),
                      Text(
                        context.l10n.publishButton,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Keyboard padding
            SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 20.h),
          ],
        ),
      ),
    );
  }
}
