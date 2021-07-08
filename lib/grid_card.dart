import 'package:flutter/material.dart';
import 'package:novels_app/colors_values.dart';

class GridCard extends StatelessWidget {
  final String? imgSrc, name, one_week_rent_price, mrp;
  const GridCard({
    Key? key,
    this.imgSrc,
    this.name,
    this.one_week_rent_price,
    this.mrp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String oldMoney = "\u{20B9}" + mrp!;
    String newMoney = "\u{20B9}" + one_week_rent_price!;
    return Container(
      child: Card(
        // elevation: 0.5,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            color: cardbg,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 4),
                Image.network(
                  imgSrc!,
                  fit: BoxFit.contain,
                  height: 170,
                  width: double.infinity,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          name!,
                          // textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: cardBlue,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              newMoney,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.red[900],
                                fontFamily: 'Product Sans',
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              oldMoney,
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.red[300],
                                  decorationThickness: 2,
                                  color: bc5,
                                  fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
