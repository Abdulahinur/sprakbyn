import 'package:flutter/material.dart';

import '../models/category.dart';
import '../utils/load_categories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _scrollController;
  late final Future<List<Category>> _categoriesFuture;

  final GlobalKey _categoriesKey = GlobalKey();
  final GlobalKey _howItWorksKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _categoriesFuture = loadCategoriesFromJson();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 24,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.language_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: 28,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Språkbyn',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF10375C),
                  ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => _scrollToSection(_categoriesKey),
            child: const Text('Kategorier'),
          ),
          TextButton(
            onPressed: () => _scrollToSection(_howItWorksKey),
            child: const Text('Så funkar det'),
          ),
          TextButton(
            onPressed: () => _scrollToSection(_contactKey),
            child: const Text('Kontakt'),
          ),
          const SizedBox(width: 16),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/categories'),
              child: const Text('Kom igång'),
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 900;

          return SingleChildScrollView(
            controller: _scrollController,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isWide ? 48 : 20,
                    vertical: 32,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeroSection(isWide),
                      const SizedBox(height: 36),
                      _buildStatsSection(isWide),
                      const SizedBox(height: 48),
                      KeyedSubtree(
                        key: _categoriesKey,
                        child: _buildCategoryPreview(isWide),
                      ),
                      const SizedBox(height: 48),
                      KeyedSubtree(
                        key: _howItWorksKey,
                        child: _buildHowItWorksSection(isWide),
                      ),
                      const SizedBox(height: 48),
                      _buildTestimonialsSection(isWide),
                      const SizedBox(height: 48),
                      _buildCallToActionSection(isWide),
                      const SizedBox(height: 64),
                      KeyedSubtree(
                        key: _contactKey,
                        child: _buildFooter(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeroSection(bool isWide) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final heroContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bygg ditt svenska ordförråd för jobbet',
          style: textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ) ??
              const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
        ),
        const SizedBox(height: 16),
        Text(
          'Språkbyn gör det enkelt att lära sig yrkesanpassad svenska med tydliga ordlistor, fraser och tips från arbetslivet.',
          style: textTheme.titleMedium?.copyWith(color: Colors.white70),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            _HighlightChip(label: '👷 Praktiska ordlistor'),
            _HighlightChip(label: '🗣️ Uttal och fraser'),
            _HighlightChip(label: '🤝 Kultur & kundbemötande'),
          ],
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/categories'),
              icon: const Icon(Icons.play_arrow_rounded),
              label: const Text('Starta din resa'),
            ),
            OutlinedButton(
              onPressed: () => _scrollToSection(_howItWorksKey),
              child: const Text('Se hur det funkar'),
            ),
          ],
        ),
      ],
    );

    final heroImage = ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Image.asset(
        'assets/images/sweden_landscape.jpg',
        height: isWide ? 340 : 220,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primary,
            colorScheme.primaryContainer,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withOpacity(0.25),
            blurRadius: 24,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      padding: EdgeInsets.all(isWide ? 48 : 28),
      child: isWide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: heroContent),
                const SizedBox(width: 32),
                Expanded(child: heroImage),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heroContent,
                const SizedBox(height: 24),
                heroImage,
              ],
            ),
    );
  }

  Widget _buildStatsSection(bool isWide) {
    final stats = [
      {'value': '160+', 'label': 'yrkesord med översättningar'},
      {'value': '40', 'label': 'nyttiga fraser'},
      {'value': '8', 'label': 'populära branscher'},
      {'value': '100%', 'label': 'kostnadsfritt att använda'},
    ];

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: stats
          .map(
            (stat) => Container(
              width: isWide ? 220 : double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stat['value']!,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    stat['label']!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black87,
                        ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildCategoryPreview(bool isWide) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(
          title: 'Populära kategorier',
          description:
              'Välj ett område och bygg upp ditt ordförråd med tydliga exempel, fraser och tips från arbetslivet.',
          actionLabel: 'Visa alla',
          onActionTap: () => Navigator.pushNamed(context, '/categories'),
        ),
        const SizedBox(height: 20),
        FutureBuilder<List<Category>>(
          future: _categoriesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: Text(
                  'Vi kunde tyvärr inte ladda kategorierna just nu.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              );
            }

            final categories = snapshot.data ?? [];
            if (categories.isEmpty) {
              return const Text('Kategorier kommer snart.');
            }

            final previewCategories = categories.take(4).toList();

            return LayoutBuilder(
              builder: (context, constraints) {
                final isVeryWide = constraints.maxWidth > 900;
                return Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: previewCategories
                      .map(
                        (category) => SizedBox(
                          width: isVeryWide ? (constraints.maxWidth - 60) / 2 : double.infinity,
                          child: _CategoryPreviewCard(category: category),
                        ),
                      )
                      .toList(),
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildHowItWorksSection(bool isWide) {
    final steps = [
      (
        icon: Icons.explore_rounded,
        title: 'Välj bransch',
        description: 'Utforska de kategorier som matchar ditt arbete eller din drömjobb.',
      ),
      (
        icon: Icons.library_books_rounded,
        title: 'Lär dig viktiga ord',
        description: 'Träna in nyckelord, uttal och fraser som du kan använda direkt.',
      ),
      (
        icon: Icons.star_rounded,
        title: 'Öva i vardagen',
        description: 'Få tips på hur du använder svenskan på arbetsplatsen varje dag.',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionHeader(
          title: 'Så funkar Språkbyn',
          description: 'Vi guidar dig steg för steg – från första ordet till trygg kommunikation på jobbet.',
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: steps
              .map(
                (step) => SizedBox(
                  width: isWide ? 320 : double.infinity,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 16,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          step.icon,
                          size: 36,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          step.title,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          step.description,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget _buildTestimonialsSection(bool isWide) {
    final testimonials = [
      (
        name: 'Amina, undersköterska',
        quote:
            '"Jag hittade snabbt orden jag behövde för att prata med kollegor och patienter. Språkbyn gör skillnad."',
      ),
      (
        name: 'Rami, bygglärling',
        quote: '"De tydliga exemplen hjälpte mig att förstå instruktioner på byggplatsen och våga ställa frågor."',
      ),
      (
        name: 'Lina, butiksmedarbetare',
        quote: '"Fraserna för kundmöten var perfekta när jag började jobba i kassan. Jag känner mig tryggare nu."',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionHeader(
          title: 'Röster från Språkbyn',
          description: 'Tusentals nyanlända har redan stärkt sin svenska genom våra korta och tydliga lektioner.',
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: testimonials
              .map(
                (testimonial) => SizedBox(
                  width: isWide ? 320 : double.infinity,
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.format_quote_rounded,
                            size: 40,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            testimonial.quote,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            testimonial.name,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget _buildCallToActionSection(bool isWide) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 48 : 24,
        vertical: isWide ? 48 : 32,
      ),
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: colorScheme.secondary.withOpacity(0.25),
            blurRadius: 18,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Redo att prata svenska på jobbet?',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Skapa ett konto på några sekunder och spara dina favoritord, fraser och tips direkt i webbläsaren.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/categories'),
                child: const Text('Utforska kategorier'),
              ),
              OutlinedButton(
                onPressed: () => _scrollToSection(_contactKey),
                child: const Text('Kontakta oss'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 16,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kontakta Språkbyn',
                style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                'Har du frågor eller vill tipsa oss om nya ordlistor? Hör av dig så hjälper vi dig vidare.',
                style: textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.email_outlined, color: colorScheme.primary),
                  const SizedBox(width: 12),
                  Text('hej@sprakbyn.se', style: textTheme.bodyLarge),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.chat_bubble_outline_rounded, color: colorScheme.primary),
                  const SizedBox(width: 12),
                  Text('Följ oss på @sprakbyn', style: textTheme.bodyLarge),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        Align(
          alignment: Alignment.center,
          child: Text(
            '© ${DateTime.now().year} Språkbyn. Skapat för att stärka dig på jobbet.',
            style: textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String description;
  final String? actionLabel;
  final VoidCallback? onActionTap;

  const _SectionHeader({
    required this.title,
    required this.description,
    this.actionLabel,
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        if (actionLabel != null && onActionTap != null)
          TextButton(
            onPressed: onActionTap,
            child: Text(actionLabel!),
          ),
      ],
    );
  }
}

class _CategoryPreviewCard extends StatelessWidget {
  final Category category;

  const _CategoryPreviewCard({required this.category});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => Navigator.pushNamed(
        context,
        '/job_detail',
        arguments: category,
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 14,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                category.image,
                width: 96,
                height: 96,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    category.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.auto_stories_rounded, color: colorScheme.primary, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        '4 min lektion',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Icon(
              Icons.arrow_forward_rounded,
              color: colorScheme.primary,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}

class _HighlightChip extends StatelessWidget {
  final String label;

  const _HighlightChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white24),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
