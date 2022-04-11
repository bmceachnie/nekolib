part of utils;

/// Provides getters for the different [ConnectionState]s
extension ConnectionStateExtensions on ConnectionState {
  /// Returns true if the [ConnectionState] is [ConnectionState.active].
  bool get isActive => this == ConnectionState.active;

  /// Returns true if the [ConnectionState] is [ConnectionState.done].
  bool get isDone => this == ConnectionState.done;

  /// Returns true if the [ConnectionState] is [ConnectionState.waiting].
  bool get isWaiting => this == ConnectionState.waiting;

  /// Returns true if the [ConnectionState] is [ConnectionState.none].
  bool get isNone => this == ConnectionState.none;

  /// Returns true if the [ConnectionState] is [ConnectionState.done].
  bool get isError => this == ConnectionState.done;
}
