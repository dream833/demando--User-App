import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));
    final controller = Get.put(HomeController());
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Obx(() {
          return controller.isLoading.value
              ? _buildShimmerLoader()
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(theme),
                      SizedBox(height: 5.h),
                      _buildBanner(controller),
                      SizedBox(height: 20.h),
                      _buildExploreCategories(controller, theme),
                      SizedBox(height: 25.h),
                      _buildFeaturedVendors(),
                      SizedBox(height: 30.h),
                    ],
                  ),
                );
        }),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) => Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 44.h,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                children: const [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 8),
                  Text("Search your favorites...", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.location_on_outlined, size: 20, color: Colors.deepPurple),
                    SizedBox(width: 4),
                    Text("Gobardanga, Ichapur",
                        style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black87)),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple.shade50,
                  ),
                  padding: EdgeInsets.all(6.w),
                  child: const Icon(Icons.person_outline, color: Colors.deepPurple),
                ),
              ],
            ),
          ],
        ),
      );

  Widget _buildBanner(HomeController controller) => SizedBox(
        height: 150.h,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              controller: controller.pageController,
              onPageChanged: (index) => controller.currentBannerIndex.value = index,
              itemCount: controller.banners.length,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: NetworkImage(controller.banners[index]),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 2)),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10.h,
              child: Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(controller.banners.length, (index) {
                      bool isActive = controller.currentBannerIndex.value == index;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        width: isActive ? 12.w : 6.w,
                        height: 6.h,
                        decoration: BoxDecoration(
                          color: isActive ? Colors.deepPurple : Colors.grey[400],
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    }),
                  )),
            ),
          ],
        ),
      );

 Widget _buildExploreCategories(HomeController controller, ThemeData theme) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Explore Categories",
            style: theme.textTheme.titleSmall!
                .copyWith(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16.sp),
          ),
          SizedBox(height: 8.h),
          LayoutBuilder(
            builder: (context, constraints) {
              double containerWidth = constraints.maxWidth;

              return Wrap(
                spacing: 10.w,
                runSpacing: 12.h,
                children: List.generate(controller.categories.length, (index) {
                  final cat = controller.categories[index];

                  int subCount = 0;
                  if (cat['sub1'] != null) subCount++;
                  if (cat['sub2'] != null) subCount++;

                  double itemWidth = (subCount == 2)
                      ? (containerWidth - 12.w) / 2
                      : containerWidth;

                  return Container(
                    width: itemWidth,
                    padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12.withOpacity(0.05),
                            blurRadius: 8.w,
                            offset: const Offset(0, 2)),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Padding(
                            padding:  EdgeInsets.all(4.0.sp),
                            child: Text(
                            cat['title']!,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87),
                                                    ),
                          ),
                    
                        // Daily Services / Sub-items - up-left aligned, fully round icons
                        if (cat['sub1'] != null)
                        
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 40.w,
                                height: 40.w,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple.shade50,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.local_grocery_store,
                                    color: Colors.deepPurple, size: 22),
                              ),
                              SizedBox(width: 6.w),
                              Flexible(
                                child: Text(
                                  cat['sub1']!,
                                  style:  TextStyle(fontSize: 13.w),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        if (cat['sub2'] != null) SizedBox(height: 6.h),
                        if (cat['sub2'] != null)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 40.w,
                                height: 40.w,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple.shade50,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.restaurant,
                                    color: Colors.deepPurple, size: 22),
                              ),
                              SizedBox(width: 6.w),
                              Flexible(
                                child: Text(
                                  cat['sub2']!,
                                  style:  TextStyle(fontSize: 13.w),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        SizedBox(height: 10.h),
                        // Main Category Title - niche
                      
                      ],
                    ),
                  );
                }),
              );
            },
          ),
        ],
      ),
    );

  Widget _buildFeaturedVendors() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Featured Vendors", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
            SizedBox(height: 12.h),
            SizedBox(
              height: 140.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  margin: EdgeInsets.only(right: 12.w),
                  width: 200.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12.withOpacity(0.08),
                          blurRadius: 6,
                          offset: const Offset(0, 2)),
                    ],
                    image: DecorationImage(
                      image: NetworkImage('https://picsum.photos/400?random=$index'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Text("Vendor ${index + 1}",
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildShimmerLoader() => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: List.generate(
              4,
              (index) => Container(
                margin: EdgeInsets.only(bottom: 20.h),
                height: 150.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ),
      );
}