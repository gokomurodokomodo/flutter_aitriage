import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/entity/city.dart';
import 'package:flutter_aitriage/aitriage_core/service/local_storage_service/database/provider/isar_provider.dart';
import 'package:flutter_aitriage/aitriage_core/service/local_storage_service/database/repository/city_table_repository.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/color_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IsarProvider.init();
  runApp(const AppTest());
}

class AppTest extends StatelessWidget {
  const AppTest({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, __) => MaterialApp(
        home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ColorButton(
                  title: 'Test package',
                  shouldEnable: true,
                  onTap: () async {
                    final city1 = City(
                        0,
                        0,
                        'name',
                        1,
                        'stateCode',
                        'stateName',
                        1,
                        'countryCode',
                        'countryName'
                    );
                    final city2 = City(
                        0,
                        2,
                        'name',
                        2,
                        'stateCode',
                        'stateName',
                        2,
                        'countryCode',
                        'countryName'
                    );
                    final repo = CityTableRepository();

                    await repo.write(city1);
                    await repo.write(city2);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
