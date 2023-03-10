part of '../view/product_selection_view.dart';

class _StepperTruckInformation extends StatelessWidget {
  ProductSelectionViewModel model;
  _StepperTruckInformation({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Column(
        children: [
          DropdownInput(
            title: 'Araç Tipi',
            dropdownValues: const ['Kamyon', 'Tır', 'Kamyonet'],
            dropDownValue: model.selectedVehicleType,
            onChanged: (p0) {
              model.selectedVehicleType = p0 ?? 'Kamyon';
            },
          ),
          const SizedBox(height: 20),
          BaseInput(
            title: 'Araç Plakası',
            textCapitalization: TextCapitalization.characters,
            inputType: TextInputType.name,
            controller: model.vehiclePlateController,
          ),
          const SizedBox(height: 20),
          BaseInput(
            title: 'Şoför İsim',
            textCapitalization: TextCapitalization.characters,
            inputType: TextInputType.name,
            controller: model.driverNameController,
          ),
          const SizedBox(height: 20),
          BaseInput(
            title: 'Telefon Numarası',
            inputType: TextInputType.phone,
            controller: model.phoneNoController,
            inputFormatter: [
              MaskTextInputFormatter(
                initialText: "(XXX) XXX-XX-XX",
                mask: '(###) ###-##-##',
                filter: {"#": RegExp(r'^[0-9]*$')},
              ),
            ],
          ),
          const SizedBox(height: 20),
          DropdownInput(
            title: 'Gidecek Yer',
            dropdownValues:
                EarthquakeCitiesAndDistricts.values.map((e) => e.name).toList(),
            dropDownValue: model.toTheProvience,
            onChanged: (p0) {
              model.toTheProvience = p0 ?? 'Kamyon';
            },
          ),
        ],
      ),
    );
  }
}
