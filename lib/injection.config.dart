// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/news/bloc/news_bloc.dart' as _i5;
import 'domain/news/i_news_facade.dart' as _i3;
import 'infrastructure/news/news_facade.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.INewsFacade>(() => _i4.NewsFacade());
  gh.factory<_i5.NewsBloc>(() => _i5.NewsBloc(get<_i3.INewsFacade>()));
  return get;
}
