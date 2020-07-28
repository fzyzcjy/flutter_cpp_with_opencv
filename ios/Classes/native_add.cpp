#include <stdint.h>
#include <opencv2/core.hpp>

extern "C" __attribute__((visibility("default"))) __attribute__((used))
int32_t native_add(int32_t x, int32_t y) {
    cv::Mat m = cv::Mat::zeros(x, y, CV_8UC3);
    return m.rows + m.cols;
}
