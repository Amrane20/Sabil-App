class Score {
  final double mathScore;
  final double historyScore;
  final double physicsScore;
  final double chemistryScore;
  final double biologyScore;
  final double englishScore;
  final double geographyScore;
  final double totalScore;
  final double averageScore;
  final int absenceDays;

  Score({
    required this.mathScore,
    required this.historyScore,
    required this.physicsScore,
    required this.chemistryScore,
    required this.biologyScore,
    required this.englishScore,
    required this.geographyScore,
    required this.totalScore,
    required this.averageScore,
    required this.absenceDays,
  });

  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(
      mathScore: json['math_score'] ?? 0.0,
      historyScore: json['history_score'] ?? 0.0,
      physicsScore: json['physics_score'] ?? 0.0,
      chemistryScore: json['chemistry_score'] ?? 0.0,
      biologyScore: json['biology_score'] ?? 0.0,
      englishScore: json['english_score'] ?? 0.0,
      geographyScore: json['geography_score'] ?? 0.0,
      totalScore: json['total_score'] ?? 0.0,
      averageScore: json['average_score'] ?? 0.0,
      absenceDays: json['absence_days'] ?? 0,
    );
  }
}