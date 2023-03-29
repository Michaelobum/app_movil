class Rice {
  final String label;
  final double confidence;
  const Rice(this.label, this.confidence);

  get confidencePercent => (confidence * 100).toStringAsFixed(2);
}
