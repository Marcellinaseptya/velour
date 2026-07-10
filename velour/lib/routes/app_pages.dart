import 'package:get/get.dart';
import '../features/landing_page/controllers/landing_page_controller.dart';
import '../features/landing_page/views/landing_page_view.dart';
import '../features/dashboard/controllers/dashboard_controller.dart';
import '../features/dashboard/views/dashboard_view.dart';
import '../features/dashboard/views/categories_page_5.dart';
import '../features/dashboard/views/categories_page_6.dart';
import '../features/dashboard/views/categories_page_7.dart';
import '../features/dashboard/views/product_detail_view.dart';
import '../features/dashboard/views/product_detail_1_view.dart';
import '../features/dashboard/views/product_detail_2_view.dart';
import '../features/dashboard/views/product_detail_3_view.dart';
import '../features/dashboard/views/continue_shopping_view.dart';
import '../features/dashboard/views/filter_page_view.dart';
import '../features/dashboard/views/filter_success_view.dart';
import '../features/dashboard/views/review_page_view.dart';
import '../features/dashboard/views/history_page_view.dart';
import '../features/dashboard/views/history_ongoing_view.dart';
import '../features/dashboard/views/history_completed_view.dart';
import '../features/dashboard/views/tracking_detail_view.dart';
import '../features/dashboard/views/tracking_address_view.dart';
import '../features/cart/views/cart_1_view.dart';
import '../features/cart/views/cart_2_view.dart';
import '../features/cart/views/cart_3_view.dart';
import '../features/cart/views/cart_4_view.dart';
import '../features/cart/views/voucher_view.dart';
import '../features/cart/controllers/cart_controller.dart';
import '../features/cart/controllers/cart_4_controller.dart';
import '../features/splash/controllers/splash_controller.dart';
import '../features/splash/views/splash_view.dart';
import '../features/onboarding/controllers/onboarding_controller.dart';
import '../features/onboarding/views/onboarding_view.dart';
import '../features/login/controllers/login_controller.dart';
import '../features/login/views/login_view.dart';
import '../features/register/controllers/register_controller.dart';
import '../features/register/views/register_view.dart';
import '../features/success/controllers/success_controller.dart';
import '../features/success/views/success_view.dart';
import '../features/cart/views/order_view.dart';
import '../features/cart/views/payment_method_view.dart';
import '../features/success/views/order_confirmed_view.dart';
import '../features/dashboard/views/notification_view.dart';
import '../features/dashboard/views/profile_view.dart';
import '../features/dashboard/views/rewards_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: BindingsBuilder(() {
        Get.put(SplashController());
      }),
    ),
    GetPage(
      name: Routes.ONBOARDING,
      page: () => const OnboardingView(),
      binding: BindingsBuilder(() {
        Get.put(OnboardingController());
      }),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: BindingsBuilder(() {
        Get.put(LoginController());
      }),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterView(),
      binding: BindingsBuilder(() {
        Get.put(RegisterController());
      }),
    ),
    GetPage(
      name: Routes.SUCCESS,
      page: () => const SuccessView(),
      binding: BindingsBuilder(() {
        Get.put(SuccessController());
      }),
    ),
    GetPage(
      name: Routes.LANDING,
      page: () => const LandingPageView(),
      binding: BindingsBuilder(() {
        Get.put(LandingPageController());
      }),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const DashboardView(),
      binding: BindingsBuilder(() {
        Get.put(DashboardController());
      }),
    ),
    GetPage(
      name: Routes.MAIN_PAGE_1,
      page: () => const DashboardView(),
      binding: BindingsBuilder(() {
        Get.put(DashboardController());
      }),
    ),
    GetPage(
      name: Routes.MAIN_PAGE_2,
      page: () => const DashboardView(),
      binding: BindingsBuilder(() {
        Get.put(DashboardController());
      }),
    ),
    GetPage(
      name: Routes.MAIN_PAGE_3,
      page: () => const DashboardView(),
      binding: BindingsBuilder(() {
        Get.put(DashboardController());
      }),
    ),
    GetPage(
      name: Routes.MAIN_PAGE_4,
      page: () => const DashboardView(),
      binding: BindingsBuilder(() {
        Get.put(DashboardController());
      }),
    ),
    GetPage(
      name: Routes.CATEGORY_1,
      page: () => const DashboardView(),
      binding: BindingsBuilder(() {
        Get.put(DashboardController());
      }),
    ),
    GetPage(
      name: Routes.CATEGORY_2,
      page: () => const DashboardView(),
      binding: BindingsBuilder(() {
        Get.put(DashboardController());
      }),
    ),
    GetPage(
      name: Routes.CATEGORY_3,
      page: () => const DashboardView(),
      binding: BindingsBuilder(() {
        Get.put(DashboardController());
      }),
    ),
    GetPage(
      name: Routes.CATEGORY_4,
      page: () => const DashboardView(),
      binding: BindingsBuilder(() {
        Get.put(DashboardController());
      }),
    ),
    GetPage(
      name: Routes.CATEGORY_5,
      page: () => const CategoriesPage5(),
    ),
    GetPage(
      name: Routes.CATEGORY_6,
      page: () => const CategoriesPage6(),
    ),
    GetPage(
      name: Routes.CATEGORY_7,
      page: () => const CategoriesPage7(),
    ),
    GetPage(
      name: Routes.PRODUCT_DETAIL,
      page: () => const ProductDetailView(),
    ),
    GetPage(
      name: Routes.PRODUCT_DETAIL1,
      page: () => const ProductDetail1View(),
    ),
    GetPage(
      name: Routes.PRODUCT_DETAIL2,
      page: () => const ProductDetail2View(),
    ),
    GetPage(
      name: Routes.PRODUCT_DETAIL3,
      page: () => const ProductDetail3View(),
    ),
    GetPage(
      name: Routes.CONTINUE_SHOPPING,
      page: () => const ContinueShoppingView(),
    ),
    GetPage(
      name: Routes.FILTER_PAGE,
      page: () => const FilterPageView(),
    ),
    GetPage(
      name: Routes.FILTER_SUCCESS,
      page: () => const FilterSuccessView(),
    ),
    GetPage(
      name: Routes.REVIEW_PAGE,
      page: () => const ReviewPageView(),
    ),
    GetPage(
      name: Routes.HISTORY_PAGE,
      page: () => const HistoryPageView(),
    ),
    GetPage(
      name: Routes.HISTORY_ONGOING,
      page: () => const HistoryOngoingView(),
    ),
    GetPage(
      name: Routes.HISTORY_COMPLETED,
      page: () => const HistoryCompletedView(),
    ),
    GetPage(
      name: Routes.TRACKING_DETAIL,
      page: () => const TrackingDetailView(),
    ),
    GetPage(
      name: Routes.TRACKING_ADDRESS,
      page: () => const TrackingAddressView(),
    ),
    GetPage(
      name: Routes.CART_1,
      page: () => const Cart1View(),
    ),
    GetPage(
      name: Routes.CART_2,
      page: () => const Cart2View(),
      binding: BindingsBuilder(() {
        Get.put(CartController());
      }),
    ),
    GetPage(
      name: Routes.CART_3,
      page: () => const Cart3View(),
      binding: BindingsBuilder(() {
        Get.put(CartController());
      }),
    ),
    GetPage(
      name: Routes.CART_4,
      page: () => const Cart4View(),
      binding: BindingsBuilder(() {
        Get.put(Cart4Controller());
      }),
    ),
    GetPage(
      name: Routes.VOUCHER,
      page: () => const VoucherView(),
    ),
    GetPage(
      name: Routes.ORDER,
      page: () => const OrderView(),
    ),
    GetPage(
      name: Routes.PAYMENT_METHOD,
      page: () => const PaymentMethodView(),
    ),
    GetPage(
      name: Routes.ORDER_CONFIRMED,
      page: () => const OrderConfirmedView(),
    ),
    GetPage(
      name: Routes.NOTIFICATION,
      page: () => const NotificationView(),
      binding: BindingsBuilder(() {
        Get.put(DashboardController());
      }),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => const ProfileView(),
      binding: BindingsBuilder(() {
        Get.put(DashboardController());
      }),
    ),
    GetPage(
      name: Routes.REWARDS,
      page: () => const RewardsView(),
      binding: BindingsBuilder(() {
        Get.put(DashboardController());
      }),
    ),
  ];
}
