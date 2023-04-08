import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

import 'location_controller.dart';

class LocationSearchDialog extends StatelessWidget {
  final GoogleMapController? mapController;
  const LocationSearchDialog({
    Key? key,
    this.mapController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Container(
      margin: const EdgeInsets.only(top : 150),
      padding: const EdgeInsets.all(5),
      alignment: Alignment.topCenter,
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: SizedBox(width: 350, child: TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
            controller: controller,
            textInputAction: TextInputAction.search,
            autofocus: true,
            textCapitalization: TextCapitalization.words,
            keyboardType: TextInputType.streetAddress,
            decoration: InputDecoration(
              hintText: 'search_location',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(style: BorderStyle.none, width: 0),
              ),
              hintStyle: Theme.of(context).textTheme.headline2?.copyWith(
                fontSize: 16, color: Theme.of(context).disabledColor,
              ),
              filled: true, fillColor: Theme.of(context).cardColor,
            ),
            style: Theme.of(context).textTheme.headline2?.copyWith(
              color: Theme.of(context).textTheme.bodyText1?.color, fontSize: 20,
            ),
          ),
          suggestionsCallback: (pattern) async {
            return await Get.find<LocationController>().searchLocation(pattern, context);
          },
          itemBuilder: (context, Prediction suggestion) {
            return Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Icon(Icons.location_on),
                      Expanded(
                        child: Text(suggestion.description!, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.headline2?.copyWith(
                        color: Theme.of(context).textTheme.bodyText1?.color, fontSize: 20,
                      )
                    ),
                  ),
                ]
              ),
            );
          },
          onSuggestionSelected: (Prediction suggestion) {
            log("My location is ${suggestion.description!}");
            //Get.find<LocationController>().setLocation(suggestion.placeId!, suggestion.description!, mapController);
            Get.back();
          },
        )),
      ),
    );
  }
}
