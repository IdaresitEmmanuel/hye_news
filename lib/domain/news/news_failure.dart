import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_failure.freezed.dart';

@freezed
abstract class NewsFailure with _$NewsFailure {
  const factory NewsFailure.networkFailure() = NetWorkFailure;
  const factory NewsFailure.unexpectedFailure({required String failure}) =
      UnexpectedFailure;
}
