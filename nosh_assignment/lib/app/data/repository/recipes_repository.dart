
import 'package:nosh_assignment/app/data/model/dto/response.dart';
import 'package:nosh_assignment/app/data/model/response/DishModel.dart';
import 'package:nosh_assignment/app/data/value/urls.dart';
import 'package:nosh_assignment/base/base_repository.dart';
import 'package:nosh_assignment/utils/helper/exception_handler.dart';

class RecipesRepository extends BaseRepository {


  Future<RepoResponse<List<DishModel>>> getDishList() async {
    final response =
    await controller.get(path: URLs.getDishList);

    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: DishModel.fromList(response));
  }




}
