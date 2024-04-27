import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/my_provider.dart';
import '../../widget/text_form_field_widget.dart';
class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  String? groupValue;
  TextEditingController? nameController=TextEditingController();
  TextEditingController? ageController=TextEditingController();
  GlobalKey<FormState> keyForm=GlobalKey();

  @override
  Widget build(BuildContext context) {
    MyProvider provider=Provider.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Form(
        key: keyForm,
        child: Column(
          children: [
            const SizedBox(height: 30),
            Text(
              "Welcome to Health App,Please Enter these details",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600]),
            ),
            const SizedBox(height: 60),
            TextFormFieldWidget( title: "Name",controller:nameController  ,validator:validator),
            const SizedBox(height: 40),
            TextFormFieldWidget(title: "Age",keyboardType: TextInputType.number,controller: ageController,validator:validator),
            const SizedBox(height: 60),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: const Text("Male"),
                      value: "male",
                      groupValue: groupValue,
                      onChanged: (v) {
                        setState(() {
                          groupValue = v;
                        });
                      }),
                ),
                Expanded(
                  child: RadioListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: const Text("Female"),
                      value: "female",
                      groupValue: groupValue,
                      onChanged: (v) {
                        setState(() {
                          groupValue = v;
                        });
                      }),
                ),
                ElevatedButton(
                    style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    onPressed: () {
                   bool result=  keyForm.currentState!.validate();
                   if(result){
                     provider.setDataHomeTab(newName: nameController?.text,newAge: ageController?.text,newGender:groupValue );
                     provider.changeCurrentIndex(1);
                   }
                    },
                    child: const Text(
                      "SUBMIT",
                      style: TextStyle(color: Colors.white,fontSize: 16),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
  String ?validator(String ?value){
    if(value!.isEmpty){
      return "Enter Value";
    }
    return null;
  }
}