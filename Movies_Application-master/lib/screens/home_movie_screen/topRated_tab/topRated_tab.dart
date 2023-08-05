import 'package:flutter/material.dart';
import 'package:movie_application/apiManager/api_manager.dart';
import 'package:movie_application/models/TopRatedResponse.dart';
import 'package:movie_application/screens/home_movie_screen/topRated_tab/topRated_tab_widget.dart';
import 'package:movie_application/themes/themes.dart';

class TopRatedTab extends StatelessWidget {
  const TopRatedTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TopRatedResponse>(
        future: ApiManager.topRated(),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return Center(child: Text(snapshot.data?.statusMessage??''));
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(color: Colors.yellow,),);
          }
          var topRated = snapshot.data;
          return  ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => TopRatedWidget(topRated!.results![index]),
              itemCount: topRated?.results?.length
          );
        },

    );
  }
}
