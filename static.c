#include <stdio.h>
#include <stdlib.h>

int compare(const void *a, const void *b) {
    return (*(int *)a - *(int *)b);
}

double calculate_mean(int arr[], int size) {
    int sum = 0;
    for (int i = 0; i < size; i++) sum += arr[i];
    return (double)sum / size;
}

double calculate_median(int arr[], int size) {
    qsort(arr, size, sizeof(int), compare);
    if (size % 2 == 0)
        return (arr[size / 2 - 1] + arr[size / 2]) / 2.0;
    else
        return arr[size / 2];
}

void calculate_mode(int arr[], int size) {
    int modeValue[100] = {0};
    int maxCount = 0;
    int modeCount = 0;
    for (int i = 0; i < size; i++) {
        int count = 1;
        for (int j = i + 1; j < size; j++) {
            if (arr[i] == arr[j]) count++;
        }
        if (count > maxCount) {
            maxCount = count;
            modeCount = 0;
            modeValue[modeCount++] = arr[i];
        } else if (count == maxCount) {
            int alreadyAdded = 0;
            for (int k = 0; k < modeCount; k++)
                if (modeValue[k] == arr[i])
                    alreadyAdded = 1;
            if (!alreadyAdded)
                modeValue[modeCount++] = arr[i];
        }
    }

    printf("Mode: ");
    for (int i = 0; i < modeCount; i++) printf("%d ", modeValue[i]);
    printf("\n");
}

int main() {
    int data[] = {10, 20, 20, 30, 40, 40, 40, 50};
    int size = sizeof(data) / sizeof(data[0]);

    printf("Mean: %.2f\n", calculate_mean(data, size));
    printf("Median: %.2f\n", calculate_median(data, size));
    calculate_mode(data, size);

    return 0;
}
