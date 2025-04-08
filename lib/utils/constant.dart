import 'package:flutter/material.dart';

const Color primary = Color(0xFFA07558);
const Color grey900 = Color(0xFF3E3E3E);
const Color grey700 = Color(0xFF626262);
const Color grey500 = Color(0xFF8E8E8E);
const Color grey300 = Color(0xFFBEBEBE);
const Color grey100 = Color(0xFFE9E9E9);
const Color background = Color(0xFFF1F2F6);
const Color black = Colors.black;
const Color white = Colors.white; 

const Map<String, String> authExceptionMapper = {
  'email sudah digunakan' : 'email ini sudah digunakan, pake yang lain',
  'email tidak valid' : 'alamat email tidak sesuai',
  'password lemah' : 'password anda lemah, bikin yang lebih kuat',
  'pengguna tidak digunakan' : 'akun dari email ini tidak digunakan',
  'pengguna tidak ditemukan' : 'tidak ada akun di email ini',
  'password salah' : 'password yang dimasukkan tidak benar',
  'login tidak valid' : 'email atau password tidak sesuai',
  'terlalu banyak permintaan' : 'terlalu banyak permintaan, coba lagi nanti',
  'jaringan buruk' : 'tidak bisa berpindah, cek koneksi internetmu:)',
  'user tidak sesuai' : 'tidak sesuai',
  'invalid credential' : 'your credential not valid'};