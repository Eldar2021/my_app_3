part of 'web_view_cubit.dart';

class WebViewState extends Equatable {
  const WebViewState(this.network);

  final bool network;

  @override
  List<Object?> get props => [network];
}
