import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomgenius_mobile/app/di/service_locator.dart';
import 'package:roomgenius_mobile/features/create_room/presentation/cubit/create_room_cubit.dart';
import 'package:roomgenius_mobile/features/create_room/presentation/cubit/create_room_state.dart';
import 'package:roomgenius_mobile/features/create_room/presentation/pages/prompt_preview_screen.dart';
import 'package:roomgenius_mobile/features/create_room/presentation/pages/refine_details_screen.dart';
import 'package:roomgenius_mobile/features/create_room/presentation/pages/select_design_style_screen.dart';
import 'package:roomgenius_mobile/features/create_room/presentation/pages/select_mood_screen.dart';
import 'package:roomgenius_mobile/features/create_room/presentation/pages/select_room_type_screen.dart';
import 'package:roomgenius_mobile/features/create_room/presentation/pages/upload_room_photo_screen.dart';

class CreateRoomFlowScreen extends StatefulWidget {
  const CreateRoomFlowScreen({super.key});

  @override
  State<CreateRoomFlowScreen> createState() => _CreateRoomFlowScreenState();
}

class _CreateRoomFlowScreenState extends State<CreateRoomFlowScreen> {
  final PageController _pageController = PageController();

  int _currentStep = 0;

  static const int _totalSteps = 6;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goNext() {
    if (_currentStep >= _totalSteps - 1) {
      Navigator.of(context).pop();
      return;
    }

    setState(() => _currentStep++);

    _pageController.animateToPage(
      _currentStep,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  void _goBack() {
    if (_currentStep == 0) {
      Navigator.of(context).pop();
      return;
    }

    setState(() => _currentStep--);

    _pageController.animateToPage(
      _currentStep,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  bool _canContinue(CreateRoomState state) {
    final draft = state.draft;

    switch (_currentStep) {
      case 0:
        return draft.hasImage;
      case 1:
        return draft.roomType != null;
      case 2:
        return draft.designStyle != null;
      case 3:
        return draft.designMood != null;
      case 4:
        return draft.budgetLevel != null;
      case 5:
        return true;
      default:
        return false;
    }
  }

  String get _nextButtonText {
    if (_currentStep == _totalSteps - 1) {
      return 'Save Project';
    }

    if (_currentStep == _totalSteps - 2) {
      return 'Preview Prompt';
    }

    return 'Continue';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CreateRoomCubit>(),
      child: BlocBuilder<CreateRoomCubit, CreateRoomState>(
        builder: (context, state) {
          final canContinue = _canContinue(state);

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: _goBack,
                icon: const Icon(Icons.arrow_back),
              ),
              title: const Text('Create Room Project'),
            ),
            body: Column(
              children: [
                LinearProgressIndicator(
                  value: (_currentStep + 1) / _totalSteps,
                ),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      UploadRoomPhotoScreen(),
                      SelectRoomTypeScreen(),
                      SelectDesignStyleScreen(),
                      SelectDesignMoodScreen(),
                      RefineDetailsScreen(),
                      PromptPreviewScreen(),
                    ],
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: canContinue ? _goNext : null,
                        child: Text(_nextButtonText),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
