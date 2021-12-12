import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowElement extends StatelessWidget {
  final String title;
  final String? description;
  final GestureTapCallback? onTap;
  final bool dividerAfter;

  const RowElement({
    Key? key,
    required this.title,
    this.description,
    this.onTap,
    this.dividerAfter = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (onTap != null) {
      return InkWell(
        child: _Content(title, description, dividerAfter, true),
        onTap: onTap,
      );
    } else {
      return _Content(title, description, dividerAfter, false);
    }
  }
}

class _Content extends StatelessWidget {
  final String title;
  final String? description;
  final bool divider;
  final bool navigable;

  _Content(this.title, this.description, this.divider, this.navigable);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  softWrap: true,
                ),
              ),
              const Spacer(),
              if (description != null)
                Expanded(
                  child: Text(
                    description!,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              if (navigable) const Icon(CupertinoIcons.right_chevron)
            ],
          ),
        ),
        if (divider)
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: Divider(),
          ),
      ],
    );
  }
}
