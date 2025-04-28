#include <string>
#include <vector>
#include <sstream>
struct MarketData {
    std::string date;
    std::string ticker;
    long long shares_outstanding;
    double nav;
    long long flow_daily;
};
std::vector<MarketData> parseCSV(const std::string& line) {
    std::vector<MarketData> result;
    std::stringstream ss(line);
    std::string token;
    MarketData data;
    int field = 0;
    while (std::getline(ss, token, ',')) {
        switch (field) {
            case 0: data.date = token; break;
            case 1: data.ticker = token; break;
            case 2: data.shares_outstanding = std::stoll(token); break;
            case 3: data.nav = std::stod(token); break;
            case 4: data.flow_daily = std::stoll(token); break;
        }
        field++;
    }
    if (field == 5) result.push_back(data);
    return result;
}