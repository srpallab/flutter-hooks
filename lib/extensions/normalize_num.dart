extension NormalizeNun on num {
  num normalize(
    num selfRangeMin,
    num selfRangeMax, [
    nomalizeRangeMin = 0.0,
    normalizeRangeMax = 1.0,
  ]) {
    return (normalizeRangeMax - nomalizeRangeMin) *
            ((this - selfRangeMin) / (selfRangeMax - selfRangeMin)) +
        nomalizeRangeMin;
  }
}
