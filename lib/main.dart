import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      home: const MenuPage(),
    );
  }
}

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});
  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<Map<String, dynamic>> menu = [
    {
      'nama': 'Mie Ayam',
      'harga': 15000,
      'stok': 50,
      'img':
          'https://awsimages.detik.net.id/community/media/visual/2022/10/12/resep-mie-ayam-kecap_43.jpeg?w=1200',
      'desc': 'Mie ayam kecap gurih',
    },
    {
      'nama': 'Bakso Mercon',
      'harga': 20000,
      'stok': 20,
      'img':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfSY6oHWlxIvMio47X8FJY9cKdnXujfWeZ2Q&s',
      'desc': 'Bakso pedes nampol',
    },
    {
      'nama': 'Sate Ayam',
      'harga': 25000,
      'stok': 45,
      'img':
          'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=400&h=400&fit=crop',
      'desc': 'Sate bumbu kacang asli',
    },
    {
      'nama': 'Telur Dadar',
      'harga': 8000,
      'stok': 10,
      'img':
          'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=400&h=400&fit=crop',
      'desc': 'Telur dadar padang tebal',
    },
  ];

  String formatRupiah(int harga) =>
      'Rp ${harga.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}';
  Color _stokColor(int stok) => stok > 30
      ? Colors.green
      : stok > 10
      ? Colors.orange
      : Colors.red;

  void _tambahMenu() {
    final namaCtrl = TextEditingController();
    final hargaCtrl = TextEditingController();
    final stokCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    final imgCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Tambah Menu Baru'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: namaCtrl,
                decoration: InputDecoration(
                  labelText: 'Nama Menu',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: hargaCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Harga',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: stokCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Stok',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: descCtrl,
                decoration: InputDecoration(
                  labelText: 'Deskripsi',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: imgCtrl,
                decoration: InputDecoration(
                  labelText: 'Link Gambar',
                  hintText: 'https://...',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text('Batal')),
          ElevatedButton(
            onPressed: () {
              if (namaCtrl.text.isNotEmpty && hargaCtrl.text.isNotEmpty) {
                setState(
                  () => menu.add({
                    'nama': namaCtrl.text,
                    'harga': int.tryParse(hargaCtrl.text) ?? 0,
                    'stok': int.tryParse(stokCtrl.text) ?? 0,
                    'img': imgCtrl.text.isNotEmpty
                        ? imgCtrl.text
                        : 'https://via.placeholder.com/400',
                    'desc': descCtrl.text,
                  }),
                );
                Navigator.pop(ctx);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${namaCtrl.text} berhasil ditambah!'),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            },
            child: Text('Simpan'),
          ),
        ],
      ),
    );
  }

  void _editMenu(int index) {
    final item = menu[index];
    final namaCtrl = TextEditingController(text: item['nama']);
    final hargaCtrl = TextEditingController(text: item['harga'].toString());
    final stokCtrl = TextEditingController(text: item['stok'].toString());
    final descCtrl = TextEditingController(text: item['desc']);
    final imgCtrl = TextEditingController(text: item['img']);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Edit Menu'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: namaCtrl,
                decoration: InputDecoration(
                  labelText: 'Nama Menu',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: hargaCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Harga',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: stokCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Stok',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: descCtrl,
                decoration: InputDecoration(
                  labelText: 'Deskripsi',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: imgCtrl,
                decoration: InputDecoration(
                  labelText: 'Link Gambar',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text('Batal')),
          ElevatedButton(
            onPressed: () {
              setState(
                () => menu[index] = {
                  'nama': namaCtrl.text,
                  'harga': int.tryParse(hargaCtrl.text) ?? 0,
                  'stok': int.tryParse(stokCtrl.text) ?? 0,
                  'img': imgCtrl.text,
                  'desc': descCtrl.text,
                },
              );
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${namaCtrl.text} diupdate!'),
                  backgroundColor: Colors.blue,
                ),
              );
            },
            child: Text('Update'),
          ),
        ],
      ),
    );
  }

  void _hapusMenu(int index) {
    final nama = menu[index]['nama'];
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Hapus Menu?'),
        content: Text('Yakin mau hapus $nama?'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text('Batal')),
          ElevatedButton(
            onPressed: () {
              setState(() => menu.removeAt(index));
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$nama dihapus!'),
                  backgroundColor: Colors.red,
                ),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text('Hapus', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar Produk',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange[400]!, Colors.orange[700]!],
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => setState(() {}),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Chip(
              label: Text(
                '${menu.length} Menu',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.white24,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.orange[50]!, Colors.white],
          ),
        ),
        child: ListView.builder(
          padding: EdgeInsets.all(12),
          itemCount: menu.length,
          itemBuilder: (context, i) {
            final item = menu[i];
            final stokColor = _stokColor(item['stok']);
            return Container(
              margin: EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(12),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => DetailPage(item: item)),
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    item['img'].trim(),
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      width: 70,
                      height: 70,
                      color: Colors.grey[200],
                      child: Icon(Icons.restaurant, color: Colors.grey),
                    ),
                  ),
                ),
                title: Text(
                  item['nama'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 6),
                    Text(
                      formatRupiah(item['harga']),
                      style: TextStyle(
                        color: Colors.green[700],
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: stokColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: stokColor.withOpacity(0.3)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.inventory_2, size: 14, color: stokColor),
                          SizedBox(width: 4),
                          Text(
                            'Stok: ${item['stok']}',
                            style: TextStyle(
                              fontSize: 12,
                              color: stokColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      onPressed: () => _editMenu(i),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _hapusMenu(i),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _tambahMenu,
        icon: Icon(Icons.add),
        label: Text('Tambah Menu'),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> item;
  const DetailPage({super.key, required this.item});
  String formatRupiah(int harga) =>
      'Rp ${harga.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['nama']),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange[400]!, Colors.orange[700]!],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
              child: Image.network(
                item['img'].trim(),
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 250,
                  color: Colors.grey[200],
                  child: Icon(Icons.restaurant, size: 80),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['nama'],
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    formatRupiah(item['harga']),
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.green[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 14),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.green),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.check_circle, size: 18, color: Colors.green),
                        SizedBox(width: 6),
                        Text(
                          'Tersedia: ${item['stok']} pcs',
                          style: TextStyle(
                            color: Colors.green[700],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Deskripsi',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.orange[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.orange[100]!),
                    ),
                    child: Text(
                      item['desc'],
                      style: TextStyle(fontSize: 15, height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
