import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:plant_shop/constants/constants.dart';
import 'package:plant_shop/screens/qr_overlay.dart';

class CamerScreen extends StatefulWidget {
  const CamerScreen({super.key});

  @override
  State<CamerScreen> createState() => _CamerScreenState();
}

class _CamerScreenState extends State<CamerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mobile Scanner')),
      body: Stack(
        children: [
          MobileScanner(
            allowDuplicates: false,
            onDetect: (barcode, args) {
              if (barcode.rawValue == null) {
                debugPrint('Failed to scan Barcode');
              } else {
                final String code = barcode.rawValue!;
                debugPrint('Barcode found! $code');
              }
            },
          ),
          QRScannerOverlay(overlayColour: Constants.blackColor.withOpacity(0.5))
        ],
      ),
    );
  }
}
