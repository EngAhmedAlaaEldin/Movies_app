import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_application/models/PopularResponse.dart';
import 'package:movie_application/screens/movie_details_screen/movie_details_screen.dart';
import 'package:movie_application/themes/themes.dart';

class CategoryListWidget extends StatelessWidget {
  Results results;
  CategoryListWidget(this.results);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, MovieDetScreen.routeName,arguments: results);
      },
      child: Container(
        margin: EdgeInsets.all(18),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: MyThemeData.lightBlack,
          borderRadius: BorderRadius.circular(30)
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500' + '${results.posterPath}',
                width: 150,
                height: 150,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(results.title??'',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 5,),
                    Text(results.releaseDate??'',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text('${results.voteAverage}',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall?.copyWith(
                              color: Colors.white
                            )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
