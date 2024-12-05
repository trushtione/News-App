import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/article_model.dart';
import '../repositories/news_repository.dart';
import 'news_events.dart';
import 'news_states.dart';

class NewsBloc extends Bloc<NewsEvents, NewsStates> {
  final NewsRepository newsRepositoty;

  NewsBloc({required NewsStates initialState, required this.newsRepositoty})
      : super(initialState) {
    // Register the event handler for StartEvent
    on<StartEvent>((event, emit) async {
      try {
        emit(NewsLoadingState());
        List<ArticleModel> articleList = await newsRepositoty.fetchNews();
        emit(NewsLoadedState(articleList: articleList));
      } catch (e) {
        emit(NewsErrorState(errorMessage: e.toString()));
      }
    });

    // Add the StartEvent after registering the handler
    add(StartEvent());
  }
}
