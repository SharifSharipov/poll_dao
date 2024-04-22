enum FormStatus {
  pure,
  loading,
  error,
  success,
}

extension FormStatusExtension on FormStatus {
  bool get isPure => this == FormStatus.pure;
  bool get isLoading => this == FormStatus.loading;
  bool get isError => this == FormStatus.error;
  bool get isSuccess => this == FormStatus.success;
}