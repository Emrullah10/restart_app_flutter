import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/utils/extensions/context_extensions.dart';

class CreateListingScreen extends StatefulWidget {
  const CreateListingScreen({super.key});

  @override
  State<CreateListingScreen> createState() => _CreateListingScreenState();
}

class _CreateListingScreenState extends State<CreateListingScreen> {
  int _selectedCategoryIndex = 0;
  late List<String> _categories;
  final List<IconData> _categoryIcons = [
    LucideIcons.cpu,
    LucideIcons.smartphone,
    LucideIcons.plug, // Plug as cable
  ];

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
    // Reset selected values to localized versions if needed, or better, use keys/enums.
    // For now assuming the initial values match the first item of localized lists or logic handles it.
    // However, _selectedCondition is initialized to 'Sıfır'. We should probably update it too.
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
            // Category Selection
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.selectCategory,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: List.generate(
                      _categories.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(right: 12.w),
                        child: _buildCategoryChip(index),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Divider(color: Colors.white.withOpacity(0.1), height: 1),

            // Photo Upload Section
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.addPhoto,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildPhotoBox(isCamera: true),
                      _buildPhotoBox(),
                      _buildPhotoBox(),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    context.l10n.photoLimitNote,
                    style: TextStyle(color: Colors.grey[500], fontSize: 12.sp),
                  ),
                ],
              ),
            ),

            Divider(color: Colors.white.withOpacity(0.1), height: 1),

            // Form Fields
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel(context.l10n.labelTitle),
                  _buildTextField(context.l10n.hintTitle),
                  SizedBox(height: 20.h),

                  _buildLabel(context.l10n.labelDescription),
                  _buildTextField(context.l10n.hintDescription, maxLines: 4),
                  SizedBox(height: 20.h),

                  _buildLabel(context.l10n.labelCondition),
                  _buildDropdown(
                    [
                      context.l10n.conditionNew,
                      context.l10n.conditionUsed,
                      context.l10n.conditionRefurbished,
                    ],
                    _selectedCondition,
                    (val) => setState(() => _selectedCondition = val!),
                  ),
                  SizedBox(height: 20.h),

                  _buildLabel(context.l10n.labelPrice),
                  Stack(
                    children: [
                      _buildTextField('0'),
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

            // Safe Selling Info
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: const Color(0xFF1F2937),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Colors.white.withOpacity(0.05)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          LucideIcons.shieldCheck,
                          color: const Color(0xFF3B82F6),
                          size: 20.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Güvenli Satış',
                          style: TextStyle(
                            color: const Color(0xFF3B82F6),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Üniversiteler ve sertifikalı tamircilerle eşleştirme yapıyoruz. Güvenli ödeme ve teslimat garantisi.',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 12.sp,
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Detayları Gör',
                      style: TextStyle(
                        color: const Color(0xFF3B82F6),
                        fontSize: 12.sp,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),

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
                  _buildLabel(context.l10n.labelPhone),
                  _buildTextField('+90 5XX XXX XX XX'),
                  SizedBox(height: 20.h),

                  _buildLabel(context.l10n.labelCity),
                  _buildDropdown(
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

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {int maxLines = 1}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF374151), // Darker gray specific for input
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: TextField(
        maxLines: maxLines,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14.sp),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16.w),
        ),
      ),
    );
  }

  Widget _buildDropdown(
    List<String> items,
    String value,
    Function(String?) onChanged,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF374151),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          dropdownColor: const Color(0xFF374151),
          style: TextStyle(color: Colors.white, fontSize: 14.sp),
          icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
          items: items.map((String item) {
            return DropdownMenuItem<String>(value: item, child: Text(item));
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildPhotoBox({bool isCamera = false}) {
    return Container(
      width: 100.w,
      height: 100.w,
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Colors.grey[700]!,
          style: BorderStyle.solid,
          width:
              1, // To emulate dashed, we would need a custom painter, but generic border is fine for now or could use DottedBorder package if available. The design shows dashed lines.
        ),
      ),
      child: Icon(
        isCamera ? LucideIcons.camera : LucideIcons.plus,
        color: Colors.grey[400],
        size: 24.sp,
      ),
    );
  }

  Widget _buildCategoryChip(int index) {
    bool isSelected = _selectedCategoryIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedCategoryIndex = index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF1F2937)
              : const Color(
                  0xFF1F2937,
                ).withOpacity(0.5), // Design shows darkened bg
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF3B82F6)
                : Colors
                      .transparent, // Blue border if selected? Or just different bg.
            width: isSelected ? 1 : 0,
          ),
        ),
        // Wait, design has specific styling. Let's match the visual more closely.
        // It looks like dark button with Icon + Text.
        child: Row(
          children: [
            Icon(
              _categoryIcons[index],
              color: isSelected ? const Color(0xFF3B82F6) : Colors.grey[400],
              size: 16.sp,
            ),
            SizedBox(width: 8.w),
            Text(
              _categories[index],
              style: TextStyle(
                color: isSelected ? const Color(0xFF3B82F6) : Colors.grey[400],
                fontSize: 14.sp,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
