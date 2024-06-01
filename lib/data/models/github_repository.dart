class GitHubRepository {
  final num id;
  final String name;
  final String url;

  GitHubRepository({required this.id, required this.name, required this.url});

  factory GitHubRepository.fromJson(Map<String, dynamic> json) {
    return GitHubRepository(
        id: json['id'], name: json['name'], url: json['html_url']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'html_url': url,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GitHubRepository && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
