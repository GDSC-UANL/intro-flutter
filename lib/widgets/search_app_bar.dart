import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget {
  final Function(String query) onSearch;

  const SearchAppBar({
    Key? key,
    required this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: onSearch,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Buscar Contactos",
                  contentPadding: EdgeInsets.only(left: 10),
                  isDense: true),
            ),
          ),
          CircleAvatar(
            radius: 12,
            backgroundImage: NetworkImage(
                "https://scontent.fntr8-1.fna.fbcdn.net/v/t1.6435-9/82404551_1261520480699449_2141136377826246656_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeHLRakmwy1odM6sbz4FawkxaFszM-h_feJoWzMz6H994sJ7a1ySMzNj9oq37ddP6N8Hl1g4OyLRilwmqSc6b76T&_nc_ohc=KTL_JLUjuz8AX-jGgOn&_nc_ht=scontent.fntr8-1.fna&oh=a9992e3903be42c36205355111c0f676&oe=61993C72"),
          )
        ],
      ),
    );
  }
}
