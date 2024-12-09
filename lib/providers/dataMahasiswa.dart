import 'package:flutter/material.dart';
import 'package:tugas_mobile/models/mahasiswa.dart';

class DataMahasiswa with ChangeNotifier {
  final List<Mahasiswa> _mahasiswa = [
    Mahasiswa(nama: 'Tono'),
    Mahasiswa(nama: 'Harto'),
    Mahasiswa(nama: 'Faud'),
  ];

  List<Mahasiswa> get mahasiswas => _mahasiswa;

  final List<Map<String, dynamic>> _historyKehadiran = [];

  List<Map<String, dynamic>> get historyKehadiran => _historyKehadiran;

  void toggleKehadiran(int index) {
    _mahasiswa[index].isPresent = !_mahasiswa[index].isPresent;
    notifyListeners();
  }

  void saveKehadiran() {
    final presentCount = _mahasiswa.where((s) => s.isPresent).length;
    final absentCount = _mahasiswa.length - presentCount;

    _historyKehadiran.insert(0, {
      'date': DateTime.now(),
      'present': presentCount,
      'absent': absentCount,
    });

    for (var student in _mahasiswa) {
      student.isPresent = false;
    }
    notifyListeners();
  }
}
