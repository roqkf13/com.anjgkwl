import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scout',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF020617),
      ),
      home: const IntroScreen(),
    );
  }
}

// ──────────────────────────────────────────────
// Data
// ──────────────────────────────────────────────

class _Genre {
  final String label;
  final String description;
  final String gameTitle;
  final String imageUrl;
  final IconData icon;
  final List<Color> overlay;
  final Color buttonColor;

  const _Genre({
    required this.label,
    required this.description,
    required this.gameTitle,
    required this.imageUrl,
    required this.icon,
    required this.overlay,
    required this.buttonColor,
  });
}

const _cdn = 'https://cdn.cloudflare.steamstatic.com/steam/apps';

final _genres = <_Genre>[
  _Genre(
    label: '소울라이크',
    description: '높은 난이도와 보스 전투 중심의 액션 RPG',
    gameTitle: 'ELDEN RING',
    imageUrl: '$_cdn/1245620/header.jpg',
    icon: Icons.shield_outlined,
    overlay: const [Color(0xE6450A0A), Color(0xCC7F1D1D), Color(0xE6450A0A)],
    buttonColor: const Color(0xFFDC2626),
  ),
  _Genre(
    label: '로그라이크',
    description: '매 run이 다른 랜덤 던전과 성장',
    gameTitle: 'Slay the Spire 2',
    imageUrl: '$_cdn/2868840/header.jpg',
    icon: Icons.auto_fix_high_outlined,
    overlay: const [Color(0xE62E1065), Color(0xCC4C1D95), Color(0xE62E1065)],
    buttonColor: const Color(0xFF7C3AED),
  ),
  _Genre(
    label: '오픈월드',
    description: '넓은 맵을 자유롭게 탐험하는 세계',
    gameTitle: 'Red Dead Redemption 2',
    imageUrl: '$_cdn/1174180/header.jpg',
    icon: Icons.map_outlined,
    overlay: const [Color(0xE6022C22), Color(0xCC064E3B), Color(0xE6022C22)],
    buttonColor: const Color(0xFF059669),
  ),
  _Genre(
    label: '메트로배니아',
    description: '능력 해금으로 맵을 확장하는 탐험',
    gameTitle: 'Hollow Knight',
    imageUrl: '$_cdn/367520/header.jpg',
    icon: Icons.explore_outlined,
    overlay: const [Color(0xE6431407), Color(0xCC78350F), Color(0xE6431407)],
    buttonColor: const Color(0xFFD97706),
  ),
];

// ──────────────────────────────────────────────
// Screens
// ──────────────────────────────────────────────

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, 0.8),
            radius: 1.4,
            colors: [Color(0xFF1E293B), Color(0xFF0F172A), Color(0xFF020617)],
            stops: [0.0, 0.55, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _NavBar(),
              const _HeroSection(),
              const Expanded(child: _ZoneList()),
              const _BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────
// NavBar
// ──────────────────────────────────────────────

class _NavBar extends StatelessWidget {
  const _NavBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          const Icon(Icons.gamepad_outlined, color: Color(0xFF94A3B8), size: 22),
          const SizedBox(width: 10),
          const Text(
            'Scout',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.4,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xFF94A3B8)),
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const SizedBox(width: 16),
          IconButton(
            icon: const Icon(Icons.person_outline, color: Color(0xFF94A3B8)),
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────
// Hero
// ──────────────────────────────────────────────

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '장르를 탐험하세요',
            style: TextStyle(
              color: Colors.white.withAlpha(230),
              fontSize: 26,
              fontWeight: FontWeight.w800,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '소울라이크부터 메트로배니아까지, 당신의 다음 게임을 찾아보세요.',
            style: TextStyle(
              color: Colors.white.withAlpha(140),
              fontSize: 13,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────
// Zone list (horizontal scroll)
// ──────────────────────────────────────────────

class _ZoneList extends StatelessWidget {
  const _ZoneList();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: _genres.length,
      itemBuilder: (context, i) => Padding(
        padding: EdgeInsets.only(
          right: i < _genres.length - 1 ? 12 : 0,
        ),
        child: _ZoneCard(genre: _genres[i]),
      ),
    );
  }
}

// ──────────────────────────────────────────────
// Zone card
// ──────────────────────────────────────────────

class _ZoneCard extends StatelessWidget {
  final _Genre genre;

  const _ZoneCard({required this.genre});

  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.of(context).size.width * 0.72;

    return SizedBox(
      width: cardWidth.clamp(200.0, 300.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // background image
            Image.network(
              genre.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  const ColoredBox(color: Color(0xFF1E293B)),
            ),
            // gradient overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: genre.overlay,
                ),
              ),
            ),
            // content
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _CardHeader(genre: genre),
                  const SizedBox(height: 12),
                  Expanded(
                    child: Text(
                      genre.description,
                      style: TextStyle(
                        color: Colors.white.withAlpha(217),
                        fontSize: 14,
                        height: 1.6,
                      ),
                    ),
                  ),
                  _ExploreButton(genre: genre),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardHeader extends StatelessWidget {
  final _Genre genre;

  const _CardHeader({required this.genre});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(77),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(genre.icon, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                genre.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                genre.gameTitle,
                style: TextStyle(
                  color: Colors.white.withAlpha(191),
                  fontSize: 11,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ExploreButton extends StatelessWidget {
  final _Genre genre;

  const _ExploreButton({required this.genre});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: genre.buttonColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
        ),
        child: Text(
          '${genre.label} 탐색',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────
// Bottom bar
// ──────────────────────────────────────────────

class _BottomBar extends StatelessWidget {
  const _BottomBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E293B)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _BottomItem(icon: Icons.home_outlined, label: '홈', selected: true),
          _BottomItem(icon: Icons.explore_outlined, label: '탐색'),
          _BottomItem(icon: Icons.favorite_outline, label: '즐겨찾기'),
          _BottomItem(icon: Icons.person_outline, label: '프로필'),
        ],
      ),
    );
  }
}

class _BottomItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;

  const _BottomItem({
    required this.icon,
    required this.label,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? Colors.white : const Color(0xFF64748B);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(height: 3),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 10,
              fontWeight:
                  selected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
