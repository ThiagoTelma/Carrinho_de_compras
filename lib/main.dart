// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class Produto {
  final String nome;
  final double preco;
  final String imagemUrl;

  Produto(this.nome, this.preco, this.imagemUrl);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ProdutoLista());
  }
}

class ProdutoLista extends StatefulWidget {
  const ProdutoLista({super.key});

  @override
  _ProdutoListaState createState() => _ProdutoListaState();
}

class _ProdutoListaState extends State<ProdutoLista> {
  final List<Produto> _produtos = [
    Produto(
      'Cookies',
      4.50,
      'https://img.freepik.com/fotos-gratis/biscoitos-de-chocolate-isolados-no-fundo-branco-ai-generative_123827-24070.jpg?semt=ais_hybrid&w=740',
    ),
    Produto(
      'Refrigerante',
      6.50,
      'https://revistaforum.com.br/u/fotografias/m/2023/6/29/f850x638-105666_183155_5050.jpg',
    ),
    Produto(
      'Pitaya',
      19.99,
      'https://static.vecteezy.com/ti/fotos-gratis/t2/46151224-fruta-do-dragao-ou-pitaya-isolado-em-uma-branco-fundo-gratis-foto.jpg',
    ),
    Produto(
      'Pão',
      4.00,
      'https://static.wixstatic.com/media/6d4bf6_0999cdb015394ad389c0a4cb5c3763dd~mv2.jpg/v1/fill/w_480,h_606,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/6d4bf6_0999cdb015394ad389c0a4cb5c3763dd~mv2.jpg',
    ),
    Produto(
      'Leite',
      4.50,
      'https://mercantilnovaera.vtexassets.com/arquivos/ids/199730-800-450?v=637937629411800000&width=800&height=450&aspect=true',
    ),
    Produto(
      'Café Expresso',
      9.50,
      'https://img.freepik.com/fotos-gratis/chavena-de-cafe-com-um-coracao-desenhado-na-espuma_1286-70.jpg?semt=ais_hybrid&w=740',
    ),
  ];

  double _total = 0.0;

  void _adicionarProduto(double preco) {
    setState(() {
      _total += preco;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('🛒 Carrinho de Compras'), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Número de cards por linha
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 3 / 4,
              ),
              itemCount: _produtos.length,
              itemBuilder: (context, index) {
                final produto = _produtos[index];
                return _buildProdutoCard(produto);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: Text(
              'Total: R\$ ${_total.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProdutoCard(Produto produto) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            produto.imagemUrl,
            height: 100,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8.0),
          Text(
            produto.nome,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            'R\$ ${produto.preco.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const Spacer(),
          ElevatedButton.icon(
            onPressed: () => _adicionarProduto(produto.preco),
            icon: const Icon(Icons.add_shopping_cart, color: Colors.white),
            label: const Text(
              'Adicionar',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
