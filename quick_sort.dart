void quickSort(List<int> nums) {
  qs(nums, 0, nums.length - 1);
  print(nums);
}

int partition(List<int> nums, int lo, int hi) {
  final pivot = nums[hi];
  int index = lo - 1;

  for (int i = lo; i < hi; ++i) {
    if (nums[i] < pivot) {
      index++;
      final temp = nums[i];
      nums[i] = nums[index];
      nums[index] = temp;
    }
  }

  index++;
  nums[hi] = nums[index];
  nums[index] = pivot;
  return index;
}

void qs(List<int> nums, int lo, int hi) {
  if (lo >= hi) {
    return;
  }

  final pivotIndex = partition(nums, lo, hi);
  qs(nums, lo, pivotIndex - 1);
  qs(nums, pivotIndex + 1, hi);
}

void main() {

  List<int> testArr = [1, 5, 3, 4, 80, 9];
  quickSort(testArr);
}