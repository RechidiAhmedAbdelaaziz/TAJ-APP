class CubitErrorState {
  final String? _error;

  CubitErrorState(this._error);

  void onError(void Function(String) onError) {
    if (_error != null) onError(_error);
  }
}
