import 'package:flutter/material.dart';

void main() => runApp(const GharSevaApp());

class GharSevaApp extends StatelessWidget {
  const GharSevaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GharSeva',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7F9FC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF6B00),
          primary: const Color(0xFF102A43),
          secondary: const Color(0xFFFF6B00),
        ),
        fontFamily: 'sans',
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      home: const RoleScreen(),
    );
  }
}

class RoleScreen extends StatelessWidget {
  const RoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Icon(Icons.home_work_rounded, size: 72, color: Color(0xFFFF6B00)),
              const SizedBox(height: 16),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 38, fontWeight: FontWeight.w800, color: Color(0xFF102A43)),
                  children: [
                    TextSpan(text: 'Ghar'),
                    TextSpan(text: 'Seva', style: TextStyle(color: Color(0xFFFF6B00))),
                  ],
                ),
              ),
              const Text('Sahi Sahayak, Khush Ghar', style: TextStyle(color: Colors.grey, fontSize: 16)),
              const SizedBox(height: 40),
              const Text('Aap kya karna chahte hain?', style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700)),
              const SizedBox(height: 18),
              RoleCard(
                icon: Icons.work_outline_rounded,
                title: "I'm Looking for a Job",
                subtitle: 'Cook ya housekeeping ki job dhoondhein',
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const JobSeekerHome())),
              ),
              const SizedBox(height: 14),
              RoleCard(
                icon: Icons.people_alt_outlined,
                title: "I'm Looking for Staff",
                subtitle: 'Apne ghar ke liye trusted staff hire karein',
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const EmployerHome())),
              ),
              const Spacer(),
              const Center(child: Text('✓ Verified profiles  •  ✓ Secure  •  ✓ Easy hiring', style: TextStyle(color: Colors.grey))),
            ],
          ),
        ),
      ),
    );
  }
}

class RoleCard extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  final VoidCallback onTap;
  const RoleCard({super.key, required this.icon, required this.title, required this.subtitle, required this.onTap});

  @override
  Widget build(BuildContext context) => Card(
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(radius: 28, backgroundColor: const Color(0xFFFFF0E5), child: Icon(icon, color: const Color(0xFFFF6B00))),
            const SizedBox(width: 16),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17)),
              const SizedBox(height: 5),
              Text(subtitle, style: const TextStyle(color: Colors.grey)),
            ])),
            const Icon(Icons.arrow_forward_ios_rounded, size: 17),
          ],
        ),
      ),
    ),
  );
}

class JobSeekerHome extends StatefulWidget {
  const JobSeekerHome({super.key});
  @override State<JobSeekerHome> createState() => _JobSeekerHomeState();
}
class _JobSeekerHomeState extends State<JobSeekerHome> {
  int tab = 0;
  final jobs = const [
    ['Cook (Veg)', 'Family in Andheri West', '₹15,000 - ₹18,000', '1.2 km'],
    ['Housekeeping', 'Office in Bandra', '₹12,000 - ₹15,000', '2.3 km'],
    ['Cook (North Indian)', 'Family in Powai', '₹16,000 - ₹20,000', '3.1 km'],
  ];

  @override
  Widget build(BuildContext context) {
    final pages = [
      _seekerHome(),
      const SearchScreen(),
      const SimplePage(title: 'Messages', icon: Icons.chat_bubble_outline),
      const ProfileScreen(),
    ];
    return Scaffold(
      body: SafeArea(child: pages[tab]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (i) => setState(() => tab = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Jobs'),
          NavigationDestination(icon: Icon(Icons.chat_outlined), label: 'Messages'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _seekerHome() => SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        const CircleAvatar(child: Icon(Icons.person)),
        const SizedBox(width: 12),
        const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Good Morning 👋', style: TextStyle(color: Colors.grey)),
          Text('Find the right job for you', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
        ])),
        IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)),
      ]),
      const SizedBox(height: 20),
      TextField(
        decoration: const InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Search job, skills or location'),
      ),
      const SizedBox(height: 20),
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: const Color(0xFF102A43), borderRadius: BorderRadius.circular(22)),
        child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Quick Hire ⚡', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800)),
          SizedBox(height: 6),
          Text('Urgent jobs near you — get faster responses.', style: TextStyle(color: Colors.white70)),
        ]),
      ),
      const SizedBox(height: 24),
      const Text('Popular Categories', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
      const SizedBox(height: 12),
      SizedBox(height: 88, child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          Category(icon: Icons.restaurant, label: 'Cook'),
          Category(icon: Icons.cleaning_services, label: 'Housekeeping'),
          Category(icon: Icons.child_care, label: 'Baby Care'),
          Category(icon: Icons.elderly, label: 'Elder Care'),
        ],
      )),
      const SizedBox(height: 20),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Text('Jobs Near You', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
        TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SearchScreen())), child: const Text('View All')),
      ]),
      ...jobs.map((j) => JobCard(
        title: j[0], company: j[1], salary: j[2], distance: j[3],
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => JobDetails(title: j[0], salary: j[2]))),
      )),
    ]),
  );
}

class Category extends StatelessWidget {
  final IconData icon; final String label;
  const Category({super.key, required this.icon, required this.label});
  @override Widget build(BuildContext context) => Container(
    width: 105, margin: const EdgeInsets.only(right: 10),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(icon, color: const Color(0xFFFF6B00)), const SizedBox(height: 6), Text(label, style: const TextStyle(fontWeight: FontWeight.w600))
    ]),
  );
}

class JobCard extends StatelessWidget {
  final String title, company, salary, distance; final VoidCallback onTap;
  const JobCard({super.key, required this.title, required this.company, required this.salary, required this.distance, required this.onTap});
  @override Widget build(BuildContext context) => Card(
    elevation: 0, margin: const EdgeInsets.only(bottom: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    child: InkWell(
      borderRadius: BorderRadius.circular(18), onTap: onTap,
      child: Padding(padding: const EdgeInsets.all(16), child: Row(children: [
        const CircleAvatar(radius: 27, backgroundColor: Color(0xFFFFF0E5), child: Icon(Icons.work, color: Color(0xFFFF6B00))),
        const SizedBox(width: 14),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
          Text(company, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 6),
          Text(salary, style: const TextStyle(color: Color(0xFFFF6B00), fontWeight: FontWeight.w800)),
        ])),
        Text(distance, style: const TextStyle(color: Colors.grey)),
      ])),
    ),
  );
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Find Jobs', style: TextStyle(fontWeight: FontWeight.w800))),
    body: ListView(padding: const EdgeInsets.all(20), children: [
      const TextField(decoration: InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Job, skill or location')),
      const SizedBox(height: 18),
      Wrap(spacing: 8, runSpacing: 8, children: ['Cook', 'Housekeeping', 'Full-time', 'Part-time', 'Live-in'].map((x) => Chip(label: Text(x))).toList()),
      const SizedBox(height: 20),
      ...['Cook (Veg)', 'Housekeeping', 'Cook (North Indian)', 'All-round House Staff'].map((x) => JobCard(
        title: x, company: 'Verified household • Mumbai', salary: '₹14,000 - ₹20,000', distance: '2 km',
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => JobDetails(title: x, salary: '₹14,000 - ₹20,000'))),
      )),
    ]),
  );
}

class JobDetails extends StatelessWidget {
  final String title, salary;
  const JobDetails({super.key, required this.title, required this.salary});
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(actions: const [Icon(Icons.share), SizedBox(width: 12), Icon(Icons.bookmark_border), SizedBox(width: 12)]),
    body: Padding(padding: const EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const CircleAvatar(radius: 34, backgroundColor: Color(0xFFFFF0E5), child: Icon(Icons.restaurant, color: Color(0xFFFF6B00), size: 30)),
      const SizedBox(height: 16),
      Text(title, style: const TextStyle(fontSize: 27, fontWeight: FontWeight.w900)),
      const Text('Verified family • Andheri West, Mumbai', style: TextStyle(color: Colors.grey)),
      const SizedBox(height: 10),
      Text(salary + ' / month', style: const TextStyle(fontSize: 19, color: Color(0xFFFF6B00), fontWeight: FontWeight.w800)),
      const SizedBox(height: 22),
      const Text('Job Details', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
      const SizedBox(height: 12),
      const Text('Experienced professional required. Clean, reliable and respectful person preferred. Work includes daily household support and cooking as discussed with the employer.'),
      const SizedBox(height: 20),
      const Wrap(spacing: 10, runSpacing: 10, children: [Chip(label: Text('Full-time')), Chip(label: Text('Live-out')), Chip(label: Text('2+ Years')), Chip(label: Text('6 Days/Week'))]),
      const Spacer(),
      Row(children: [
        Expanded(child: OutlinedButton(onPressed: () {}, child: const Text('Chat'))),
        const SizedBox(width: 12),
        Expanded(child: FilledButton(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Application sent!'))), child: const Text('Apply Now'))),
      ])
    ])),
  );
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('My Profile', style: TextStyle(fontWeight: FontWeight.w800))),
    body: ListView(padding: const EdgeInsets.all(20), children: [
      const Center(child: CircleAvatar(radius: 46, child: Icon(Icons.person, size: 48))),
      const SizedBox(height: 12),
      const Center(child: Text('Savitri Devi ✓', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800))),
      const Center(child: Text('Cook • 4 Years Experience • ⭐ 4.6', style: TextStyle(color: Colors.grey))),
      const SizedBox(height: 25),
      ...['Personal Details', 'Experience & Skills', 'Preferred Location', 'Availability', 'Documents & Verification', 'Settings'].map((x) => Card(
        elevation: 0, child: ListTile(title: Text(x), trailing: const Icon(Icons.chevron_right)),
      )),
    ]),
  );
}

class EmployerHome extends StatelessWidget {
  const EmployerHome({super.key});
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Employer Dashboard', style: TextStyle(fontWeight: FontWeight.w800)), actions: const [Icon(Icons.notifications_none), SizedBox(width: 12)]),
    body: ListView(padding: const EdgeInsets.all(20), children: [
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: const Color(0xFF102A43), borderRadius: BorderRadius.circular(22)),
        child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Need help urgently?', style: TextStyle(color: Colors.white70)),
          SizedBox(height: 4),
          Text('Post a job & find trusted staff.', style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w800)),
        ]),
      ),
      const SizedBox(height: 18),
      Row(children: const [
        Expanded(child: StatCard(value: '12', label: 'Jobs Posted')),
        SizedBox(width: 10), Expanded(child: StatCard(value: '45', label: 'Applicants')),
        SizedBox(width: 10), Expanded(child: StatCard(value: '05', label: 'Hired')),
      ]),
      const SizedBox(height: 22),
      FilledButton.icon(
        icon: const Icon(Icons.add), label: const Text('Post a New Job'),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PostJobScreen())),
      ),
      const SizedBox(height: 20),
      const Text('Recent Jobs', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
      const SizedBox(height: 10),
      ...['Cook (Veg)', 'Housekeeping'].map((x) => Card(
        elevation: 0, child: ListTile(
          leading: const CircleAvatar(child: Icon(Icons.work)),
          title: Text(x, style: const TextStyle(fontWeight: FontWeight.w700)),
          subtitle: const Text('8 applicants • Active'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ApplicantsScreen())),
        ),
      )),
    ]),
  );
}

class StatCard extends StatelessWidget {
  final String value, label;
  const StatCard({super.key, required this.value, required this.label});
  @override Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
    child: Column(children: [Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900)), Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, color: Colors.grey))]),
  );
}

class PostJobScreen extends StatefulWidget {
  const PostJobScreen({super.key});
  @override State<PostJobScreen> createState() => _PostJobScreenState();
}
class _PostJobScreenState extends State<PostJobScreen> {
  final form = GlobalKey<FormState>();
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Post a Job', style: TextStyle(fontWeight: FontWeight.w800))),
    body: Form(key: form, child: ListView(padding: const EdgeInsets.all(20), children: [
      const Text('What do you need?', style: TextStyle(fontWeight: FontWeight.w800)),
      const SizedBox(height: 8),
      DropdownButtonFormField<String>(value: 'Cook', items: ['Cook', 'Housekeeping', 'Both'].map((x) => DropdownMenuItem(value: x, child: Text(x))).toList(), onChanged: (_) {}),
      const SizedBox(height: 14),
      const TextField(decoration: InputDecoration(labelText: 'Monthly salary', prefixText: '₹ ')),
      const SizedBox(height: 14),
      const TextField(decoration: InputDecoration(labelText: 'Location')),
      const SizedBox(height: 14),
      const TextField(maxLines: 4, decoration: InputDecoration(labelText: 'Job description')),
      const SizedBox(height: 22),
      FilledButton(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Job posted successfully!'))), child: const Text('Post Job')),
    ])),
  );
}

class ApplicantsScreen extends StatelessWidget {
  const ApplicantsScreen({super.key});
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Applicants', style: TextStyle(fontWeight: FontWeight.w800))),
    body: ListView(padding: const EdgeInsets.all(20), children: [
      const Text('8 applicants • 3 shortlisted', style: TextStyle(color: Colors.grey)),
      const SizedBox(height: 12),
      ...['Savitri Devi', 'Pooja Kumari', 'Rekha Sharma', 'Sunita Mondal'].map((name) => Card(
        elevation: 0, child: ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text(name, style: const TextStyle(fontWeight: FontWeight.w700)),
          subtitle: const Text('Cook • 2–5 Years • ⭐ 4.6'),
          trailing: OutlinedButton(onPressed: () {}, child: const Text('Chat')),
        ),
      )),
    ]),
  );
}

class SimplePage extends StatelessWidget {
  final String title; final IconData icon;
  const SimplePage({super.key, required this.title, required this.icon});
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title, style: const TextStyle(fontWeight: FontWeight.w800))),
    body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(icon, size: 70, color: const Color(0xFFFF6B00)), const SizedBox(height: 12),
      Text('$title coming next', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
    ])),
  );
}
