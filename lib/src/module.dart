import 'package:w_module/w_module.dart';

import 'package:rollout_status/src/actions.dart';
import 'package:rollout_status/src/components/main_view.dart';
import 'package:rollout_status/src/models.dart';
import 'package:rollout_status/src/store.dart';

class RolloutModule extends Module {
  RolloutModuleComponents _components;

  RolloutModule(Iterable<DeployLocation> deployLocations) {
    final actions = new RolloutActions();
    final store = new RolloutStore(actions, deployLocations);
    _components = new RolloutModuleComponents(actions, store);
  }

  @override
  RolloutModuleComponents get components => _components;
}

class RolloutModuleComponents extends ModuleComponents {
  RolloutActions _actions;
  RolloutStore _store;

  RolloutModuleComponents(this._actions, this._store);

  @override
  content() => (MainView()
    ..actions = _actions
    ..store = _store)();
}
