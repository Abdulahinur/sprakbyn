import 'package:flutter/material.dart';

import '../data/category_content.dart';
import '../models/category.dart';

class JobDetailScreen extends StatelessWidget {
  final Category category;

  const JobDetailScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = getCategoryContent(category.id);
    final isWide = MediaQuery.of(context).size.width > 900;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isWide ? 48 : 16,
          vertical: 24,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    category.image,
                    width: double.infinity,
                    height: isWide ? 320 : 220,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  category.description,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: content.focusAreas
                      .map(
                        (focus) => Chip(
                          label: Text(focus),
                          backgroundColor: colorScheme.primary.withOpacity(0.12),
                          labelStyle: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.w600),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 32),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final twoColumns = constraints.maxWidth > 720;
                    final cards = [
                      _ContentCard(
                        icon: Icons.chat_bubble_outline,
                        title: 'Fraser att öva',
                        items: content.phrases,
                        color: colorScheme.primary,
                      ),
                      _ContentCard(
                        icon: Icons.lightbulb_outline,
                        title: 'Tips från jobbet',
                        items: content.tips,
                        color: colorScheme.secondary,
                      ),
                    ];

                    if (twoColumns) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: cards
                            .map(
                              (card) => Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 16, bottom: 16),
                                  child: card,
                                ),
                              ),
                            )
                            .toList(),
                      );
                    }

                    return Column(
                      children: cards
                          .map(
                            (card) => Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: card,
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
                const SizedBox(height: 32),
                Text(
                  'Ordlista – svenska med översättningar',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                _VocabularyTable(entries: content.vocabulary),
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [colorScheme.primary.withOpacity(0.85), colorScheme.primary],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.primary.withOpacity(0.25),
                        blurRadius: 18,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tips: så här pluggar du effektivt',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Lyssna på orden, upprepa högt och använd dem i korta meningar. Ta fem minuter efter varje pass för att skriva ner vad du lärt dig.',
                        style: TextStyle(color: Colors.white, fontSize: 16, height: 1.5),
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: const BorderSide(color: Colors.white70),
                            ),
                            onPressed: () => Navigator.pushNamed(context, '/categories'),
                            child: const Text('Utforska fler kategorier'),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: colorScheme.primary,
                            ),
                            onPressed: () => Navigator.pushNamed(context, '/saved'),
                            child: const Text('Spara ordlistan'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ContentCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<String> items;
  final Color color;

  const _ContentCard({
    required this.icon,
    required this.title,
    required this.items,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(icon, color: color),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ...items.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.check_rounded, color: color, size: 20),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        item,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VocabularyTable extends StatelessWidget {
  final List<VocabularyEntry> entries;

  const _VocabularyTable({required this.entries});

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) {
      return const Text('Ordlistan fylls på inom kort.');
    }

    final headerStyle = Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700);

    return Card(
      elevation: 4,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('Svenska', style: headerStyle)),
            ...translationLanguages.map(
              (language) => DataColumn(
                label: Text(language[0].toUpperCase() + language.substring(1), style: headerStyle),
              ),
            ),
          ],
          rows: entries
              .map(
                (entry) => DataRow(
                  cells: [
                    DataCell(Text(entry.swedish)),
                    ...translationLanguages.map(
                      (language) => DataCell(Text(entry.translations[language] ?? '–')),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
