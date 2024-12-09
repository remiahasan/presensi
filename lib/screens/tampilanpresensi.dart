import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_mobile/providers/dataMahasiswa.dart';

class TampilanPresensi extends StatefulWidget {
  const TampilanPresensi({super.key});

  @override
  State<TampilanPresensi> createState() => _TampilanPresensiState();
}

class _TampilanPresensiState extends State<TampilanPresensi> {
  @override
  Widget build(BuildContext context) {
    final dataMahasiswa = Provider.of<DataMahasiswa>(context);
    final mahasiswas = dataMahasiswa.mahasiswas;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Presensi Mahasiswa'),
        backgroundColor: Colors.green,
      ),

      body: ListView.builder(
        itemCount: mahasiswas.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(mahasiswas[index].nama),
            trailing: Checkbox(
              value: mahasiswas[index].isPresent,
              onChanged: (_) => dataMahasiswa.toggleKehadiran(index)
            ),
          );
        }
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: mahasiswas.isEmpty 
          ? null
          : () {
            dataMahasiswa.saveKehadiran();
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('presensi telah disimpan.'))
          );
          },
          child: Text('simpan'),
        ),
      ),
    );
  }
}