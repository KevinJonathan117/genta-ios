import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:genta_ios/EGENTA/egenta.dart';
import 'package:genta_ios/styles.dart';
import 'package:genta_ios/API/api.dart';
import 'package:genta_ios/EGENTA/widgets/cards.dart';

class EGENTAScreen extends StatefulWidget {
  EGENTAScreenState createState() => EGENTAScreenState();
}

class EGENTAScreenState extends State<EGENTAScreen> {
  List<Widget> _generateEGENTARows(List<EGENTA> eGENTAs) {
    final cards = List<Widget>();

    for (EGENTA egenta in eGENTAs) {
      cards.add(Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 24.0),
        child: FutureBuilder(builder: (context, snapshot) {
          return EGENTACard(egenta);
        }),
      ));
    }

    return cards;
  }

  List<EGENTA> eGentaList = <EGENTA>[];

  List<EGENTA> get allEGENTA => List<EGENTA>.from(eGentaList);

  EGENTA getEGENTA(int id) =>
      eGentaList.singleWhere((counter) => counter.id == id);

  List<EGENTA> get availableEGENTA {
    return eGentaList.toList();
  }

  Future<void> _fetchMagazine(int magazineIndex) async {
    final api = Api();
    final EGENTAJSON = await api.getEgentaList(magazineIndex);
    List<EGENTA> egentaList = eGentaList;
    for (var egenta in EGENTAJSON) {
      egentaList.add(EGENTA.fromJson(egenta));
    }
    setState(() => eGentaList = egentaList);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (context) {
        final rows = <Widget>[];

        rows.add(
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('e-genta'.toUpperCase(), style: Styles.headlineText),
              ],
            ),
          ),
        );

        for (int i = 0; i < 50; i = i + 10) {
          _fetchMagazine(i);
        }

        rows.addAll(_generateEGENTARows(availableEGENTA));

        return DecoratedBox(
            decoration: BoxDecoration(color: Color(0xffffffff)),
            child: ListView(children: rows));
      },
    );
  }
}
