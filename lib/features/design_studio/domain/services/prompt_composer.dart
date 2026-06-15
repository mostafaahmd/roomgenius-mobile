import '../entities/prompt_content.dart';
import '../entities/prompt_request.dart';

abstract class PromptComposer {
  PromptContent compose(PromptRequest request);
}