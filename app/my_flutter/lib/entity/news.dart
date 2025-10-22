class News {
	int? newsId;
	String title;
	String? content;
	String? author;
	String? category;
	DateTime? publishDate;
	DateTime? lastUpdate;
	String? status;
	int? views;
	String? imageUrl;

	News({
		this.newsId, 
		required this.title, 
		this.content, 
		this.author, 
		this.category, 
		this.publishDate, 
		this.lastUpdate, 
		this.status, 
		this.views, 
		this.imageUrl, 
	});

	factory News.fromJson(Map<String, dynamic> json) => News(
				newsId: json['newsId'] as int?,
				title: json['title'] as String,
				content: json['content'] as String?,
				author: json['author'] as String?,
				category: json['category'] as String?,
				publishDate: json['publishDate'] == null
						? null
						: DateTime.parse(json['publishDate'] as String),
				lastUpdate: json['lastUpdate'] == null
						? null
						: DateTime.parse(json['lastUpdate'] as String),
				status: json['status'] as String?,
				views: json['views'] as int?,
				imageUrl: json['imageUrl'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'newsId': newsId,
				'title': title,
				'content': content,
				'author': author,
				'category': category,
				'publishDate': publishDate?.toIso8601String(),
				'lastUpdate': lastUpdate?.toIso8601String(),
				'status': status,
				'views': views,
				'imageUrl': imageUrl,
			};
}
