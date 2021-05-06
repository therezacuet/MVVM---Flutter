import 'package:flutter/material.dart';
import 'package:mvvm_flutter_app/business_logic/view_models/choose_favorites_viewmodel.dart';
import 'package:mvvm_flutter_app/services/service_locator.dart';
import 'package:provider/provider.dart';

class ChooseFavoriteCurrencyScreen extends StatefulWidget {
  @override
  _ChooseFavoriteCurrencyScreenState createState() =>
      _ChooseFavoriteCurrencyScreenState();
}

class _ChooseFavoriteCurrencyScreenState
    extends State<ChooseFavoriteCurrencyScreen> {
  ChooseFavoritesViewModel model = serviceLocator<ChooseFavoritesViewModel>();

  @override
  void initState() {
    model.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Currencies'),
      ),
      body: buildListView(model),
    );
  }

  Widget buildListView(ChooseFavoritesViewModel viewModel) {
    return ChangeNotifierProvider<ChooseFavoritesViewModel>(
      create: (context) => viewModel,
      child: Consumer<ChooseFavoritesViewModel>(
        builder: (context, model, child) => ListView.builder(
          itemCount: model.choices.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: SizedBox(
                  width: 60,
                  child: Text(
                    '${model.choices[index].flag}',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                title: Text('${model.choices[index].alphabeticCode}'),
                subtitle: Text('${model.choices[index].longName}'),
                trailing: (model.choices[index].isFavorite)
                    ? Icon(Icons.favorite, color: Colors.red)
                    : Icon(Icons.favorite_border),
                onTap: () {
                  model.toggleFavoriteStatus(index);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
