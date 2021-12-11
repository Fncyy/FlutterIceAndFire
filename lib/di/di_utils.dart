import 'package:app_of_ice_and_fire/data/disk/book/book_dao.dart';
import 'package:app_of_ice_and_fire/data/disk/character/character_dao.dart';
import 'package:app_of_ice_and_fire/data/disk/floor_database.dart';
import 'package:app_of_ice_and_fire/data/disk/iceandfire_disk_data_source.dart';
import 'package:app_of_ice_and_fire/data/network/dio_iceandfire_service.dart';
import 'package:app_of_ice_and_fire/data/network/iceandfire_api.dart';
import 'package:app_of_ice_and_fire/data/network/iceandfire_network_data_source.dart';
import 'package:app_of_ice_and_fire/domain/iceandfire_interactor.dart';
import 'package:app_of_ice_and_fire/ui/books/detail/book_detail_bloc.dart';
import 'package:app_of_ice_and_fire/ui/books/list/book_list_bloc.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

void initDependencies() {
  injector.registerSingleton<IceAndFireApi>(IceAndFireService());

  injector.registerSingleton(
    IceAndFireNetworkDataSource(injector<IceAndFireApi>()),
  );

  injector.registerSingletonAsync<FloorIceAndFireDatabase>(() async {
    return await $FloorFloorIceAndFireDatabase
        .databaseBuilder("iceandfire_database.db")
        .build();
  });

  injector.registerSingletonAsync<BookDao>(
    () async {
      final floorDatabase = injector<FloorIceAndFireDatabase>();
      return floorDatabase.bookDao;
    },
    dependsOn: [FloorIceAndFireDatabase],
  );

  injector.registerSingletonAsync<CharacterDao>(
    () async {
      final floorDatabase = injector<FloorIceAndFireDatabase>();
      return floorDatabase.characterDao;
    },
    dependsOn: [FloorIceAndFireDatabase],
  );

  injector.registerSingletonAsync(
    () async {
      return IceAndFireDiskDataSource(
        injector<BookDao>(),
        injector<CharacterDao>(),
      );
    },
    dependsOn: [BookDao],
  );

  injector.registerSingletonAsync(
    () async {
      return IceAndFireInteractor(
        injector<IceAndFireDiskDataSource>(),
        injector<IceAndFireNetworkDataSource>(),
      );
    },
    dependsOn: [IceAndFireDiskDataSource],
  );

  injector.registerFactory(
    () => BookListBloc(
      injector<IceAndFireInteractor>(),
    ),
  );
  injector.registerFactory(
    () => BookDetailBloc(
      injector<IceAndFireInteractor>(),
    ),
  );
}
