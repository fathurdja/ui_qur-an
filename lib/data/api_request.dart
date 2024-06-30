import "dart:convert";

import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:slicing_uiquran/data/surat_mode.dart";

Future<List<Surat>> getSuratData() async {
  final respons = await http.get(
    Uri.parse('https://equran.id/api/v2/surat'),
  );

  if (respons.statusCode == 200) {
    var data = jsonDecode(respons.body);
    return data['data'].map<Surat>((surat) => Surat.fromJson(surat)).toList();
  } else {
    throw Exception('Failed to Load Data');
  }
}
