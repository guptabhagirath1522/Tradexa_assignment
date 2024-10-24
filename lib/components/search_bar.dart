import 'package:app_assignment/constants/colors.dart';
import 'package:app_assignment/providers/movie_search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: CustomColors.black),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
              ),
              onChanged: (query) {
                print(query);

                Provider.of<MovieSearchProvider>(context, listen: false)
                    .searchMovies(query);
              },
            ),
          ),
          InkWell(
            onTap: () {
              Provider.of<MovieSearchProvider>(context, listen: false)
                  .searchMovies('batman');
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.search,
                color: CustomColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
