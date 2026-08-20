import 'package:flutter/material.dart';

void main() => runApp(const RpgToolApp());

class RpgToolApp extends StatelessWidget {
  const RpgToolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RPG Tool Lite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4),
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  void show(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      GamesPage(show: show),
      CheatsPage(show: show),
      const AboutPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('RPG Tool Lite'),
        centerTitle: false,
      ),
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value) {
          setState(() {
            index = value;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.games_outlined),
            selectedIcon: Icon(Icons.games),
            label: 'Игры',
          ),
          NavigationDestination(
            icon: Icon(Icons.memory_outlined),
            selectedIcon: Icon(Icons.memory),
            label: 'Читы',
          ),
          NavigationDestination(
            icon: Icon(Icons.info_outline),
            selectedIcon: Icon(Icons.info),
            label: 'О приложении',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          show('Добавление игры будет в следующей версии');
        },
        icon: const Icon(Icons.add),
        label: const Text('Добавить игру'),
      ),
    );
  }
}

class GamesPage extends StatelessWidget {
  final void Function(String text) show;

  const GamesPage({
    super.key,
    required this.show,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: ListTile(
            leading: const Icon(Icons.games),
            title: const Text('Demo Game MV'),
            subtitle: const Text('RPG Maker MV'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              show('Открыть игру: Demo Game MV');
            },
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: ListTile(
            leading: const Icon(Icons.games),
            title: const Text('Demo Game VX Ace'),
            subtitle: const Text('RPG Maker VX Ace'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              show('Открыть игру: Demo Game VX Ace');
            },
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Это демо-список игр.',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Дальше сюда можно подключить выбор папки с игрой, парсинг файлов, перевод и редактор сохранений.',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CheatsPage extends StatelessWidget {
  final void Function(String text) show;

  const CheatsPage({
    super.key,
    required this.show,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          'Быстрые читы',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ActionChip(
              avatar: const Icon(Icons.bolt, size: 18),
              label: const Text('999999 золота'),
              onPressed: () {
                show('Чит: 999999 золота');
              },
            ),
            ActionChip(
              avatar: const Icon(Icons.bolt, size: 18),
              label: const Text('Макс. уровень'),
              onPressed: () {
                show('Чит: максимальный уровень');
              },
            ),
            ActionChip(
              avatar: const Icon(Icons.bolt, size: 18),
              label: const Text('Макс. предметы'),
              onPressed: () {
                show('Чит: максимальные предметы');
              },
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'Свитчи',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        Card(
          child: SwitchListTile(
            title: const Text('Switch 1'),
            subtitle: const Text('Демо-переключатель'),
            value: false,
            onChanged: (value) {
              show('Switch 1: $value');
            },
          ),
        ),
        Card(
          child: SwitchListTile(
            title: const Text('Switch 2'),
            subtitle: const Text('Демо-переключатель'),
            value: true,
            onChanged: (value) {
              show('Switch 2: $value');
            },
          ),
        ),
        const SizedBox(height: 24),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Важно',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Этот APK — безопасная оболочка. Он не делает runtime-инъекции в память и не обходит защиту системы.',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.auto_awesome,
              size: 64,
            ),
            SizedBox(height: 16),
            Text(
              'RPG Tool Lite',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'Это демо-сборка community-приложения для RPG Maker игр.\n\nДальше можно добавить:\n• перевод словарей;\n• экспорт/импорт словарей;\n• редактор сохранений;\n• backup;\n• overlay-перевод.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
