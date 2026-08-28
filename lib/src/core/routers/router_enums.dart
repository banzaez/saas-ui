/// Основные роуты приложения
enum MainRouters {
  logo('/'),
  auth('/auth'),
  home('/home'),
  support('/support'),
  buy('/buy'),
  qrCode('/qr-code'),
  tarifs('/tarifs'),
  passwordRecovery('/password_recovery'),
  loading('/loading');

  final String route;
  const MainRouters(this.route);
}

/// Роуты внутри раздела Home
enum HomeRouters {
  companies('/companies'),
  users('/users'),
  statistics('/statistics'),
  invoices('/invoices'),
  services('/services'),
  certificates('/certificates'),
  payments('/payments'),
  legalEntities('/legal-entities'),
  tokenTransactions('/token-transactions'),
  logs('/logs'),
  settings('/settings'),
  referrals('/referrals'),
  tarifs('/tarifs'),
  certificateItem('/certificate-item');

  final String route;
  const HomeRouters(this.route);

  String get fullroute => '/home$route';

  String get routeWithId => switch (this) {
    companies => '$route/:companyId',
    users => '$route/:userId',
    invoices => '$route/:invoiceId',
    services => '$route/:serviceId',
    certificates => '$route/:certificateId',
    payments => '$route/:paymentId',
    certificateItem => '$route/:certificateId',
    legalEntities => '$route/:legalEntityId',
    settings => '$route/:settingId',
    _ => route,
  };
}

/// Роуты внутри раздела Support
enum SupportRouters {
  companies('/companies'),
  legalEntities('/legal-entities'),
  users('/users'),
  products('/products'),
  packages('/packages'),
  tokenTransactions('/token-transactions'),
  logs('/logs'),
  files('/files'),
  settings('/settings');

  final String route;
  const SupportRouters(this.route);

  String get fullroute => '/support$route';
}
