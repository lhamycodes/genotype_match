import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../shared/app_colors.dart';
import '../../shared/ui_helpers.dart';
import '../../widgets/text_link.dart';
import '../../../models/genotype.dart';

class GenotypePicker extends StatefulWidget {
  final ScrollController scrollController;
  final List<Genotype> genotypes;
  final Function onSelect;
  final Genotype genotype;

  const GenotypePicker({
    Key key,
    this.scrollController,
    this.genotypes,
    this.onSelect,
    this.genotype,
  }) : super(key: key);

  @override
  _GenotypePickerState createState() => _GenotypePickerState();
}

class _GenotypePickerState extends State<GenotypePicker> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: TextLink(
                  "Close",
                  size: 14,
                  color: Colors.red,
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              verticalSpace(15),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Select Genotype",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    fontSize: 18.0,
                    color: primaryColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 10,
                ),
                child: Divider(),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (cx, i) {
                  Genotype gen = widget.genotypes[i];
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: gen.color,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SvgPicture.asset(
                          "assets/images/bgc.svg",
                          color: Colors.white,
                        ),
                      ),
                    ),
                    trailing: widget.genotype?.name == gen.name
                        ? Icon(Icons.check)
                        : null,
                    title: Text(gen.name),
                    onTap: () => widget.onSelect(gen),
                  );
                },
                itemCount: widget.genotypes.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
