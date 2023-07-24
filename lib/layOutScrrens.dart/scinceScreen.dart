import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/layOutScrrens.dart/cubit.dart/appCubit.dart';
import 'package:flutter_application_2/layOutScrrens.dart/cubit.dart/state.dart';
import 'package:flutter_application_2/layOutScrrens.dart/web_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Science extends StatelessWidget {
  const Science({super.key});

  @override
  Widget build(BuildContext context) {
    var list = AppCubit.get(context).science;
    return BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return list.isNotEmpty
              ? ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: ((context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      WebViewScreen(list[index]['url'])));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        '${list[index]['urlToImage']}',
                                      ),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Container(
                                  height: 120,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '${list[index]['title']}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        '${list[index]['publishedAt']}',
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                  separatorBuilder: ((context, index) => Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.grey[300],
                        ),
                      )),
                  itemCount: 10)
              : Center(child: CircularProgressIndicator());
        });
  }
}
