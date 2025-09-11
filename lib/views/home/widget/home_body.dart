part of '../home_imports.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.vm, required this.user});

  final UserProfileModel user;
  final HomeViewModel vm;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      vm.firebaseAnalyticsServices.logScreen('home_screen');
    });
    return AnimatedBuilder(
      animation: vm,
      builder: (context, _) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              user.isGoogle
                  ? ListTile(
                    leading:
                        user.image != null
                            ? CircleAvatar(
                              backgroundImage: NetworkImage(user.image!),
                            )
                            : const CircularProgressIndicator(),
                    title: CustomText(text: user.name ?? MyStrings.noName),
                    subtitle: CustomText(
                      text: user.email,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                  : CustomText(
                    text: '${MyStrings.welcome} ${user.email}',
                    fontSize: 16,
                  ),
              20.verticalSpace,
              DropdownButton<String>(
                value: vm._selectedTopic,
                hint: const CustomText(text: MyStrings.selectTopic),
                dropdownColor: MyColors.black,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    vm._changeTopic(newValue);
                  }
                },
                items:
                    MyStrings.topics.map<DropdownMenuItem<String>>((
                      String topic,
                    ) {
                      return DropdownMenuItem<String>(
                        value: topic,
                        child: Center(child: CustomText(text: topic)),
                      );
                    }).toList(),
              ),
              16.verticalSpace,
              ElevatedButton(
                onPressed: () {
                  vm._sendLocalNotification();
                  vm.pressTime();
                },
                child: const CustomText(text: MyStrings.localNotification),
              ),
            ],
          ),
        );
      },
    );
  }
}
