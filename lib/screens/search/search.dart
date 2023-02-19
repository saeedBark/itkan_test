import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itkan_test/components/componts.dart';
import 'package:itkan_test/screens/search/cubit.dart';
import 'package:itkan_test/screens/search/state.dart';

class SearchScreenBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var fromKey = GlobalKey<FormState>();
    var searchContrller = TextEditingController();
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: fromKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultFormFile(
                      controller: searchContrller,
                      type: TextInputType.text,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Enter text to search';
                        }
                        return null;
                      },
                      onsubmit: (String text) {
                        SearchCubit.get(context).search;
                      },
                      lable: 'Search',
                      prefix: Icons.search,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    if (state is SearchBookLoadingSearchState) LinearProgressIndicator(),
                    SizedBox(
                      height: 12,
                    ),
                    if (state is SearchBookGetSearchsuccessStste)
                     Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) => builderListBooks(),
                            separatorBuilder: (context, index) => MyDiver(),
                            itemCount: 10),
                      ),
                 ],
               ),
              ),
            ),
          );
        },
      ),
    );
  }
}
