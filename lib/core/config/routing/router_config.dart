class RouterConfiguration {
  RouterConfiguration.init();

  final String kRootRoute = '/';
  final authRoutes = const _AuthRoutes._();
  final mainRoutes = const _MainRoutes._();
  final salesRoutes = const _SalesRoutes._();
  final supportRoutes = const _SupportRoutes._();
  final clientsCareRoutes = const _ClientsCareRoutes._();
  final marketingRoutes = const _MarketingRoutes._();
  final managementRoutes = const _ManagementRoutes._();
}

class _AuthRoutes{
  const _AuthRoutes._();

  final String loginPage = '/loginPage';
  final String otpPage = '/otpPage';
}

class _MainRoutes{
  const _MainRoutes._();

  final String salesPage = '/salesPage';
  final String marketingPage = '/marketingPage';
  final String supportPage = '/supportPage';
  final String clientsCarePage = '/clientsCarePage';
  final String managementPage = '/managementPage';

}

class _SalesRoutes{
  const _SalesRoutes._();

  final String listClientsPage = 'listClientsPage';
  final String clientsInvoicesPage = 'clientsInvoicesPage';
  final String actionClientPage = 'actionClientPage';
  final String clientProfilePage = 'clientProfilePage';
  final String actionInvoicePage = 'actionInvoicePage';
}

class _MarketingRoutes{
  const _MarketingRoutes._();

  final String salesPage = '/salesPage';
}

class _SupportRoutes{
  const _SupportRoutes._();

  final String salesPage = '/salesPage';
}

class _ClientsCareRoutes{
  const _ClientsCareRoutes._();

  final String salesPage = '/salesPage';
}

class _ManagementRoutes{
  const _ManagementRoutes._();

  final String salesPage = '/salesPage';
}