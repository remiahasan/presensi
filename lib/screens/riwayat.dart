import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_mobile/providers/dataMahasiswa.dart';

class Riwayat extends StatelessWidget {
  const Riwayat({super.key});

  @override
  Widget build(BuildContext context) {
    final attendanceHistory =
        Provider.of<DataMahasiswa>(context).historyKehadiran;
    return Scaffold(
      appBar: AppBar(title:
      Text('Riwayat Kehadiran'),
      backgroundColor: Colors.green,
      ),
      body: attendanceHistory.isEmpty
          ? Center(child: Text('Belum ada riwayat kehadiran.'))
          : ListView.builder(
              itemCount: attendanceHistory.length,
              itemBuilder: (context, index) {
                final record = attendanceHistory[index];
                return ListTile(
                  title: Text(
                    'Tanggal: ${record['date'].toString().split(' ')[0]}',
                  ),
                  subtitle: Text(
                    'Hadir: ${record['present']}, Tidak Hadir: ${record['absent']}',
                  ),
                );
              },
            ),
    );
  }
}
