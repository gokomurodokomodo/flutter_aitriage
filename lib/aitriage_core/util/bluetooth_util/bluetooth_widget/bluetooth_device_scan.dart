import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../ui/dialog/app_dialog.dart';
import '../device_model/device_model.dart';

class BluetoothDeviceScanDialog extends StatefulWidget {
  final Widget emptyListViewPlaceholder;
  final List<DeviceModel> listDevices;
  final String title;
  final double? dialogHeight;
  final double? dialogWidth;
  final String primaryButtonTitle;
  final String secondaryButtonTitle;
  final Function(String)? primaryAction;
  final Function()? secondaryAction;

  const BluetoothDeviceScanDialog({super.key,
    required this.listDevices,
    this.emptyListViewPlaceholder = const SizedBox(),
    this.title = '',
    this.primaryButtonTitle = '',
    this.secondaryButtonTitle = '',
    this.primaryAction,
    this.secondaryAction,
    this.dialogHeight,
    this.dialogWidth});

  @override
  State<StatefulWidget> createState() => _DialogState();

}
class _DialogState extends State<BluetoothDeviceScanDialog>{
  int currentIndex = -1;
  var _deviceMacAddress = '';

  @override
  Widget build(BuildContext context) {
    return AppDialog(
        primaryButtonCallback: currentIndex == -1 ? null : widget.primaryAction?.call(_deviceMacAddress),
        primaryButtonTitle: widget.primaryButtonTitle,
        secondaryButtonTitle: widget.secondaryButtonTitle,
        secondaryButtonCallback: widget.secondaryAction,
        dialogWidth: widget.dialogWidth,
        dialogHeight: widget.dialogHeight ?? 900.h,
        content: Column(
            children: [
              SizedBox(height: 24.h,),
              const Divider(),
              SizedBox(height: 24.h,),
              SizedBox(
                height: 500.h,
                child: widget.listDevices.isEmpty ? widget.emptyListViewPlaceholder : ListView.builder(
                  itemCount: widget.listDevices.length,
                  shrinkWrap: true,
                  itemBuilder: (_, index) =>
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                              currentIndex = index;
                              _deviceMacAddress = widget.listDevices[index].macAddress;
                          });
                        },
                        child: DeviceItem(
                          name: widget.listDevices[index].name,
                          macAddress: widget.listDevices[index].macAddress,
                          type: widget.listDevices[index].type,
                          isChosen: index > -1 && currentIndex == index
                        ),
                      ),
                ),
              ),
              SizedBox(height: 24.h,),
              const Divider(),
              SizedBox(height: 24.h,),
            ]
        ), title: widget.title);
  }
}
class DeviceItem extends StatelessWidget{
  final String name;
  final String macAddress;
  final String type;
  final bool isChosen;

  const DeviceItem(
      {super.key,
      required this.name,
      required this.macAddress,
      required this.type,
      this.isChosen = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isChosen ? Colors.grey : null,
      child: ListTile(
        title: Text(name),
        subtitle: Text(macAddress),
        trailing: Text(type.toString()),
      ),
    );
  }


}
