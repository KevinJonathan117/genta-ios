import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:genta_ios/EGENTA/egentadetail.dart';
import 'package:genta_ios/API/api.dart';
import 'package:genta_ios/EGENTA/widgets/egentapages.dart';

class EGENTADetailsScreen extends StatefulWidget {
  final int edisi;

  EGENTADetailsScreen(this.edisi);

  @override
  _EGENTADetailScreenState createState() => _EGENTADetailScreenState();
}

class _EGENTADetailScreenState extends State<EGENTADetailsScreen> {
  List<EGENTADetail> _magazineList = <EGENTADetail>[];

  List<EGENTADetail> getEgentaList() => _magazineList.toList();

  Future<void> _fetchMagazineDetail(int magazineIndex) async {
    final api = Api();
    final egentaJSON = await api.getEgentaDetailList(magazineIndex);
    final List<EGENTADetail> magazineList = _magazineList;
    for (var article in egentaJSON) {
      magazineList.add(EGENTADetail.fromJson(article));
    }
    setState(() => _magazineList = magazineList);
  }

  Widget _buildResult(List<EGENTADetail> egentadetaillist) {
    return PreloadPageView.builder(
      itemCount: 64,
      preloadPagesCount: 5,
      itemBuilder: (context, i) {
        if (i >= egentadetaillist.length) {
          _fetchMagazineDetail(widget.edisi);
        } else {
          return EGentaPages(egentadetaillist[i]);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("genta ".toUpperCase() + "${widget.edisi}"),
      ),
      child: _buildResult(getEgentaList()),
    );
  }
}
