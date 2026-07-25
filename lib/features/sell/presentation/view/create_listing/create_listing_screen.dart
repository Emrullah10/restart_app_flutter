import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';
import 'package:mobile_flutter/features/sell/presentation/view/create_listing/widgets/category_selector.dart';
import 'package:mobile_flutter/features/sell/presentation/view/create_listing/widgets/listing_form_fields.dart';
import 'package:mobile_flutter/features/sell/presentation/view/create_listing/widgets/photo_upload_section.dart';
import 'package:mobile_flutter/features/sell/presentation/view/create_listing/widgets/safe_selling_info_card.dart';
import 'package:mobile_flutter/features/sell/presentation/viewmodel/create_listing_view_model.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class CreateListingScreen extends ConsumerStatefulWidget {
  const CreateListingScreen({super.key});

  @override
  ConsumerState<CreateListingScreen> createState() =>
      _CreateListingScreenState();
}

class _CreateListingScreenState extends ConsumerState<CreateListingScreen> {
  int _selectedCategoryIndex = 0;
  late List<String> _categories;

  bool _isNegotiable = false;
  String _selectedCondition = 'Sıfır';
  String _selectedCity = 'İstanbul';
  List<XFile> _images = [];

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _phoneController = TextEditingController();

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
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _handlePublish() async {
    if (_titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.labelTitle)),
      );
      return;
    }
    final price = double.tryParse(_priceController.text.trim()) ?? 0.0;

    final success = await ref
        .read(createListingViewModelProvider.notifier)
        .publish(
          title: _titleController.text.trim(),
          description: _descriptionController.text.trim(),
          category: _categories[_selectedCategoryIndex],
          price: price,
          location: _selectedCity,
          imageFilePaths: _images.map((f) => f.path).toList(),
        );

    if (!mounted) return;

    if (success) {
      Navigator.pop(context);
    } else {
      final error = ref.read(createListingViewModelProvider).error;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error?.toString() ?? 'Bir hata oluştu')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isPublishing = ref.watch(createListingViewModelProvider).isLoading;

    return Scaffold(
      backgroundColor: context.isDarkMode
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
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

            Divider(color: context.theme.dividerColor.withOpacity(0.1), height: 1),

            PhotoUploadSection(
              onImagesChanged: (images) => setState(() => _images = images),
            ),

            Divider(color: context.theme.dividerColor.withOpacity(0.1), height: 1),

            // Form Fields
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildFormLabel(context, context.l10n.labelTitle),
                  buildFormTextField(
                    context,
                    context.l10n.hintTitle,
                    controller: _titleController,
                  ),
                  SizedBox(height: 20.h),

                  buildFormLabel(context, context.l10n.labelDescription),
                  buildFormTextField(
                    context,
                    context.l10n.hintDescription,
                    controller: _descriptionController,
                    maxLines: 4,
                  ),
                  SizedBox(height: 20.h),

                  buildFormLabel(context, context.l10n.labelCondition),
                  buildFormDropdown(
                    context,
                    [
                      context.l10n.conditionNew,
                      context.l10n.conditionUsed,
                      context.l10n.conditionRefurbished,
                    ],
                    _selectedCondition,
                    (val) => setState(() => _selectedCondition = val!),
                  ),
                  SizedBox(height: 20.h),

                  buildFormLabel(context, context.l10n.labelPrice),
                  Stack(
                    children: [
                      buildFormTextField(
                        context,
                        '0',
                        controller: _priceController,
                        keyboardType: TextInputType.number,
                      ),
                      Positioned(
                        right: 16.w,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: Text(
                            '₺',
                            style: TextStyle(
                              color: context.isDarkMode
                                  ? AppColors.textSecondaryDark
                                  : AppColors.textSecondaryLight,
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
                          side: BorderSide(
                            color: context.isDarkMode
                                ? AppColors.textSecondaryDark
                                : AppColors.textSecondaryLight,
                            width: 2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        context.l10n.negotiable,
                        style: TextStyle(
                          color: context.isDarkMode
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimaryLight,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Divider(color: context.theme.dividerColor.withOpacity(0.1), height: 1),

            const SafeSellingInfoCard(),

            Divider(color: context.theme.dividerColor.withOpacity(0.1), height: 1),

            // Contact Info
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.contactInfo,
                    style: TextStyle(
                      color: context.isDarkMode
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  buildFormLabel(context, context.l10n.labelPhone),
                  buildFormTextField(
                    context,
                    '+90 5XX XXX XX XX',
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 20.h),

                  buildFormLabel(context, context.l10n.labelCity),
                  buildFormDropdown(
                    context,
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
                  onPressed: isPublishing ? null : _handlePublish,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0F50C1), // Strong Blue
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: isPublishing
                      ? SizedBox(
                          height: 20.h,
                          width: 20.h,
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Row(
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
