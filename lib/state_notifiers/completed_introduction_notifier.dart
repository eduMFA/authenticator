import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../interfaces/repo/introduction_repository.dart';
import '../model/enums/introduction_enum.dart';
import '../model/states/introduction_state.dart';
import '../utils/logger.dart';

class InrtroductionNotifier extends StateNotifier<IntroductionState> {
  Future<IntroductionState>? loadingRepo;

  final IntroductionRepository _repo;
  InrtroductionNotifier({required IntroductionRepository repository})
      : _repo = repository,
        super(const IntroductionState()) {
    _loadFromRepo();
  }

  Future<void> _loadFromRepo() async {
    loadingRepo = Future<IntroductionState>(() async {
      final newState = await _repo.loadCompletedIntroductions();
      state = newState;
      Logger.info('Loading completed introductions from repo: $state', name: 'settings_notifier.dart#_loadFromRepo');
      return newState;
    });
    await loadingRepo;
  }

  Future<void> _saveToRepo() async {
    loadingRepo = Future<IntroductionState>(() async {
      final success = await _repo.saveCompletedIntroductions(state);
      if (success) {
        Logger.info('Saving completed introductions to repo: $state', name: 'settings_notifier.dart#_saveToRepo');
      } else {
        Logger.warning('Failed to save completed introductions to repo: $state', name: 'settings_notifier.dart#_saveToRepo');
      }
      return state;
    });
    await loadingRepo;
  }

  Future<void> complete(Introduction introduction) async {
    state = state.withCompletedIntroduction(introduction);
    await _saveToRepo();
  }

  Future<void> uncomplete(Introduction introduction) async {
    state = state.withoutCompletedIntroduction(introduction);
    await _saveToRepo();
  }

  bool isCompleted(Introduction introduction) => state.isCompleted(introduction);
  bool isUncompleted(Introduction introduction) => state.isUncompleted(introduction);
}
