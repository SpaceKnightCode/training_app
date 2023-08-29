import 'package:flutter/material.dart';

class PeopleDetailsCard extends StatelessWidget {
  final String name;
  final String designation;
  final String imageURL;
  final String time;
  const PeopleDetailsCard(
      {super.key,
      required this.name,
      required this.designation,
      required this.imageURL,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: PhysicalModel(
        elevation: 10,
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        shadowColor: Colors.black,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width - 10,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      height: 100,
                      width: 100,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(imageURL, fit: BoxFit.cover)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name),
                        Text(designation),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                            backgroundColor: Colors.black),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(Icons.timer_outlined),
                            Text(time),
                          ],
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: FilledButton(
                        onPressed: () {},
                        child: Text("Book"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
