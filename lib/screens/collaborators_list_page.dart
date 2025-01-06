import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neo_ice/database/app_database.dart';
import 'package:neo_ice/widgets/collaborator_modal.dart';
import 'package:neo_ice/widgets/new_collaborator_modal.dart';
import 'package:neo_ice/providers/vendedor_provider.dart';
import 'package:neo_ice/widgets/collaborator_card.dart';

class CollaboratorListPage extends ConsumerWidget {
  const CollaboratorListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vendedores = ref.watch(vendedorProvider);

    return Stack(children: [
      const Positioned(
        top: 20,
        left: 20,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'COLABORADORES',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Positioned.fill(
        top: 60,
        child: vendedores.isEmpty
            ? const Center(child: Text('Nenhum vendedor encontrado.'))
            : ListView.builder(
                itemCount: vendedores.length,
                itemBuilder: (context, index) {
                  final vendedor = vendedores[index];
                  return GestureDetector(
                    onTap: () {
                      mostrarCollaboratorModal(
                          context, AppDatabase(), vendedor.id);
                    },
                    child: CollaboratorCard(
                      nome: vendedor.nome,
                      numero: vendedor.id,
                    ),
                  );
                },
              ),
      ),
      Positioned(
        bottom: 20,
        right: 20,
        child: FloatingActionButton(
          onPressed: () {
            mostrarNewCollaboratorModal(context, AppDatabase());
          },
          child: const Icon(Icons.add),
        ),
      ),
    ]);
  }
}

mostrarNewCollaboratorModal(BuildContext context, AppDatabase db) {
  showDialog(
    context: context,
    builder: (context) => NewCollaboratorModal(),
  );
}

mostrarCollaboratorModal(BuildContext context, AppDatabase db, int id) {
  showDialog(
    context: context,
    builder: (context) => CollaboratorModal(id: id),
  );
}
