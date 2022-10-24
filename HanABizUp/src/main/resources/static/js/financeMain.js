/**
 * 
 */
 
 // Download Button
const download_btn = document.querySelector(".download_btn");
const download_menu = document.querySelector(".download_menu");

download_btn.addEventListener("click", function () {
  download_menu.classList.toggle("d-none");
});

// Ratio
const circumference = 2 * Math.PI * 36

const current_ratio = document.querySelector('#current_ratio');
//const current_ratio_number = document.querySelector('#current_ratio_number').innerText;

current_ratio.style.strokeDasharray = circumference;
current_ratio.style.strokeDashoffset = (circumference * (1-(current_ratio_number*0.01)));
current_ratio.style.stroke = 'var(--color-tri-green)';

const debt_ratio = document.querySelector('#debt_ratio');

debt_ratio.style.strokeDasharray = circumference;
debt_ratio.style.strokeDashoffset = (circumference * (1-(debt_ratio_number*0.01)));
debt_ratio.style.stroke = 'var(--color-tri-red)';

const total_asset_return = document.querySelector('#total_asset_return');

total_asset_return.style.strokeDasharray = circumference;
total_asset_return.style.strokeDashoffset = (circumference * (1-(total_asset_return_number*0.01)));
total_asset_return.style.stroke = 'var(--color-tri-blue)';



// Highchart
Highcharts.chart("myChart", {
  chart: {
    plotBackgroundColor: null,
    plotBorderWidth: null,
    plotShadow: false,
    type: "pie",
    width: 500,
    height: 320,
  },
  title: {
    text: "부채와 자산비율",
  },
  tooltip: {
    pointFormat: "{series.name}: <b>{point.percentage:.1f}%</b>",
  },
  accessibility: {
    point: {
      valueSuffix: "%",
    },
  },
  plotOptions: {
    pie: {
      allowPointSelect: true,
      cursor: "pointer",
      dataLabels: {
        enabled: true,
        format: "<b>{point.name}</b>: {point.percentage:.1f} %",
      },
    },
  },
  colors: ['#F8AFA6','#FF8D80', '#F9C8B0', '#9CA89E'],
  series: [
    {
      name: "Brands",
      colorByPoint: true,
      data: [
        {
          name: "유동부채",
          y: 50,
          sliced: true,
          selected: true,
        },
        {
          name: "비유동부채",
          y: 10,
        },
        {
          name: "자본",
          y: 40,
        },
      ],
    },
  ],
});
