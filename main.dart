import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ===================================================================
// ROOT
// ===================================================================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Boba & Food App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const HomePage(),
    );
  }
}

// ===================================================================
// MODEL
// ===================================================================
class Item {
  final String id;
  final String name;
  final String category;
  final int price;

  Item({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
  });
}

class CartItem {
  final Item item;
  int qty;
  String notes;

  CartItem({required this.item, this.qty = 1, this.notes = ""});
}

// ===================================================================
// SAMPLE DATA
// ===================================================================
final sampleItems = <Item>[
  Item(id: "d1", name: "Boba Vanilla", category: "Minuman", price: 18000),
  Item(id: "d2", name: "Boba Stroberi", category: "Minuman", price: 19000),
  Item(id: "d3", name: "Boba Coklat", category: "Minuman", price: 20000),
  Item(id: "f1", name: "Burger", category: "Makanan", price: 25000),
  Item(id: "f2", name: "Pizza", category: "Makanan", price: 60000),
  Item(id: "f3", name: "Kentang Goreng", category: "Makanan", price: 15000),
];

String rupiah(int n) {
  return n.toString().replaceAllMapped(
    RegExp(r"(\d)(?=(\d{3})+$)"),
    (m) => "${m[1]}.",
  );
}

// ===================================================================
// PAGE 1 : HOME
// ===================================================================
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<CartItem> cart = [];

  int get totalQty => cart.fold(0, (s, e) => s + e.qty);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Boba & Food App"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CartPage(cart: cart)),
              ).then((_) => setState(() {}));
            },
          ),
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: const Color.fromARGB(255, 110, 39, 217),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Selamat Datang!",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text("Barang di keranjang: $totalQty"),
              ],
            ),
          ),

          const SizedBox(height: 15),
          Center(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.store),
              label: const Text("Lihat Menu"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => MenuPage(cart: cart)),
                ).then((_) => setState(() {}));
              },
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Populer",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          SizedBox(
            height: 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: sampleItems.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (_, i) {
                final it = sampleItems[i];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailPage(item: it, cart: cart),
                      ),
                    ).then((_) => setState(() {}));
                  },
                  child: Container(
                    width: 180,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(blurRadius: 4, color: Colors.black12),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          it.category == "Minuman"
                              ? Icons.icecream
                              : Icons.fastfood,
                          size: 40,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          it.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("Rp ${rupiah(it.price)}"),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ===================================================================
// PAGE 2 : MENU
// ===================================================================
class MenuPage extends StatelessWidget {
  final List<CartItem> cart;
  const MenuPage({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Menu")),
      body: ListView.builder(
        itemCount: sampleItems.length,
        itemBuilder: (_, i) {
          final it = sampleItems[i];
          return ListTile(
            leading: Icon(
              it.category == "Minuman" ? Icons.local_drink : Icons.fastfood,
            ),
            title: Text(it.name),
            subtitle: Text("Rp ${rupiah(it.price)}"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailPage(item: it, cart: cart),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// ===================================================================
// PAGE 3 : DETAIL
// ===================================================================
class DetailPage extends StatefulWidget {
  final Item item;
  final List<CartItem> cart;
  const DetailPage({super.key, required this.item, required this.cart});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int qty = 1;
  final TextEditingController noteC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.item.name)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              widget.item.category == "Minuman"
                  ? Icons.icecream
                  : Icons.fastfood,
              size: 80,
            ),
            const SizedBox(height: 20),
            Text(
              widget.item.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text("Rp ${rupiah(widget.item.price)}"),
            const SizedBox(height: 20),

            Row(
              children: [
                IconButton(
                  onPressed: () => setState(() {
                    if (qty > 1) qty--;
                  }),
                  icon: const Icon(Icons.remove),
                ),
                Text(qty.toString(), style: const TextStyle(fontSize: 20)),
                IconButton(
                  onPressed: () => setState(() {
                    qty++;
                  }),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),

            const SizedBox(height: 20),
            TextField(
              controller: noteC,
              decoration: const InputDecoration(
                labelText: "Catatan (opsional)",
                border: OutlineInputBorder(),
              ),
            ),

            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text("Masukkan ke Keranjang"),
                onPressed: () {
                  final exist = widget.cart.where(
                    (e) => e.item.id == widget.item.id,
                  );
                  if (exist.isNotEmpty) {
                    exist.first.qty += qty;
                  } else {
                    widget.cart.add(
                      CartItem(item: widget.item, qty: qty, notes: noteC.text),
                    );
                  }

                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ===================================================================
// PAGE 4 : CART
// ===================================================================
class CartPage extends StatefulWidget {
  final List<CartItem> cart;
  const CartPage({super.key, required this.cart});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int get total => widget.cart.fold(0, (s, e) => s + (e.qty * e.item.price));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Keranjang")),
      body: widget.cart.isEmpty
          ? const Center(child: Text("Keranjang kosong"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.cart.length,
                    itemBuilder: (_, i) {
                      final c = widget.cart[i];
                      return ListTile(
                        title: Text("${c.item.name} x${c.qty}"),
                        subtitle: Text("Rp ${rupiah(c.item.price * c.qty)}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() => widget.cart.removeAt(i));
                          },
                        ),
                      );
                    },
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        "Total: Rp ${rupiah(total)}",
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        child: const Text("Checkout"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => CheckoutPage(total: total),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

// ===================================================================
// PAGE 5 : CHECKOUT SUKSES
// ===================================================================
class CheckoutPage extends StatelessWidget {
  final int total;
  const CheckoutPage({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pembayaran")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 120, color: Colors.green),
            const SizedBox(height: 20),
            Text("Total Pembayaran:", style: const TextStyle(fontSize: 18)),
            Text(
              "Rp ${rupiah(total)}",
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Text("Kembali ke Home"),
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
    );
  }
}
