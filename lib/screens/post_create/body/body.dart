import 'package:apart_rent/constants.dart';
import 'package:apart_rent/repository/api/api.dart';
import 'package:apart_rent/screens/post_create/body/basic_information.dart';
import 'package:apart_rent/screens/post_create/body/describe_information.dart';
import 'package:apart_rent/screens/post_create/body/owner_information.dart';
import 'package:apart_rent/screens/post_manager/post_manager_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _Body createState() => _Body();
}

DateTime now = DateTime.now();
String formattedDate = DateFormat("yyyy-MM-ddTHH:mm:ss.mmm").format(now);

class _Body extends State<Body> {
  int _activeStepIndex = 0;
  bool isActive = false;

  FlutterLocalNotificationsPlugin? localNotification;

  @override
  void initState(){
    super.initState();
    var androidInitialize = const AndroidInitializationSettings('ic_launcher');
    var iosInitialize = const IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
      android: androidInitialize,
      iOS: iosInitialize
    );
    localNotification = FlutterLocalNotificationsPlugin();
    localNotification!.initialize(initializationSettings);
  }

  Future _showNotification() async {
    var androidDetails = const AndroidNotificationDetails(
      "channelId", 
      "Local Notification",
      importance: Importance.high);
    var iosDetails = const IOSNotificationDetails();
    var generalNotificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );
    await localNotification!.show(0, "Đăng bài thành công!", "Chúc mừng! bạn viết của bạn đã được đăng thành công.", generalNotificationDetails);
  }

  dynamic data;
  String? houseDirection;
  String? balconyDirection;
  String? postType;
  String? building;
  String? apartImageUrl;
  final title = TextEditingController();
  final description = TextEditingController();
  final price = TextEditingController();
  final area = TextEditingController();
  final numberOfBedroom = TextEditingController();
  final numberOfBathroom = TextEditingController();
  final legalInformation = TextEditingController();
  final name = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();

  bool isReady = false;

  _post() {
    data = {
      'title': title.text,
      'price': double.parse(price.text),
      'description': description.text,
      'dateCreate': formattedDate,
      'postStatusId': 1,
      'postTypeId': int.parse(postType!),
      'area': double.parse(area.text),
      'numberOfBedroom': int.parse(numberOfBedroom.text),
      'numberOfBathroom': int.parse(numberOfBathroom.text),
      'houseDirection': houseDirection,
      'balconyDirection': balconyDirection,
      'legalInformation': legalInformation.text,
      'apartmentImgUrl': apartImageUrl,
      'buildingId': int.parse(building!),
      'name': name.text,
      'phone': phone.text,
      'email': email.text
    };

    addData1(data);
    addData2(data);
  }

  _next(){
    addData3(data);
  }

  List<Step> stepList() => [
        Step(
            state:
                _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 0,
            title: const Text('Post'),
            content: BasicInformation(
              title: title,
              price: price,
              description: description,
              type: (String? value) {
                postType = value;
              },
              building: (String? value) {
                building = value;
              },
            )),
        Step(
          state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 1,
          title: const Text('Apartment'),
          content: DescribeInformation(
            area: area,
            numberOfBedroom: numberOfBedroom,
            numberOfBathroom: numberOfBathroom,
            legalInformation: legalInformation,
            houseDirection: (String? value) {
              houseDirection = value;
            },
            balconyDirection: (String? value) {
              balconyDirection = value;
            },
            apartImageUrl: (String? value){
              apartImageUrl = value;
            },
          ),
        ),
        Step(
          state: StepState.complete,
          isActive: _activeStepIndex >= 2,
          title: const Text('Owner'),
          content: OwnerInformation(
            name: name,
            phone: phone,
            email: email,
          ),
        )
      ];

  @override
  Widget build(BuildContext context) {
    return Stepper(
      type: StepperType.horizontal,
      currentStep: _activeStepIndex,
      steps: stepList(),
      onStepContinue: () {
        if (_activeStepIndex < (stepList().length - 1)) {
          setState(() {
            _activeStepIndex += 1;
          });
        } else {
          _post();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Bài viết đã được đăng thành công!')));
          _showNotification();
          setState(() {
            isActive = true;
          });
        }
      },
      onStepCancel: () {
        if (_activeStepIndex == 0) {
          return;
        }
        setState(() {
          _activeStepIndex -= 1;
        });
      },
      onStepTapped: (int index) {
        setState(() {
          _activeStepIndex = index;
        });
      },
      controlsBuilder: (context, details) {
        final isLastStep = _activeStepIndex == stepList().length - 1;
        return Container(
          alignment: Alignment.center,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: kPrimaryColor,
                  ),
                  onPressed: details.onStepContinue,
                  child:
                      (isLastStep) ? const Text('Submit') : const Text('Next'),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              if (_activeStepIndex > 0)
                Expanded(
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      primary: Colors.white,
                    ),
                    onPressed: details.onStepCancel,
                    child: const Text('Back'),
                  ),
                ),
              if (_activeStepIndex == 2)
                Expanded(
                  child: IconButton(
                            onPressed: isActive == true ? () {
                              _next();
                              Navigator.popUntil(context, ModalRoute.withName(PostManagerScreen.routeName));
                              //ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Bài viết đã được đăng thành công!')));
                            } : null,
                            icon: Icon(
                              Icons.home,
                              size: 25,
                              color: isActive == true ? kPrimaryColor : Colors.grey,
                            ),
                          ),
                )
            ],
          ),
        );
      },
    );
  }
}
