import 'package:flutter/material.dart';

class WorkerSuggestionsScreen extends StatefulWidget {
  const WorkerSuggestionsScreen({super.key});

  @override
  State<WorkerSuggestionsScreen> createState() =>
      _WorkerSuggestionsScreenState();
}

class _WorkerSuggestionsScreenState extends State<WorkerSuggestionsScreen> {
  String _selectedCategory = 'All';
  String _selectedSortBy = 'Rating';

  final List<String> _categories = [
    'All',
    'Plumbing',
    'Electrical',
    'Cleaning',
    'Moving',
    'Painting',
    'Gardening',
    'Carpentry',
  ];

  final List<String> _sortOptions = [
    'Rating',
    'Price',
    'Experience',
    'Distance',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Worker Suggestions')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedCategory,
                    decoration: const InputDecoration(
                      labelText: 'Category',
                      border: OutlineInputBorder(),
                    ),
                    items:
                        _categories.map((String category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _selectedCategory = newValue;
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedSortBy,
                    decoration: const InputDecoration(
                      labelText: 'Sort By',
                      border: OutlineInputBorder(),
                    ),
                    items:
                        _sortOptions.map((String option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: Text(option),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _selectedSortBy = newValue;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            'https://via.placeholder.com/150',
                          ),
                        ),
                        title: Text('Worker ${index + 1}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Plumbing Specialist'),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 16,
                                ),
                                const Text('4.5'),
                                const SizedBox(width: 16),
                                const Icon(Icons.location_on, size: 16),
                                Text('${(index + 1) * 0.5} km'),
                              ],
                            ),
                          ],
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {
                            // Handle worker selection
                          },
                          child: const Text('View Profile'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'About',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Experienced plumber with 5 years of experience in residential and commercial plumbing services.',
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Services Offered',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                _buildServiceChip('Pipe Repair'),
                                _buildServiceChip('Leak Detection'),
                                _buildServiceChip('Faucet Installation'),
                                _buildServiceChip('Drain Cleaning'),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Starting from',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '\$${(index + 1) * 20}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    // Handle message
                                  },
                                  icon: const Icon(Icons.message),
                                  label: const Text('Message'),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    // Handle request service
                                  },
                                  icon: const Icon(Icons.add),
                                  label: const Text('Request Service'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: const Color(0xFFE8F5E9),
      labelStyle: const TextStyle(color: Color(0xFF4CAF50)),
    );
  }
}
