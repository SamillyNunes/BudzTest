import 'package:budz_app/views/components/tab_title.dart';
import 'package:flutter/material.dart';

class ExploreJourneyTab extends StatelessWidget {
  const ExploreJourneyTab({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return Column(
      children: [
        TabTitle(
          title: 'Explorar Jornadas',
          description: 'Descubra novas trilhas',
          onPressed: () {},
        ),
      ],
    );
  }
}
