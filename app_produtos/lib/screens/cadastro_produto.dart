import 'package:flutter/material.dart';
import '../models/produto.dart';

class CadastroProduto extends StatefulWidget {
  const CadastroProduto({super.key});

  @override
  State<CadastroProduto> createState() => _CadastroProdutoState();
}

class _CadastroProdutoState extends State<CadastroProduto> {
  final _nomeController = TextEditingController();
  final _precoController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _imagemController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _precoController.dispose();
    _descricaoController.dispose();
    _imagemController.dispose();
    super.dispose();
  }

  void _salvar() {
    final nome = _nomeController.text.trim();
    final precoText = _precoController.text.trim().replaceAll(',', '.');

    if (nome.isEmpty) {
      _mostrarErro('Por favor, informe o nome do produto.');
      return;
    }

    if (precoText.isEmpty) {
      _mostrarErro('Por favor, informe o preço do produto.');
      return;
    }

    final preco = double.tryParse(precoText);
    if (preco == null || preco < 0) {
      _mostrarErro('Preço inválido. Use apenas números.');
      return;
    }

    final produto = Produto(
      nome: nome,
      preco: preco,
      descricao: _descricaoController.text.trim(),
      imagemUrl: _imagemController.text.trim().isEmpty
          ? null
          : _imagemController.text.trim(),
    );

    Navigator.pop(context, produto);
  }

  void _mostrarErro(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A2E),
        foregroundColor: Colors.white,
        title: const Text(
          'Novo Produto',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            _buildSectionTitle('Informações Básicas'),
            const SizedBox(height: 12),
            _buildTextField(
              controller: _nomeController,
              label: 'Nome do Produto',
              hint: 'Ex: Camiseta Azul',
              icon: Icons.label_outline,
            ),
            const SizedBox(height: 12),
            _buildTextField(
              controller: _precoController,
              label: 'Preço (R\$)',
              hint: 'Ex: 49,90',
              icon: Icons.attach_money,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Informações Adicionais'),
            const SizedBox(height: 12),
            _buildTextField(
              controller: _descricaoController,
              label: 'Descrição',
              hint: 'Descreva o produto...',
              icon: Icons.description_outlined,
              maxLines: 3,
            ),
            const SizedBox(height: 12),
            _buildTextField(
              controller: _imagemController,
              label: 'URL da Imagem (opcional)',
              hint: 'https://...',
              icon: Icons.image_outlined,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: _salvar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C63FF),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Salvar Produto',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Color(0xFF6C63FF),
        letterSpacing: 0.8,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        style: const TextStyle(
          fontSize: 15,
          color: Color(0xFF1A1A2E),
        ),
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(icon, color: const Color(0xFF6C63FF), size: 22),
          labelStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
          hintStyle: TextStyle(color: Colors.grey[300], fontSize: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFF6C63FF), width: 1.5),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
      ),
    );
  }
}