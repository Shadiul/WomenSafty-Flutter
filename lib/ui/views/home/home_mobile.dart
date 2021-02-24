part of home_view;

class _HomeMobile extends StatelessWidget {
  final HomeViewModel viewModel;
  _HomeMobile(this.viewModel);
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: DrawerView(
        selectedItem: DrawerItems.HOME,
      ),
      body: viewModel.isBusy
          ? Center(child: CircularProgressIndicator())
          : ListView(
              padding: EdgeInsets.all(8),
              children: [
                Chart(
                  viewModel: viewModel,
                  spots: viewModel.spot1,
                ),
                Chart(
                  viewModel: viewModel,
                  spots: viewModel.spot2,
                ),
                Chart(
                  viewModel: viewModel,
                  spots: viewModel.spot3,
                ),
              ],
            ),
    );
  }
}

class Chart extends StatelessWidget {
  const Chart({
    Key key,
    @required this.viewModel,
    @required this.spots,
  }) : super(key: key);

  final HomeViewModel viewModel;
  final List<FlSpot> spots;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
            showTitles: true,
            interval:
                viewModel.resutLength < 20 ? 5 : viewModel.resutLength / 5,
            getTitles: (value) {
              return viewModel.channel.feeds[value.toInt()].created;
            },
            margin: 8,
          ),
          leftTitles: SideTitles(
            showTitles: true,
            getTitles: (value) {
              return value.toInt().toString();
            },
            margin: 8,
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            isStepLineChart: true,
            spots: spots,
            isCurved: false,
            colors: [Colors.red],
            barWidth: 1,
            isStrokeCapRound: true,
            dotData: FlDotData(
              checkToShowDot: (spot, barData) {
                int prevSpot = barData.spots.indexOf(spot) == 0
                    ? 0
                    : barData.spots.indexOf(spot) - 1;
                return prevSpot == 0 || prevSpot == barData.spots.length - 2
                    ? true
                    : barData.spots[prevSpot].y == spot.y
                        ? false
                        : true;
              },
            ),
            belowBarData: BarAreaData(
              show: true,
              colors:
                  [Colors.red].map((color) => color.withOpacity(0.3)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
