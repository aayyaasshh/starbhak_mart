import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:starbhakmart/theme.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}


class _CreatePageState extends State<CreatePage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  String? selectedValue;

  // Daftar item dropdown
  final List<String> items = ['Produk A', 'Produk B', 'Produk C', 'Produk D'];

   String? selectedFile; // Variabel untuk menyimpan nama file

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      // Jika file dipilih, ambil nama file
      PlatformFile file = result.files.first;
      setState(() {
        selectedFile = file.name; // Update dengan nama file yang dipilih
      });
    } else {
      // Jika tidak ada file yang dipilih
      setState(() {
        selectedFile = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new,
                color: Colors.black, size: 18),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.person_outline,
                  color: Colors.black, size: 18),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Padding(padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      
      children: [
       
         Container(
          margin: EdgeInsets.only(top: 20), // Margin top untuk label 'Nama Produk'
          child: Text(
            'Nama Produk',  // Label
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 8), // Spasi antara label dan input
        TextField(
          controller: _controller,  // Input
          decoration: InputDecoration(
            hintText: 'Masukan nama produk',
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), // Rounded border
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Colors.grey, // Warna border saat input tidak fokus
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Colors.blue, // Warna border saat input fokus
                width: 2.0,
              ),
            ),
            fillColor: Colors.white,
            filled: true, // Background putih di dalam input
          ),
        ),

         Container(
          margin: EdgeInsets.only(top: 20), // Margin top untuk label 'Nama Produk'
          child: Text(
            'Harga',  // Label
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 8), // Spasi antara label dan input
        TextField(
          controller: _controller2,  // Input
          decoration: InputDecoration(
            hintText: 'Masukan Harga',
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), // Rounded border
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Colors.grey, // Warna border saat input tidak fokus
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Colors.blue, // Warna border saat input fokus
                width: 2.0,
              ),
            ),
            fillColor: Colors.white,
            filled: true, // Background putih di dalam input
          ),
        ),

         Container(
          margin: EdgeInsets.only(top: 20), // Margin top untuk label 'Nama Produk'
          child: Text(
            'Kategori Produk',  // Label
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 8), // Spasi antara label dan dropdown
        DropdownButtonFormField<String>(
          value: selectedValue,
          hint: Text('Pilih produk'), // Placeholder sebelum item dipilih
          icon: Icon(Icons.arrow_drop_down), // Ikon dropdown
          isExpanded: true, // Agar dropdown mengisi lebar penuh
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), // Rounded border
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            fillColor: Colors.white,
            filled: true, // Background putih di dalam input
          ),
          onChanged: (newValue) {
            setState(() {
              selectedValue = newValue; // Update nilai yang dipilih
            });
          },
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
        ),

       Container(
          margin: EdgeInsets.only(top: 20), // Margin top untuk label 'Nama Produk'
          child: Text(
            'Masukan Gambar',  // Label
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
         ElevatedButton(
            onPressed: _pickFile, // Panggil fungsi untuk memilih file
            child: Text('Choose File'),
          ),
          SizedBox(height: 16),
          Text(
            selectedFile != null ? 'File Terpilih: $selectedFile' : 'Belum ada file yang dipilih',
            style: TextStyle(fontSize: 16),
          ),

          Container(
             margin: EdgeInsets.only(top: 20), 
          ),
         SizedBox(
          width: 500,
          height: 53,
           child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: birubg,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                textStyle: TextStyle(
                  color: whitebg,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text('Submit'),
            ),
         ),

      ],
      ),
      ),
    );
  }
}