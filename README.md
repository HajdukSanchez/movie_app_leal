# Movies an Tv Shows App

This project was created based on a technical test for [Leal.co](https://leal.co/)

This project as made with Clean Architecture structure and TDD behavior.

Main approaches:
- Only the Login button works
- The login data is hard coded and only works with specific inputs
- The API key and other variables stuff are written inside the code for test purposes
- I made 6/8 pages

## Start working

1. Download the base code 🗂
2. Install the Pub dependencies ✅
	```bash
	flutter pub get
	```
3. Run test 🧪
	```bash
	flutter test
	```
4. Start project to see it working 🚀

> This application get different list of todays Tv Shows.

See my work:

- [Github](https://github.com/HajdukSanchez)

- [Linkedin](https://www.linkedin.com/in/jozek-hajduk/)

- [Web](https://hajduk-sanchez.com/)

## Folders structure

Lib Folder

```
📦lib
 ┣ 📂core
 ┃ ┣ 📂error
 ┃ ┃ ┣ 📜exceptions.dart
 ┃ ┃ ┣ 📜failures.dart
 ┃ ┃ ┗ 📜messages.dart
 ┃ ┣ 📂routes
 ┃ ┃ ┗ 📜routes.dart
 ┃ ┣ 📂theme
 ┃ ┃ ┗ 📜theme_data.dart
 ┃ ┣ 📂usecases
 ┃ ┃ ┗ 📜usecase.dart
 ┃ ┣ 📂util
 ┃ ┃ ┣ 📜dialog_messages.dart
 ┃ ┃ ┣ 📜failure_to_message.dart
 ┃ ┃ ┣ 📜image_path_generator.dart
 ┃ ┃ ┣ 📜modify_text_length.dart
 ┃ ┃ ┣ 📜set_stars.dart
 ┃ ┃ ┗ 📜url_path_converter.dart
 ┃ ┗ 📂widgets
 ┃ ┃ ┣ 📜information_container.dart
 ┃ ┃ ┣ 📜list_separator.dart
 ┃ ┃ ┣ 📜movie_detail_button.dart
 ┃ ┃ ┣ 📜movies_action_button.dart
 ┃ ┃ ┣ 📜movies_button.dart
 ┃ ┃ ┣ 📜movies_image.dart
 ┃ ┃ ┣ 📜movies_text_field.dart
 ┃ ┃ ┗ 📜movies_title.dart
 ┣ 📂features
 ┃ ┣ 📂auth
 ┃ ┃ ┣ 📂data
 ┃ ┃ ┃ ┣ 📂datasources
 ┃ ┃ ┃ ┃ ┣ 📜auth_local_data_source.dart
 ┃ ┃ ┃ ┃ ┗ 📜auth_remote_data_source.dart
 ┃ ┃ ┃ ┣ 📂models
 ┃ ┃ ┃ ┃ ┗ 📜auth_model.dart
 ┃ ┃ ┃ ┗ 📂repositories
 ┃ ┃ ┃ ┃ ┗ 📜auth_repository_impl.dart
 ┃ ┃ ┣ 📂domain
 ┃ ┃ ┃ ┣ 📂entities
 ┃ ┃ ┃ ┃ ┗ 📜auth.dart
 ┃ ┃ ┃ ┣ 📂repositories
 ┃ ┃ ┃ ┃ ┗ 📜auth_repository.dart
 ┃ ┃ ┃ ┗ 📂usecases
 ┃ ┃ ┃ ┃ ┣ 📜log_out.dart
 ┃ ┃ ┃ ┃ ┗ 📜login.dart
 ┃ ┃ ┗ 📂presentation
 ┃ ┃ ┃ ┣ 📂bloc
 ┃ ┃ ┃ ┃ ┣ 📂auth_bloc
 ┃ ┃ ┃ ┃ ┃ ┣ 📜auth_bloc.dart
 ┃ ┃ ┃ ┃ ┃ ┣ 📜auth_event.dart
 ┃ ┃ ┃ ┃ ┃ ┗ 📜auth_state.dart
 ┃ ┃ ┃ ┃ ┗ 📜blocs.dart
 ┃ ┃ ┃ ┣ 📂pages
 ┃ ┃ ┃ ┃ ┣ 📜loading_page.dart
 ┃ ┃ ┃ ┃ ┗ 📜welcome_page.dart
 ┃ ┃ ┃ ┗ 📂widgets
 ┃ ┃ ┃ ┃ ┗ 📜background_container.dart
 ┃ ┗ 📂tv_show
 ┃ ┃ ┣ 📂data
 ┃ ┃ ┃ ┣ 📂datasources
 ┃ ┃ ┃ ┃ ┗ 📜tv_show_remote_data_source.dart
 ┃ ┃ ┃ ┣ 📂models
 ┃ ┃ ┃ ┃ ┗ 📜tv_show_model.dart
 ┃ ┃ ┃ ┗ 📂repositories
 ┃ ┃ ┃ ┃ ┗ 📜tv_show_repository_impl.dart
 ┃ ┃ ┣ 📂domain
 ┃ ┃ ┃ ┣ 📂entities
 ┃ ┃ ┃ ┃ ┗ 📜tv_show.dart
 ┃ ┃ ┃ ┣ 📂repositories
 ┃ ┃ ┃ ┃ ┗ 📜tv_show_repository.dart
 ┃ ┃ ┃ ┗ 📂usecases
 ┃ ┃ ┃ ┃ ┣ 📜get_airing_today_tv_shows.dart
 ┃ ┃ ┃ ┃ ┣ 📜get_details_tv_shows.dart
 ┃ ┃ ┃ ┃ ┣ 📜get_popular_tv_shows.dart
 ┃ ┃ ┃ ┃ ┗ 📜get_recommended_tv_shows.dart
 ┃ ┃ ┗ 📂presentation
 ┃ ┃ ┃ ┣ 📂bloc
 ┃ ┃ ┃ ┃ ┗ 📂tv_show
 ┃ ┃ ┃ ┃ ┃ ┣ 📜tv_show_bloc.dart
 ┃ ┃ ┃ ┃ ┃ ┣ 📜tv_show_event.dart
 ┃ ┃ ┃ ┃ ┃ ┗ 📜tv_show_state.dart
 ┃ ┃ ┃ ┣ 📂pages
 ┃ ┃ ┃ ┃ ┣ 📜details_page.dart
 ┃ ┃ ┃ ┃ ┣ 📜favorites_page.dart
 ┃ ┃ ┃ ┃ ┣ 📜home_page.dart
 ┃ ┃ ┃ ┃ ┣ 📜navigator_page.dart
 ┃ ┃ ┃ ┃ ┣ 📜poster_detail_page.dart
 ┃ ┃ ┃ ┃ ┣ 📜recent_detail_page.dart
 ┃ ┃ ┃ ┃ ┗ 📜recent_page.dart
 ┃ ┃ ┃ ┗ 📂widgets
 ┃ ┃ ┃ ┃ ┣ 📜movie_list.dart
 ┃ ┃ ┃ ┃ ┣ 📜movie_page_layout.dart
 ┃ ┃ ┃ ┃ ┣ 📜movie_poster.dart
 ┃ ┃ ┃ ┃ ┗ 📜movie_view.dart
 ┣ 📜generated_plugin_registrant.dart
 ┣ 📜injection_dependency_container.dart
 ┗ 📜main.dart
```

Test Folder

```
📦test
 ┣ 📂core
 ┃ ┗ 📂util
 ┃ ┃ ┣ 📜failure_to_message_test.dart
 ┃ ┃ ┣ 📜image_path_generator_test.dart
 ┃ ┃ ┣ 📜modify_text_length_test.dart
 ┃ ┃ ┣ 📜set_stars_test.dart
 ┃ ┃ ┗ 📜url_path_converter_test.dart
 ┣ 📂features
 ┃ ┣ 📂auth
 ┃ ┃ ┣ 📂data
 ┃ ┃ ┃ ┣ 📂datasources
 ┃ ┃ ┃ ┃ ┣ 📜auth_local_data_source_test.dart
 ┃ ┃ ┃ ┃ ┗ 📜auth_remote_data_source_test.dart
 ┃ ┃ ┃ ┣ 📂models
 ┃ ┃ ┃ ┃ ┗ 📜auth_model_test.dart
 ┃ ┃ ┃ ┗ 📂repository
 ┃ ┃ ┃ ┃ ┗ 📜auth_repository_impl_test.dart
 ┃ ┃ ┣ 📂domain
 ┃ ┃ ┃ ┗ 📂usecases
 ┃ ┃ ┃ ┃ ┣ 📜log_out_test.dart
 ┃ ┃ ┃ ┃ ┗ 📜login_test.dart
 ┃ ┃ ┗ 📂presentation
 ┃ ┃ ┃ ┗ 📂bloc
 ┃ ┃ ┃ ┃ ┗ 📂auth_bloc
 ┃ ┃ ┃ ┃ ┃ ┗ 📜auth_bloc_test.dart
 ┃ ┗ 📂tv_show
 ┃ ┃ ┣ 📂data
 ┃ ┃ ┃ ┣ 📂datasource
 ┃ ┃ ┃ ┃ ┗ 📜tv_show_remote_data_source_test.dart
 ┃ ┃ ┃ ┣ 📂models
 ┃ ┃ ┃ ┃ ┗ 📜tv_show_model_test.dart
 ┃ ┃ ┃ ┗ 📂repositories
 ┃ ┃ ┃ ┃ ┗ 📜tv_show_repository_impl_test.dart
 ┃ ┃ ┣ 📂domain
 ┃ ┃ ┃ ┗ 📂usecases
 ┃ ┃ ┃ ┃ ┣ 📜get_airing_today_tv_shows_test.dart
 ┃ ┃ ┃ ┃ ┣ 📜get_details_tv_show_test.dart
 ┃ ┃ ┃ ┃ ┣ 📜get_popular_tv_shows_test.dart
 ┃ ┃ ┃ ┃ ┗ 📜get_recommended_tv_shows_test.dart
 ┃ ┃ ┗ 📂presentation
 ┃ ┃ ┃ ┗ 📂bloc
 ┃ ┃ ┃ ┃ ┗ 📂tv_show
 ┃ ┃ ┃ ┃ ┃ ┗ 📜tv_show_bloc_test.dart
 ┗ 📂fixtures
 ┃ ┣ 📜auth.json
 ┃ ┣ 📜fixture.dart
 ┃ ┣ 📜tests_values.dart
 ┃ ┣ 📜tv_show.json
 ┃ ┗ 📜tv_shows.json
```

## Images

<div style="display: flex; felx-direction:row;">
  <img src="https://user-images.githubusercontent.com/76627513/178543905-6bcda32e-c1db-411f-81a0-c7c265408736.png" alt="drawing" width="150"/>
  <img src="https://user-images.githubusercontent.com/76627513/178543956-75799e15-8834-43b5-b54b-27f19e1066bc.png" alt="drawing" width="150"/>
  <img src="https://user-images.githubusercontent.com/76627513/178543989-6e315afa-8b8f-40e5-b486-bbeb3b695d77.png" alt="drawing" width="150"/>
  <img src="https://user-images.githubusercontent.com/76627513/178544013-614097a6-1e74-4efc-ae28-01a3dde326a8.png" alt="drawing" width="150"/>
  <img src="https://user-images.githubusercontent.com/76627513/178544032-35f06503-a3a4-4bed-b7b2-794752ba45a7.png" alt="drawing" width="150"/>
  <img src="https://user-images.githubusercontent.com/76627513/178544055-e30f15dd-3889-46bf-ba22-58dff050963a.png" alt="drawing" width="150"/>
  <img src="https://user-images.githubusercontent.com/76627513/178544105-f46c9996-7d42-478f-ba8a-5a56b176f1f2.png" alt="drawing" width="150"/>
  <img src="https://user-images.githubusercontent.com/76627513/178544138-ed7fd8af-5342-484b-b311-fe883bee22b0.png" alt="drawing" width="150"/>
  <img src="https://user-images.githubusercontent.com/76627513/178544166-751b5dcc-40aa-4891-acab-96e734990371.png" alt="drawing" width="150"/>
</div>

## Video
