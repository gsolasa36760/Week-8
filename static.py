from collections import Counter

class StatisticsCalculator:
    def __init__(self, data):
        self.data = sorted(data)

    def mean(self):
        return sum(self.data) / len(self.data)

    def median(self):
        n = len(self.data)
        mid = n // 2
        if n % 2 == 0:
            return (self.data[mid - 1] + self.data[mid]) / 2
        else:
            return self.data[mid]

    def mode(self):
        freq = Counter(self.data)
        max_freq = max(freq.values())
        return [val for val, count in freq.items() if count == max_freq]

if __name__ == "__main__":
    values = [10, 20, 20, 30, 40, 40, 40, 50]
    stats = StatisticsCalculator(values)

    print("Mean:", round(stats.mean(), 2))
    print("Median:", round(stats.median(), 2))
    print("Mode:", stats.mode())