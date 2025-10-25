import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';

Future<Uint8List> generatePdfDocument(Map<String, String> formData) async {
  final pdf = pw.Document();

  // Load logo from assets
  final logoImage = pw.MemoryImage(
    (await rootBundle.load('assets/background.png')).buffer.asUint8List(),
  );

  pdf.addPage(
    pw.MultiPage(
      margin: const pw.EdgeInsets.all(24),
      pageFormat: PdfPageFormat.a4,
      header: (context) {
        return pw.Container(
          padding: const pw.EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          color: PdfColor.fromHex("#003366"), // Navy Header
          child: pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Container(
                height: 50,
                width: 50,
                child: pw.Image(logoImage, fit: pw.BoxFit.contain),
              ),
              pw.SizedBox(width: 14),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "BIRVA AUS PTY LTD",
                    style: pw.TextStyle(
                      color: PdfColors.white,
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    "Australia",
                    style: pw.TextStyle(color: PdfColors.white, fontSize: 10),
                  ),
                  pw.Text(
                    "Phone: +677-7896544 | Email: sdg@gmail.com",
                    style: pw.TextStyle(color: PdfColors.white, fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
        );
      },

      footer: (context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Divider(color: PdfColors.grey, thickness: 0.5),
            pw.SizedBox(height: 6),
            pw.Text(
              "This document has been generated electronically. Any unauthorized review, use, disclosure, or distribution is prohibited.",
              style: pw.TextStyle(fontSize: 9, color: PdfColors.grey600),
              textAlign: pw.TextAlign.center,
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              "Page ${context.pageNumber} of ${context.pagesCount}",
              style: pw.TextStyle(fontSize: 9, color: PdfColors.grey600),
            ),
          ],
        );
      },

      build: (context) => [
        pw.SizedBox(height: 16),

        pw.Text(
          "Form Details",
          style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 12),

        ...formData.entries.map((entry) {
          return pw.Padding(
            padding: const pw.EdgeInsets.only(bottom: 8),
            child: pw.RichText(
              text: pw.TextSpan(
                children: [
                  pw.TextSpan(
                    text: "${entry.key}: ",
                    style: pw.TextStyle(
                      fontSize: 12,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.TextSpan(
                    text: entry.value,
                    style: pw.TextStyle(
                      fontSize: 12,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ],
    ),
  );

  return pdf.save();
}
