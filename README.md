lib/
├─ app/
│  ├─ di/
│  │  ├─ get_it.dart                 // инициализация зависимостей
│  │  ├─ get_it.config.dart          // генерируется injectable
│  │  └─ injectable_module.dart      // @module: Dio, Talker, SharedPrefs и т.п.
│  └─ application.dart               // корневой виджет, MaterialApp.router + ThemeCubit
│
├─ core/
│  ├─ constants/
│  │  └─ app_constants.dart          // константы: baseUrl, ключи и др.
│  ├─ resources/
│  │  └─ data_state.dart             // обёртка DataSuccess/DataFailed
│  └─ usecase/
│     └─ usecase.dart                // абстракция UseCase<Type, Params>
│
├─ data/
│  ├─ local/
│  │  └─ local_storage.dart          // работа с SharedPreferences
│  ├─ mapper/
│  │  └─ post_mapper.dart            // преобразование PostModel ↔ Post
│  ├─ models/
│  │  └─ post_model.dart             // DTO (data transfer object)
│  ├─ remote/
│  │  └─ post_api_service.dart       // запросы к API через Dio
│  └─ repository/
│     ├─ post_repository_impl.dart       // реализация PostRepository
│     └─ settings_repository_impl.dart   // реализация SettingsRepository
│
├─ domain/
│  ├─ models/
│  │  └─ post.dart                   // Entity (чистые данные для бизнес-логики)
│  ├─ repository/
│  │  ├─ post_repository.dart        // абстракция для работы с постами
│  │  └─ settings_repository.dart    // абстракция для настроек (тема и т.п.)
│  └─ usecase/
│     ├─ change_theme_use_case.dart  // изменить тему
│     ├─ get_detail_post_use_case.dart // получить детальный пост
│     ├─ get_posts_use_case.dart     // получить список постов
│     └─ get_theme_use_case.dart     // получить текущую тему
│
├─ router/
│  ├─ app_router.dart                // конфигурация маршрутов (AutoRoute)
│  └─ app_router.gr.dart             // сгенерированный код роутера
│
└─ ui/
├─ posts_list/
│  ├─ bloc/
│  │  ├─ posts_list_bloc.dart     // бизнес-логика списка постов
│  │  ├─ posts_list_event.dart    // события списка постов
│  │  └─ posts_list_state.dart    // состояния списка постов
│  ├─ widgets/
│  │  └─ post_card.dart           // карточка поста
│  └─ posts_screen.dart           // экран со списком постов
│
├─ detail/
│  ├─ bloc/
│  │  ├─ detail_post_bloc.dart    // бизнес-логика детального поста
│  │  ├─ detail_post_event.dart   // события для детального поста
│  │  └─ detail_post_state.dart   // состояния детального поста
│  └─ detail_post_screen.dart     // экран детализации поста
│
└─ setting/
├─ cubit/
│  ├─ theme_cubit.dart         // управление темой (Cubit)
│  └─ theme_state.dart         // состояние темы (light/dark)
└─ setting_screen.dart         // экран настроек (переключатель темы)

