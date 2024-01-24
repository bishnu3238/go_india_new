import 'package:dartz/dartz.dart';
import 'package:go_india/data/model/others/instruction_video_json.dart';
import 'package:go_india/data/model/others/quiz_json.dart';
import 'package:go_india/domain/entity/entity.dart';
import 'package:go_india/domain/failure/failure.dart';
import 'package:go_india/domain/repository/master_repository.dart';
import 'package:go_india/package/package/package.dart';

import '../../utility/utility/utility.dart';

class GoIndiaMasterRepository implements MasterRepository {
  final NetworkService _networkService;
  GoIndiaMasterRepository(this._networkService);

  InstroVideo? _instructionVideo;
  static List<Quizzes>? _quiz;
  @override
  InstroVideo get instructionVideo => _instructionVideo ?? InstroVideo.empty;
  @override
  List<Quizzes> get quiz => _quiz ?? [];

  @override
  Future<Either<Failure, InstroVideo>> getInstructionVideo() async {
    return await _networkService.get(getInstructionVideoApi).then(
          (value) => value.fold(
            (l) => left(Failure(l.error)),
            (r) {
              List data = r['video'] as List;
              var video = InstroVideoJson.fromMap(data[0]).toDomain();
              _instructionVideo = video;
              return right(_instructionVideo!);
            },
          ),
        );
  }

  @override
  Future<Either<Failure, List<Quizzes>>> getQuiz() async {
    return await _networkService.get(getQuizApi).then(
          (value) => value.fold(
            (l) => left(Failure(l.error)),
            (r) {
              List data = r['quiz'] as List;
              List<Quizzes> quiz = data
                  .map<Quizzes>((e) => QuizJson.fromMap(e).toDomain())
                  .toList();
              _quiz = quiz;
              return right(_quiz!);
            },
          ),
        );
  }
}
