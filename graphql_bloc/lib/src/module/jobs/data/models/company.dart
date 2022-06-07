class Company {
  Company({
    required this.name,
    this.logoUrl,
    required this.slug,
    this.websiteUrl,
  });

  final String name;
  final String? logoUrl;
  final String slug;
  final String? websiteUrl;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"],
        slug: json["slug"],
        websiteUrl: json["websiteUrl"],
        logoUrl: json["logoUrl"] != null && json["logoUrl"] != ""
            ? json["logoUrl"]
            : 'https://picsum.photos/200/300',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "logoUrl": logoUrl,
        "slug": slug,
        "websiteUrl": websiteUrl,
      };
}
