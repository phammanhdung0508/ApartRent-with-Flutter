import 'package:apart_rent/components/custom_text_field.dart';
import 'package:apart_rent/size_config.dart';
import 'package:flutter/material.dart';

class OwnerInformation extends StatelessWidget {
  final TextEditingController name;
  final TextEditingController phone;
  final TextEditingController email;
  const OwnerInformation({Key? key, required this.name, required this.phone, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                elevation: 0,
                color: const Color.fromARGB(176, 243, 243, 243),
                child: CustomTextField(
                  controller: name,
                    hint: "Tên liên hệ",
                    label: "Nhập tên",
                    type: TextInputType.text),
              ),
              SizedBox(
                height: getProportionateScreenWidth(3),
              ),
              Card(
                elevation: 0,
                color: const Color.fromARGB(176, 243, 243, 243),
                child: CustomTextField(
                  controller: phone,
                    hint: "Di động",
                    label: "Nhập di động",
                    type: TextInputType.number),
              ),
              SizedBox(
                height: getProportionateScreenWidth(3),
              ),
              Card(
                elevation: 0,
                color: const Color.fromARGB(176, 243, 243, 243),
                child: CustomTextField(
                  controller: email,
                    hint: "Email",
                    label: "Nhập Email",
                    type: TextInputType.text),
              ),
              SizedBox(
                height: getProportionateScreenWidth(30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
