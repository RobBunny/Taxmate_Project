import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'api_service.dart';

class FileUploadBLOPage extends StatefulWidget {
  final int clientId;
  final int bloId;
  final ApiService apiService;

  const FileUploadBLOPage({
    super.key,
    required this.clientId,
    required this.bloId,
    required this.apiService,
  });

  @override
  State<FileUploadBLOPage> createState() => _FileUploadBLOPageState();
}

class _FileUploadBLOPageState extends State<FileUploadBLOPage> {
  final Map<String, File?> _files = {};
  final Map<String, String?> _uploadStatus = {};
  final List<String> _docTypes = [
    'NID',
    'TIN',
    'Bank Statement',
    'Salary Certificate',
  ];

  Future<void> _pickFile(String docType) async {
    try {
      final result = await FilePicker.platform.pickFiles();
      if (result != null && result.files.single.path != null) {
        setState(() {
          _files[docType] = File(result.files.single.path!);
          _uploadStatus[docType] = null;
        });
      }
    } catch (e) {
      setState(() {
        _uploadStatus[docType] = '❌ Failed to pick file: $e';
      });
    }
  }

  Future<void> _uploadFile(String docType) async {
    final file = _files[docType];
    if (file == null) return;

    setState(() {
      _uploadStatus[docType] = 'Uploading...';
    });

    try {
      final fileBytes = await file.readAsBytes();
      final fileName = '$docType.pdf';
      final contentType = widget.apiService.getContentType(file.path);

      final response = await widget.apiService.uploadFileToBLO(
        userId: widget.clientId,
        bloId: widget.bloId,
        fileBytes: fileBytes,
        fileName: fileName,
        contentType: contentType,
        docType: docType,
      );

      setState(() {
        _uploadStatus[docType] = '✅ Uploaded: ${response['file_path']}';
      });
    } catch (e) {
      setState(() {
        _uploadStatus[docType] = '❌ Upload failed: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Documents to BLO'),
        backgroundColor: Colors.purple[800],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _docTypes.length,
        itemBuilder: (context, index) {
          final docType = _docTypes[index];
          final file = _files[docType];
          final status = _uploadStatus[docType];

          return Card(
            margin: const EdgeInsets.only(bottom: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    docType,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  if (file != null)
                    Text(
                      '📄 ${file.path.split('/').last}',
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () => _pickFile(docType),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple[700],
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Select File'),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: file != null ? () => _uploadFile(docType) : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple[800],
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Upload'),
                      ),
                    ],
                  ),
                  if (status != null) ...[
                    const SizedBox(height: 12),
                    Text(
                      status,
                      style: TextStyle(
                        color: status.startsWith('✅') ? Colors.green : Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
