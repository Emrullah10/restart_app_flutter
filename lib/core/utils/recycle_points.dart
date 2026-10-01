/// Mirror of core/service-operation `logRecycle`: base = round(kg*10); electric => total = round(base*1.5).
const co2PerKg = 2.5;

class PointsEstimate {
  final int base, bonus, total;
  const PointsEstimate(this.base, this.bonus, this.total);
}

PointsEstimate estimateRecyclePoints({required double weightKg, required bool isElectric}) {
  final base = (weightKg * 10).round();
  final total = isElectric ? (base * 1.5).round() : base;
  return PointsEstimate(base, isElectric ? (base * 0.5).round() : 0, total);
}

double co2ForWeight(double weightKg) => weightKg * co2PerKg;
