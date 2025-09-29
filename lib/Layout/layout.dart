import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class AppTheme {
  // Warna-warna abu-abu yang kalem dan elegan
  static const Color primaryGray = Color(0xFF6B7280); // Abu-abu medium
  static const Color lightGray = Color(
    0xFFF3F4F6,
  ); // Abu-abu terang untuk background
  static const Color mediumGray = Color(
    0xFFD1D5DB,
  ); // Abu-abu medium untuk border
  static const Color darkGray = Color(0xFF374151); // Abu-abu gelap untuk text
  static const Color veryLightGray = Color(0xFFFAFAFA); // Abu-abu sangat terang
  static const Color charcoalGray = Color(
    0xFF1F2937,
  ); // Abu-abu gelap untuk AppBar
  static const Color warmGray = Color(
    0xFF9CA3AF,
  ); // Abu-abu hangat untuk subtitle

  // Accent colors yang tetap kalem
  static const Color accentBlue = Color(0xFF64748B); // Biru abu-abu
  static const Color successGreen = Color(0xFF059669); // Hijau kalem
  static const Color warningOrange = Color(0xFFD97706); // Orange kalem
  static const Color errorRed = Color(0xFFDC2626); // Merah kalem

  static ThemeData get theme {
    return ThemeData(
      primarySwatch: MaterialColor(0xFF6B7280, {
        50: veryLightGray,
        100: lightGray,
        200: mediumGray,
        300: warmGray,
        400: primaryGray,
        500: primaryGray,
        600: darkGray,
        700: charcoalGray,
        800: charcoalGray,
        900: charcoalGray,
      }),
      scaffoldBackgroundColor: veryLightGray,
      appBarTheme: AppBarTheme(
        backgroundColor: charcoalGray,
        foregroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.black26,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryGray,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 2,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: mediumGray),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: mediumGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: primaryGray, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: errorRed),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 2,
        shadowColor: Colors.black12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          color: charcoalGray,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: charcoalGray,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: darkGray,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: darkGray,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(color: darkGray, fontSize: 16),
        bodyMedium: TextStyle(color: primaryGray, fontSize: 14),
        bodySmall: TextStyle(color: warmGray, fontSize: 12),
      ),
    );
  }
}

class BaseLayout extends StatefulWidget {
  final String? title;
  final Widget body;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final bool showBackButton;
  final bool centerTitle;
  final VoidCallback? onBackPressed;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;
  final bool showBottomNavigation;
  final List<BottomNavigationBarItem>? bottomNavItems;
  final int? currentIndex;
  final ValueChanged<int>? onBottomNavTap;
  // Additional AppBar customization parameters
  final bool showAppBar;
  final AppBar? customAppBar;
  final Color? appBarBackgroundColor;
  final Color? appBarForegroundColor;
  final double? appBarElevation;
  final TextStyle? titleTextStyle;
  final Widget? leading;
  final double? toolbarHeight;

  const BaseLayout({
    super.key,
    this.title,
    required this.body,
    this.actions,
    this.floatingActionButton,
    this.showBackButton = true,
    this.centerTitle = true,
    this.onBackPressed,
    this.backgroundColor,
    this.bottom,
    this.showBottomNavigation = false,
    this.bottomNavItems,
    this.currentIndex,
    this.onBottomNavTap,
    // New parameters for AppBar customization
    this.showAppBar = true,
    this.customAppBar,
    this.appBarBackgroundColor,
    this.appBarForegroundColor,
    this.appBarElevation,
    this.titleTextStyle,
    this.leading,
    this.toolbarHeight,
  });

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  int selected = 0;
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    if (widget.currentIndex != null) {
      selected = widget.currentIndex!;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor ?? AppTheme.veryLightGray,
      appBar: widget.showAppBar ? _buildAppBar() : null,
      body: SafeArea(child: widget.body),
      bottomNavigationBar: widget.showBottomNavigation
          ? StylishBottomBar(
            
              option: BubbleBarOptions(
                barStyle: BubbleBarStyle.horizontal,
                bubbleFillStyle: BubbleFillStyle.fill,
                iconSize: 24,
                opacity: 0.3,
              ),
              items: [
                BottomBarItem(
                  icon: const Icon(Icons.home_outlined),
                  selectedIcon: const Icon(Icons.home),
                  title: const Text('Home'),
                  backgroundColor: AppTheme.primaryGray,
                ),
                BottomBarItem(
                  icon: const Icon(Icons.person_outlined),
                  selectedIcon: const Icon(Icons.person),
                  title: const Text('Profile'),
                  backgroundColor: AppTheme.darkGray,
                ),
              ],
              hasNotch: true,
              currentIndex: selected,
              onTap: (index) {
                setState(() {
                  selected = index;
                });
                
                if (index == 0) {
                  final currentRoute = ModalRoute.of(context)?.settings.name;
                  if (currentRoute != '/home' && currentRoute != '/') {
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                } else if (index == 1) {
                  final currentRoute = ModalRoute.of(context)?.settings.name;
                  if (currentRoute != '/profile') {
                    Navigator.pushReplacementNamed(context, '/profile');
                  }
                }
                
                if (widget.onBottomNavTap != null) {
                  widget.onBottomNavTap!(index);
                }
              },
            )
          : null,
      floatingActionButton: widget.floatingActionButton,
    );
  }

  PreferredSizeWidget? _buildAppBar() {
    // If custom AppBar is provided, use it
    if (widget.customAppBar != null) {
      return widget.customAppBar;
    }

    // If title is null and actions are null, return null (no AppBar)
    if (widget.title == null && widget.actions == null) {
      return null;
    }

    return AppBar(
      title: widget.title != null 
        ? Text(
            widget.title!,
            style: widget.titleTextStyle ?? const TextStyle(
              fontWeight: FontWeight.w600, 
              fontSize: 18,
            ),
          )
        : null,
      centerTitle: widget.centerTitle,
      elevation: widget.appBarElevation ?? 0,
      backgroundColor: widget.appBarBackgroundColor ?? AppTheme.primaryGray,
      foregroundColor: widget.appBarForegroundColor ?? Colors.white,
      leading: widget.leading ?? (widget.showBackButton && Navigator.canPop(context)
        ? IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: widget.onBackPressed ?? () => Navigator.pop(context),
          )
        : null),
      actions: widget.actions,
      bottom: widget.bottom,
      toolbarHeight: widget.toolbarHeight,
      automaticallyImplyLeading: widget.showBackButton,
    );
  }
}

class CardContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? elevation;
  final Color? color;

  const CardContainer({
    super.key,
    required this.child,
    this.margin,
    this.padding,
    this.elevation,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.all(16),
      child: Card(
        elevation: elevation ?? 2,
        color: color ?? Colors.white,
        child: Padding(padding: padding ?? EdgeInsets.all(16), child: child),
      ),
    );
  }
}

class GradientBackground extends StatelessWidget {
  final Widget child;
  final List<Color>? colors;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;

  const GradientBackground({
    super.key,
    required this.child,
    this.colors,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: colors ?? [AppTheme.veryLightGray, AppTheme.lightGray],
        ),
      ),
      child: child,
    );
  }
}

class FormContainer extends StatelessWidget {
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final EdgeInsetsGeometry? padding;

  const FormContainer({
    super.key,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.stretch,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      padding: padding ?? EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: mainAxisAlignment,
        children: _addSpacing(children),
      ),
    );
  }

  List<Widget> _addSpacing(List<Widget> children) {
    List<Widget> spacedChildren = [];
    for (int i = 0; i < children.length; i++) {
      spacedChildren.add(children[i]);
      if (i < children.length - 1) {
        spacedChildren.add(SizedBox(height: 16));
      }
    }
    return spacedChildren;
  }
}

class LoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final String? loadingText;

  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    this.loadingText,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: Colors.black54,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppTheme.primaryGray,
                    ),
                  ),
                  if (loadingText != null) ...[
                    SizedBox(height: 16),
                    Text(
                      loadingText!,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ],
              ),
            ),
          ),
      ],
    );
  }
}
