import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:idnstd/src/e_service/customer_manage/domain/usecases/upload_file.dart';
import 'package:idnstd/src/e_service/repair_manage/data/model/es_ro_attach_file_model.dart';
import 'package:idnstd/src/e_service/repair_manage/data/model/rq_es_ro_edit_model.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/entities/es_ro_attach_file.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/entities/es_ro_component.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/entities/es_ro_detail.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/entities/es_ro_edit.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/usecases/finish.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/usecases/get_by_ro_no.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/usecases/search_error_component.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/usecases/search_error_type.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/usecases/search_product.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/usecases/update.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'repair_edit_state.dart';

class RepairEditCubit extends Cubit<RepairEditState> {
  RepairEditCubit({
    required GetByRONoUseCase getByRONoUseCase,
    required UpdateROUseCase updateROUseCase,
    required SearchErrorTypeUseCase searchErrorTypeUseCase,
    required SearchProductUseCase searchProductUseCase,
    required SearchErrorComponentUseCase searchErrorComponentUseCase,
    required UploadFileUseCase uploadFileUseCase,
    required FinishROUseCase finishROUseCase,
  }) : _getByRONoUseCase = getByRONoUseCase,
        _updateROUseCase = updateROUseCase,
        _searchErrorTypeUseCase = searchErrorTypeUseCase,
        _searchProductUseCase = searchProductUseCase,
        _searchErrorComponentUseCase = searchErrorComponentUseCase,
        _uploadFileUseCase = uploadFileUseCase,
        _finishROUseCase = finishROUseCase,
        super(RepairEditInitial());

  final GetByRONoUseCase _getByRONoUseCase;
  final UpdateROUseCase _updateROUseCase;
  final SearchErrorTypeUseCase _searchErrorTypeUseCase;
  final SearchProductUseCase _searchProductUseCase;
  final SearchErrorComponentUseCase _searchErrorComponentUseCase;
  final UploadFileUseCase _uploadFileUseCase;
  final FinishROUseCase _finishROUseCase;

  Future<void> init(String RONo) async {
    emit(RepairEditLoading());
    try {
      final rt_es_RODetail = await _getByRONoUseCase.call(GetByRONoParams(RONo: RONo));
      final rt_es_RODetailFold = rt_es_RODetail.fold((l) => null, (r) => r)!;

      // DS loi
      final rt_es_ROErrorType = await _searchErrorTypeUseCase.call(const SearchErrorTypeParams(),);
      final rt_es_ROErrorTypeFold = rt_es_ROErrorType.fold((l) => null, (r) => r)!;
      final listErrorType = rt_es_ROErrorTypeFold.map((e) => e.ErrorTypeCode).toSet().toList();

      List<String> listProduct;
      List<String> listErrorComponent;

      if(rt_es_RODetailFold.Lst_ES_RODetail.first.SerialNo.isNotEmpty) {
        // DS san pham
        final rt_es_ROProduct = await _searchProductUseCase.call(
          SearchProductParams(
            ProductCodeUser: rt_es_RODetailFold.Lst_ES_RODetail.first.ProductCode,
            Ft_PageIndex: '0',
            Ft_PageSize: '1000',
          )
        );
        final rt_es_ROProductFold = rt_es_ROProduct.fold((l) => null, (r) => r)!;
        listProduct = rt_es_ROProductFold.map((e) => e.ProductCode).toSet().toList();

        // DS linh kien
        var ProductGrpCode = '';
        for(var product in rt_es_ROProductFold){
          if(product.ProductCode == rt_es_RODetailFold.Lst_ES_RODetail.first.ProductCode){
            ProductGrpCode = product.ProductGrpCode;
            break;
          }
        }
        final rt_es_ROErrorComponent = await _searchErrorComponentUseCase.call(
          SearchErrorComponentParams(
            ProductGrpCode: ProductGrpCode,
            OrgID: rt_es_RODetailFold.Lst_ES_RODetail.first.OrgID,
          )
        );
        final rt_es_ROErrorComponentFold = rt_es_ROErrorComponent.fold((l) => null, (r) => r)!;
        listErrorComponent = rt_es_ROErrorComponentFold.Lst_Mst_ErrorComponent.map((e) => '${e.ProductGrpCode}-${e.ComponentCode}').toSet().toList();
      }
      else {
        listProduct = [];
        listErrorComponent = [];
      }

      emit(
        RepairEditLoaded(
          eS_RODetail: rt_es_RODetailFold.Lst_ES_RODetail[0],
          Lst_ES_ROComponent: rt_es_RODetailFold.Lst_ES_ROComponent,
          Lst_ES_ROAttachFile: rt_es_RODetailFold.Lst_ES_ROAttachFile,
          listErrorType: listErrorType,
          listProduct: listProduct,
          listErrorComponent: listErrorComponent,
        ),
      );
    } catch (e) {
      emit(RepairEditError(message: e.toString()));
    }
  }

  Future<void> update(
    ES_ROEdit es_ROEdit,
    List<ES_ROComponent> lst_ES_ROComponent,
    List<ES_ROAttachFile> lst_ES_ROAttachFile,
    List<String> list_ES_ROAttachFileType,
    List<File?> listFile,
  ) async {
    final currentState = state as RepairEditLoaded;
    emit(RepairEditLoading());
    // upload
    if(listFile.isNotEmpty) {
      for(var i = 0; i < listFile.length; i++){
        if(listFile[i] != null) {
          final image = await _uploadFileUseCase.call(UploadFileParams(file: listFile[i]!));
          final imageFold = image.fold((l) => null, (r) => r)!;
          lst_ES_ROAttachFile.add(
              ES_ROAttachFileModel(
                Idx: lst_ES_ROAttachFile.length + 1,
                FileName: imageFold.FileFullName,
                FileSize: imageFold.FileSize.toString(),
                FilePath: imageFold.FileUrlFS,
                FileType: imageFold.FileType,
                ROAttachFileType: list_ES_ROAttachFileType[i],
              )
          );
        }
      }
    }

    //update
    for(ES_ROAttachFile list in lst_ES_ROAttachFile){
      list.Idx = lst_ES_ROAttachFile.indexOf(list) + 1;
    }
    try {
      final objRQ_ES_ROEditModel = RQ_ES_ROEditModel(
          es_ROEdit: es_ROEdit,
          Lst_ES_ROComponent: lst_ES_ROComponent,
          Lst_ES_ROAttachFile: lst_ES_ROAttachFile,
      );
      final params = jsonEncode(objRQ_ES_ROEditModel.toJson());
      final appointmentTime = DateTime.parse(es_ROEdit.ReceptionDTimeUTC);
      final now = DateTime.now();
      final day5Now = DateTime(now.year, now.month, 5);
      if(appointmentTime.isBefore(day5Now)){
        emit(RepairEditError(message: 'Qua thời gian sửa chữa'));
        emit(currentState);
      }
      else {
        await _updateROUseCase.call(UpdateROParams(strJson: params));
        emit(RepairEditSuccess());
      }
    } catch (e) {
      emit(RepairEditError(message: e.toString()));
      emit(currentState);
    }
  }

  Future<void> finish(String RONo, String FinishDTimeUser, String AgentCode) async {
    final currentState = state as RepairEditLoaded;
    emit(RepairEditLoading());
    try {
      final prefs = await SharedPreferences.getInstance();
      final email = prefs.getString('cached_email') ?? '';
      if(email.toUpperCase() == AgentCode.toUpperCase()) {
        await _finishROUseCase.call(FinishROParams(RONo: RONo, FinishDTimeUser: FinishDTimeUser));
        emit(RepairFinishSuccess());
      }
      else {
        emit(RepairEditError(message: 'Bạn không phải nhân viên sửa chữa của đơn hàng này'));
        emit(currentState);
      }
    } catch (e) {
      emit(RepairEditError(message: e.toString()));
      emit(currentState);
    }
  }

  // Future<void> scan(String serialNo) async {
  //   emit(RepairEditLoading());
  //   try{
  //     // DS loi
  //     final rt_es_ROErrorType = await _searchErrorTypeUseCase.call(const SearchErrorTypeParams(),);
  //     final rt_es_ROErrorTypeFold = rt_es_ROErrorType.fold((l) => null, (r) => r)!;
  //     final listErrorType = rt_es_ROErrorTypeFold.map((e) => e.ErrorTypeCode).toSet().toList();
  //
  //     List<String> listProduct;
  //     List<String> listErrorComponent;
  //
  //     if(serialNo.isNotEmpty) {
  //       // DS san pham
  //       final rt_es_ROProduct = await _searchProductUseCase.call(
  //           SearchProductParams(
  //             ProductCodeUser: rt_es_RODetailFold.Lst_ES_RODetail.first.ProductCode,
  //             Ft_PageIndex: '0',
  //             Ft_PageSize: '1000',
  //           )
  //       );
  //       final rt_es_ROProductFold = rt_es_ROProduct.fold((l) => null, (r) => r)!;
  //       listProduct = rt_es_ROProductFold.map((e) => e.ProductCode).toSet().toList();
  //
  //       // DS linh kien
  //       var ProductGrpCode = '';
  //       for(var product in rt_es_ROProductFold){
  //         if(product.ProductCode == rt_es_RODetailFold.Lst_ES_RODetail.first.ProductCode){
  //           ProductGrpCode = product.ProductGrpCode;
  //           break;
  //         }
  //       }
  //       final rt_es_ROErrorComponent = await _searchErrorComponentUseCase.call(
  //           SearchErrorComponentParams(
  //             ProductGrpCode: ProductGrpCode,
  //             OrgID: rt_es_RODetailFold.Lst_ES_RODetail.first.OrgID,
  //           )
  //       );
  //       final rt_es_ROErrorComponentFold = rt_es_ROErrorComponent.fold((l) => null, (r) => r)!;
  //       listErrorComponent = rt_es_ROErrorComponentFold.Lst_Mst_ErrorComponent.map((e) => '${e.ProductGrpCode}-${e.ComponentCode}').toSet().toList();
  //     }
  //     else {
  //       listProduct = [];
  //       listErrorComponent = [];
  //     }
  //
  //     emit(
  //       RepairEditLoaded(
  //         eS_RODetail: rt_es_RODetailFold.Lst_ES_RODetail[0],
  //         Lst_ES_ROComponent: rt_es_RODetailFold.Lst_ES_ROComponent,
  //         Lst_ES_ROAttachFile: rt_es_RODetailFold.Lst_ES_ROAttachFile,
  //         listErrorType: listErrorType,
  //         listProduct: listProduct,
  //         listErrorComponent: listErrorComponent,
  //       ),
  //     );
  //   }
  //   catch(e) {
  //
  //   }
  // }
}
