import 'dart:typed_data';

import 'package:pdf/widgets.dart' as pw;

Future<Uint8List> generatePdfDocument(Map<String, String> formData) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: formData.entries.map((entry) {
            return pw.Text(
              "${entry.key}: ${entry.value}",
              style: pw.TextStyle(fontSize: 14),
            );
          }).toList(),
        );
      },
    ),
  );

  return pdf.save();
}
