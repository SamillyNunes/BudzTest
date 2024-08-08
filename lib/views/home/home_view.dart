import 'package:budz_app/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeViewModel>(
      context,
      listen: false,
    ).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, _) {
          if (viewModel.isLoading || viewModel.pet == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final pet = viewModel.pet!;

          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: size.width * 0.2,
                      height: size.width * 0.2,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(pet.photoUrl),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
