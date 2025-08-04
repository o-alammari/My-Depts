import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_2/constant.dart';
import 'package:testing_2/model/model_procedures.dart';
import 'package:testing_2/presentation/procedure/view-model/bloc_procedure/procedure_bloc.dart';
import 'package:testing_2/theme.dart';

class AllProceduresItems extends StatelessWidget {
  ModelProcedures modelProcedure;

  AllProceduresItems({required this.modelProcedure, super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          tileColor: Colors.white,
          // leading: Text(widget.modelProcedure.amountProcedures),
          title: Text(
            modelProcedure.nameProcedures,
            style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 27, 65, 146),
                fontWeight: FontWeight.w400),
          ),
          subtitle: Text(modelProcedure.dateProcedures),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${modelProcedure.credit != '0' ? modelProcedure.credit : modelProcedure.debit}.00',
                style: const TextStyle(
                  fontSize: 15,
                  // color: Color.fromARGB(255, 27, 65, 146),
                  color: Color.fromARGB(255, 40, 82, 174),
                ),
              ),
              const SizedBox(width: 5),
              Icon(
                modelProcedure.credit != '0'
                    ? Icons.arrow_downward_sharp
                    : Icons.arrow_upward_sharp,
                size: 25,
                opticalSize: 1,
                color: Themes.fontColor,
              ),
            ],
          ),
          onTap: () => showBottomSheet(context),
        ),
        const Divider(
          height: 0,
          thickness: 1.5,
          indent: 10,
          // indent: MediaQuery.of(context).size.width * .15,
          endIndent: 15,
        ),
      ],
    );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.grey[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      // isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.38,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: Colors.grey[300],
            // color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 5, right: 5, top: 10),
                child: ListTile(
                  leading: Text(
                    modelProcedure.nameProcedures,
                    style: titleBottomSheetStyle,
                  ),
                  trailing: CircleAvatar(
                    // foregroundColor: const Color.fromARGB(255, 215, 208, 208),
                    // maxRadius: 6,
                    backgroundColor: const Color.fromARGB(255, 215, 208, 208),
                    // backgroundColor: Colors.grey,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20, left: 20, top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  // color: Colors.grey[300],
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    ListTile(
                      // leading: Icon(Icons.photo),
                      title: const Text('Edit Procedure'),
                      trailing: const Icon(
                        Icons.edit_sharp,
                        color: Colors.black,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed(Name.iDEditProcedure,
                            arguments: modelProcedure);
                      },
                    ),
                    const Divider(),
                    ListTile(
                      // leading: Icon(Icons.photo),
                      title: const Text(
                        'Delete Procedure',
                        style: TextStyle(color: Colors.red),
                      ),
                      trailing: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        showBottomSheetDelete(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showBottomSheetDelete(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      // useSafeArea: true,
      backgroundColor: Colors.grey[300],
      // isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: Colors.grey[300],
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 5, right: 5, top: 10),
                child: ListTile(
                  title: Text('Delete Procedure Name...?',
                      style: titleBottomSheetStyle),
                  trailing: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 215, 208, 208),
                    // backgroundColor: Colors.grey,
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.close_rounded,
                          color: Colors.grey,
                        )),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20, left: 20, top: 10),
                // margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  // color: Colors.grey[300],
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    ListTile(
                      // leading: Icon(Icons.photo),
                      title: const Text(
                        'Delete Procedure',
                        style: TextStyle(color: Colors.red),
                      ),
                      trailing: const Icon(Icons.delete, color: Colors.red),
                      onTap: () => deleteProcedure(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void deleteProcedure(BuildContext context) {
    context
        .read<ProcedureBloc>()
        .add(DeleteProcedureEvent(idProcedure: modelProcedure.idProcedures!));
    Navigator.of(context).pop();
    context
        .read<ProcedureBloc>()
        .add(AllProceduresEvent(customerId: modelProcedure.idCustomer));
  }
}
