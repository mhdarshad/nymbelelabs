import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required this.serchvalue,
  });

  final ValueNotifier<String> serchvalue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        // controller: _model.textController,
        onChanged: (value){
          serchvalue.value = value;
          serchvalue.notifyListeners();
        },
        obscureText: false,
        decoration: InputDecoration(
          labelText: 'Search Products...',
          labelStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black45,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0x00000000),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0x00000000),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0x00000000),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          prefixIcon: const Icon(
            Icons.search_sharp,
            color: Colors.grey,
          ),
        ),
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
