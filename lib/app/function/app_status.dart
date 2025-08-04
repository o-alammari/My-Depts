enum AppStatus { initial, success, error, loading,loaded }

extension AppStatusX on AppStatus {
  bool get isInitial => this == AppStatus.initial;
  bool get isSuccess => this == AppStatus.success;
  bool get isError => this == AppStatus.error;
  bool get isLoading => this == AppStatus.loading;
  bool get isLoaded => this == AppStatus.loaded;
}
