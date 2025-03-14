#include <array>
#include <cstdio>
#include <cstdlib>
#include <ctime>
#include <memory>
#include <sstream>
#include <stdexcept>
#include <string>
#include <vector>

#define BUF_SIZE 128

std::string exec(const char *cmd) {
  std::array<char, BUF_SIZE> buffer{};
  std::string result;
  std::shared_ptr<FILE> pipe(popen(cmd, "r"), pclose);
  if (!pipe) {
    throw std::runtime_error("popen() failed!");
  }
  while (!feof(pipe.get())) {
    if (fgets(buffer.data(), BUF_SIZE, pipe.get()) != nullptr) {
      result += buffer.data();
    }
  }
  return result;
}

int main() {
    std::string res = exec("xrandr | grep ' connected' | awk '{print $1}'");
    std::stringstream ss(res);
    std::string to;
    std::vector<std::string> disps {};

    if (!res.empty()) {
        while(std::getline(ss,to,'\n')){
            disps.push_back(to);
        }
    }

    std::string f = "xrandr --output " + disps[0] + " --mode 1920x1080 --pos 0x180 --rotate normal --output " + disps[1] + " --mode 1920x1080 --pos 4480x180 --rotate normal --output " + disps[2] + " -r 165 --primary --mode 2560x1440 --pos 1920x0 --rotate normal";
    exec(f.c_str());
}
