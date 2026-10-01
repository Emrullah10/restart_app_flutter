/// Level thresholds are a product decision (plan §3.7); keep identical to the web `shared/level.js`.
class LevelInfo {
  final int level;
  final String key; // new|curious|aware|conscious|pioneer|champion
  final String tier; // bronze|silver|gold
  final double progress;
  const LevelInfo(this.level, this.key, this.tier, this.progress);
}

const _levels = [
  (1, 'new', 0), (2, 'curious', 100), (3, 'aware', 500), (4, 'conscious', 1000), (5, 'pioneer', 2500), (6, 'champion', 5000),
];

LevelInfo computeLevel(num points) {
  var i = 0;
  for (var k = 0; k < _levels.length; k++) {
    if (points >= _levels[k].$3) i = k;
  }
  final cur = _levels[i];
  final hasNext = i + 1 < _levels.length;
  final progress = hasNext ? (points - cur.$3) / (_levels[i + 1].$3 - cur.$3) : 1.0;
  final tier = cur.$1 <= 2 ? 'bronze' : (cur.$1 <= 4 ? 'silver' : 'gold');
  return LevelInfo(cur.$1, cur.$2, tier, progress.clamp(0.0, 1.0));
}
