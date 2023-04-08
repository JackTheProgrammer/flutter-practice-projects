import 'package:flutter_clean_architecture_plus_tdd/features/number_trivia/domain/repositories/number_trivial_repository.dart';
import 'package:flutter_clean_architecture_plus_tdd/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock implements NumberTrivialRepository{
  
}

void main(){
  late GetConcreteNumberTrivia useCase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;
  setUp((){
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    useCase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });
  useCase.repository.geConcretetNumberTrivia(12);
}