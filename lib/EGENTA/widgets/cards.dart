import 'package:flutter/cupertino.dart';
import 'package:genta_ios/EGENTA/egenta.dart';
import 'package:genta_ios/EGENTA/egentadetailscreen.dart';
import 'package:genta_ios/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PressableCard extends StatefulWidget {
  const PressableCard({
    @required this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(10.0)),
    this.upElevation = 2.0,
    this.downElevation = 0.0,
    this.shadowColor = CupertinoColors.black,
    this.duration = const Duration(milliseconds: 100),
    this.onPressed,
    Key key,
  })  : assert(child != null),
        assert(borderRadius != null),
        assert(upElevation != null),
        assert(downElevation != null),
        assert(shadowColor != null),
        assert(duration != null),
        super(key: key);

  final VoidCallback onPressed;

  final Widget child;

  final BorderRadius borderRadius;

  final double upElevation;

  final double downElevation;

  final Color shadowColor;

  final Duration duration;

  @override
  _PressableCardState createState() => _PressableCardState();
}

class _PressableCardState extends State<PressableCard> {
  bool cardIsDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => cardIsDown = false);
        if (widget.onPressed != null) {
          widget.onPressed();
        }
      },
      onTapDown: (details) => setState(() => cardIsDown = true),
      onTapCancel: () => setState(() => cardIsDown = false),
      child: AnimatedPhysicalModel(
        elevation: cardIsDown ? widget.downElevation : widget.upElevation,
        borderRadius: widget.borderRadius,
        shape: BoxShape.rectangle,
        shadowColor: widget.shadowColor,
        duration: widget.duration,
        color: CupertinoColors.lightBackgroundGray,
        child: ClipRRect(
          borderRadius: widget.borderRadius,
          child: widget.child,
        ),
      ),
    );
  }
}

class EGENTACard extends StatelessWidget {
  EGENTACard(this.egenta);

  final EGENTA egenta;

  Widget _buildDetails() {
    return DecoratedBox(
      decoration: BoxDecoration(color: Color.fromARGB(224, 255, 255, 255)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "GENTA " + "${egenta.edisi}",
              style: Styles.cardTitleText,
            ),
            Text(
              egenta.shortDescription,
              style: Styles.cardDescriptionText,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PressableCard(
      onPressed: () {
        Navigator.of(context).push(CupertinoPageRoute(
          builder: (context) => EGENTADetailsScreen(egenta.edisi),
          fullscreenDialog: false,
        ));
      },
      child: Stack(
        children: [
          CachedNetworkImage(
              imageUrl:
                  "http://genta.petra.ac.id/heygenta/lite/assets/${egenta.image}",
              fit: BoxFit.cover),
          //Image.network(
          //  'http://genta.petra.ac.id/heygenta/lite/assets/${egenta.image}',
          //  fit: BoxFit.cover,
          //  semanticLabel: '${egenta.edisi}',
          //),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: _buildDetails(),
          ),
        ],
      ),
    );
  }
}
