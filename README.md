lib/
├─ app/
│  ├─ di/
│  │  ├─ get_it.dart
│  │  ├─ get_it.config.dart        // генерируется injectable
│  │  └─ injectable_module.dart    // @module: Dio, Talker, SharedPrefs и т.п.
│  └─ application.dart             // MaterialApp.router + ThemeCubit
│
├─ core/
│  ├─ constants/app_constants.dart
│  ├─ resources/data_state.dart    // DataSuccess/DataFailed
│  └─ usecase/usecase.dart         // абстракция UseCase
│
├─ data/
│  ├─ local/local_storage.dart     // SharedPreferences обёртка
│  ├─ remote/post_api_service.dart // Dio-запросы
│  ├─ mapper/post_mapper.dart      // Model ↔ Entity
│  ├─ models/post_model.dart       // DTO (data layer)
│  └─ repository/
│     ├─ post_repository_impl.dart
│     └─ settings_repository_impl.dart
│
├─ domain/
│  ├─ models/post.dart             // Entity (чистые данные)
│  ├─ repository/
│  │  ├─ post_repository.dart      // абстракции
│  │  └─ settings_repository.dart
│  └─ usecase/
│     ├─ get_posts_use_case.dart
│     ├─ get_detail_post_use_case.dart
│     ├─ get_theme_use_case.dart
│     └─ change_theme_use_case.dart
│
├─ router/
│  ├─ app_router.dart              // @AutoRouter
│  └─ app_router.gr.dart           // генерируется
│
└─ ui/
├─ posts_list/
│  ├─ bloc/ posts_list_bloc.dart  // PostsListBloc + states/events
│  ├─ cubit/theme_cubit.dart      // управление темой
│  ├─ widgets/post_card.dart
│  └─ posts_screen.dart
└─ detail/
├─ bloc/ detail_post_bloc.dart   // DetailPostBloc + states/events
└─ detail_post_screen.dart