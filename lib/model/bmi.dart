enum BmiCategory{
  severeUnderweight(double.minPositive, 16, 'Severely underweight'),
  moderateUnderweight(16, 17, 'Moderately underweight'),
  underweight(17, 18.5, 'Underweight'),
  normal(18.5, 25, 'Healthy'),
  overweight(25, 30, 'Overweight'),
  obeseClass1(30, 35, 'Obese class 1 (Mild)'),
  obeseClass2(35, 40, 'Obese class 2 (Moderate)'),
  obeseClass3(40, double.infinity, 'Obese class 3 (Severe)');

  final double min;
  final double max;
  final String description;

  const BmiCategory(this.min, this.max, this.description);
}