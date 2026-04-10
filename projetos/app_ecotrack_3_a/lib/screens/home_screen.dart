import 'package:app_ecotrack_3_a/widgets/acao_rapida_card.dart';
import 'package:app_ecotrack_3_a/widgets/atividade_item.card.dart';
import 'package:app_ecotrack_3_a/widgets/resumo_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final String userName = 'Erika';

  @override
  Widget build(BuildContext context) {
    final String dataAtual =
        DateFormat("dd/MM/yyyy").format(DateTime.now());

    return Scaffold(
      backgroundColor: const Color(0xFFF3EEF4),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4CAF50),
        elevation: 0,
        title: const Row(
          children: [
            Icon(Icons.eco, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'EcoTrack',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {
              // Ir para perfil
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Ir para notificações
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              // Fazer logout
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Saudação
            Text(
              'Olá, $userName 👋',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E1E1E),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Bem-vinda ao EcoTrack',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Hoje: $dataAtual',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black45,
              ),
            ),

            const SizedBox(height: 24),

            // Resumo
            const Text(
              '📊 RESUMO',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.3,
              children: const [
                ResumoCard(
                  icon: Icons.recycling,
                  title: 'Coletas',
                  value: '12',
                ),
                ResumoCard(
                  icon: Icons.emoji_events,
                  title: 'Pontos',
                  value: '340',
                ),
                ResumoCard(
                  icon: Icons.eco,
                  title: 'CO₂',
                  value: '18kg',
                ),
                ResumoCard(
                  icon: Icons.track_changes,
                  title: 'Meta',
                  value: '75%',
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Ações rápidas
            const Text(
              '⚡ AÇÕES RÁPIDAS',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.7,
              children: [
                AcaoRapidaCard(
                  icon: Icons.add_circle_outline,
                  title: 'Registrar coleta',
                  onTap: () {},
                ),
                AcaoRapidaCard(
                  icon: Icons.location_on_outlined,
                  title: 'Pontos de coleta',
                  onTap: () {},
                ),
                AcaoRapidaCard(
                  icon: Icons.bar_chart,
                  title: 'Relatórios',
                  onTap: () {},
                ),
                AcaoRapidaCard(
                  icon: Icons.history,
                  title: 'Histórico',
                  onTap: () {},
                ),
                AcaoRapidaCard(
                  icon: Icons.flag_outlined,
                  title: 'Metas ambientais',
                  onTap: () {},
                ),
                AcaoRapidaCard(
                  icon: Icons.lightbulb_outline,
                  title: 'Dicas sustentáveis',
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Atividades recentes
            const Text(
              '🕒 ATIVIDADES RECENTES',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            const AtividadeItem(
              icon: Icons.recycling,
              title: 'Plástico reciclado',
              points: '+20 pts',
            ),
            const SizedBox(height: 10),
            const AtividadeItem(
              icon: Icons.description_outlined,
              title: 'Papel descartado',
              points: '+10 pts',
            ),
            const SizedBox(height: 10),
            const AtividadeItem(
              icon: Icons.local_drink_outlined,
              title: 'Vidro reciclado',
              points: '+15 pts',
            ),
            const SizedBox(height: 10),
            const AtividadeItem(
              icon: Icons.notifications_active_outlined,
              title: 'Meta semanal atualizada',
              points: 'Nova meta',
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF4CAF50),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          // Exemplo de navegação futura:
          // if (index == 1) Navigator.push(...);
          // if (index == 2) Navigator.push(...);
          // if (index == 3) Navigator.push(...);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Histórico',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}


