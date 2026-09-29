import 'package:flutter/material.dart';
import '../styles/amigopet_styles.dart';


// ======================================================
// APP
// ======================================================

class AmigoPetApp extends StatelessWidget {
  const AmigoPetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AmigoPet',
      theme: ThemeData(
        primaryColor: AmigoPetStyles.verde,
        scaffoldBackgroundColor: AmigoPetStyles.fundo,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AmigoPetStyles.verde,
        ),
      ),
      home: const TelaEntrada(),
    );
  }
}


// ======================================================
// TELA DE ENTRADA
// ======================================================

class TelaEntrada extends StatelessWidget {
  const TelaEntrada({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // LOGO
              Image.asset(
                'assets/logo.png',
                width: 180,
                height: 180,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 40),

              // BOTÃO ENTRAR
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: AmigoPetStyles.botaoPrincipal,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const TelaCuidadores(),
                      ),
                    );
                  },
                  child: const Text(
                    'Entrar',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// ======================================================
// TELA 1 - LISTA DE CUIDADORES
// ======================================================

class TelaCuidadores extends StatelessWidget {
  const TelaCuidadores({super.key});

  final List<Map<String, dynamic>> cuidadores = const [
    {
      'nome': 'Ana Silva',
      'avaliacao': 4.9,
      'distancia': '0,8 km',
      'servico': 'Passeios e hospedagem',
    },
    {
      'nome': 'Carlos Santos',
      'avaliacao': 4.8,
      'distancia': '1,2 km',
      'servico': 'Passeios',
    },
    {
      'nome': 'Mariana Oliveira',
      'avaliacao': 5.0,
      'distancia': '1,5 km',
      'servico': 'Hospedagem',
    },
    {
      'nome': 'Lucas Souza',
      'avaliacao': 4.7,
      'distancia': '2,0 km',
      'servico': 'Passeios e banho',
    },
    {
      'nome': 'Beatriz Costa',
      'avaliacao': 4.9,
      'distancia': '2,4 km',
      'servico': 'Hospedagem e banho',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // ==================================================
      // APPBAR
      // ==================================================

      appBar: AppBar(
        backgroundColor: AmigoPetStyles.verde,
        foregroundColor: Colors.white,

        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),

        title: const Text(
          'AmigoPet',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [

          // ==============================================
          // POPUP MENU
          // ==============================================

          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (valor) {

              if (valor == 'proximos') {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Ordenado por mais próximos',
                    ),
                  ),
                );
              }

              if (valor == 'avaliados') {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Ordenado por melhor avaliados',
                    ),
                  ),
                );
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: 'proximos',
                child: Text('Mais próximos'),
              ),
              PopupMenuItem(
                value: 'avaliados',
                child: Text('Melhor avaliados'),
              ),
            ],
          ),
        ],
      ),

      // ==================================================
      // DRAWER
      // ==================================================

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [

            DrawerHeader(
              decoration: const BoxDecoration(
                color: AmigoPetStyles.verde,
              ),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  Image.asset(
                    'assets/logo.png',
                    width: 70,
                    height: 70,
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    'AmigoPet',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.pets),
              title: const Text('Cuidadores'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('Meus agendamentos'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      // ==================================================
      // LISTVIEW.BUILDER
      // ==================================================

      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: cuidadores.length,

        itemBuilder: (context, index) {

          final cuidador = cuidadores[index];

          return Card(
            margin: const EdgeInsets.only(
              bottom: 15,
            ),
            elevation: 3,

            child: ListTile(
              contentPadding: const EdgeInsets.all(15),

              // FOTO/ÍCONE
              leading: CircleAvatar(
                radius: 30,
                backgroundColor:
                AmigoPetStyles.verde.withOpacity(0.2),
                child: const Icon(
                  Icons.person,
                  color: AmigoPetStyles.verdeEscuro,
                  size: 35,
                ),
              ),

              // NOME
              title: Text(
                cuidador['nome'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),

              // INFORMAÇÕES
              subtitle: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 5),

                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 18,
                      ),

                      const SizedBox(width: 4),

                      Text(
                        '${cuidador['avaliacao']}',
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  Text(
                    '${cuidador['distancia']} • ${cuidador['servico']}',
                  ),
                ],
              ),

              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),

              // ==========================================
              // NAVEGAÇÃO PARA DETALHES
              // ==========================================

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TelaDetalhesCuidador(
                          cuidador: cuidador,
                        ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}


// ======================================================
// TELA 2 - DETALHES DO CUIDADOR
// ======================================================

class TelaDetalhesCuidador extends StatelessWidget {

  final Map<String, dynamic> cuidador;

  const TelaDetalhesCuidador({
    super.key,
    required this.cuidador,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // ==================================================
      // APPBAR
      // ==================================================

      appBar: AppBar(
        backgroundColor: AmigoPetStyles.verde,
        foregroundColor: Colors.white,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          'Detalhes do cuidador',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              mostrarBottomSheet(context);
            },
          ),
        ],
      ),

      // ==================================================
      // CONTEÚDO
      // ==================================================

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.center,

          children: [

            // FOTO
            const CircleAvatar(
              radius: 65,
              backgroundColor: Color(0xFFE8F5E9),
              child: Icon(
                Icons.person,
                size: 80,
                color: AmigoPetStyles.verdeEscuro,
              ),
            ),

            const SizedBox(height: 20),

            // NOME
            Text(
              cuidador['nome'],
              style: AmigoPetStyles.titulo,
            ),

            const SizedBox(height: 8),

            // AVALIAÇÃO
            Row(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [

                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),

                const SizedBox(width: 5),

                Text(
                  '${cuidador['avaliacao']}',
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // SERVIÇO
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.pets,
                  color: AmigoPetStyles.verde,
                ),
                title: const Text(
                  'Serviços disponíveis',
                ),
                subtitle: Text(
                  cuidador['servico'],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ==================================================
            // BOTÃO TIPO DE SERVIÇO
            // ==================================================

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: AmigoPetStyles.botaoPrincipal,
                icon: const Icon(Icons.pets),
                label: const Text(
                  'Tipo de serviço',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),

                onPressed: () {
                  mostrarTipoServico(context);
                },
              ),
            ),

            const SizedBox(height: 15),

            // ==================================================
            // BOTÃO CANCELAR AGENDAMENTO
            // ==================================================

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                icon: const Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),

                label: const Text(
                  'Cancelar agendamento',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),

                onPressed: () {
                  mostrarCancelarAgendamento(context);
                },
              ),
            ),

            const SizedBox(height: 15),

            // ==================================================
            // BOTÃO MAIS OPÇÕES
            // ==================================================

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                icon: const Icon(
                  Icons.more_horiz,
                ),

                label: const Text(
                  'Mais opções',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),

                onPressed: () {
                  mostrarBottomSheet(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// ======================================================
// ALERTDIALOG - CANCELAR AGENDAMENTO
// ======================================================

void mostrarCancelarAgendamento(
    BuildContext context) {

  showDialog(
    context: context,

    builder: (context) {

      return AlertDialog(
        title: const Text(
          'Cancelar agendamento?',
        ),

        content: const Text(
          'Tem certeza que deseja cancelar este agendamento?',
        ),

        actions: [

          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Não'),
          ),

          ElevatedButton(
            onPressed: () {

              Navigator.pop(context);

              ScaffoldMessenger.of(context)
                  .showSnackBar(
                const SnackBar(
                  content: Text(
                    'Agendamento cancelado.',
                  ),
                ),
              );
            },

            child: const Text('Sim, cancelar'),
          ),
        ],
      );
    },
  );
}


// ======================================================
// SIMPLEDIALOG - TIPO DE SERVIÇO
// ======================================================

void mostrarTipoServico(
    BuildContext context) {

  showDialog(
    context: context,

    builder: (context) {

      return SimpleDialog(
        title: const Text(
          'Tipo de serviço',
        ),

        children: [

          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context);

              ScaffoldMessenger.of(context)
                  .showSnackBar(
                const SnackBar(
                  content: Text(
                    'Passeio selecionado.',
                  ),
                ),
              );
            },

            child: const Text(
              'Passeio',
            ),
          ),

          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context);

              ScaffoldMessenger.of(context)
                  .showSnackBar(
                const SnackBar(
                  content: Text(
                    'Hospedagem selecionada.',
                  ),
                ),
              );
            },

            child: const Text(
              'Hospedagem',
            ),
          ),

          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context);

              ScaffoldMessenger.of(context)
                  .showSnackBar(
                const SnackBar(
                  content: Text(
                    'Banho e tosa selecionado.',
                  ),
                ),
              );
            },

            child: const Text(
              'Banho e tosa',
            ),
          ),
        ],
      );
    },
  );
}


// ======================================================
// BOTTOMSHEET - MAIS OPÇÕES
// ======================================================

void mostrarBottomSheet(
    BuildContext context) {

  showModalBottomSheet(
    context: context,

    builder: (context) {

      return SafeArea(
        child: Wrap(
          children: [

            ListTile(
              leading: const Icon(
                Icons.share,
              ),

              title: const Text(
                'Compartilhar perfil',
              ),

              onTap: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Compartilhar perfil.',
                    ),
                  ),
                );
              },
            ),

            ListTile(
              leading: const Icon(
                Icons.flag,
              ),

              title: const Text(
                'Denunciar',
              ),

              onTap: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Perfil denunciado.',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      );
    },
  );
}