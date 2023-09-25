import Chart from 'chart.js/auto';

$(document).on('turbolinks:load', function(){
    const books_chart = $("#booksChart");
    // 下はグラフ反映しない
    //document.getElementById("#booksChart")
    const myLineChart = new Chart(books_chart, {
      type: 'line',
      data: {
        labels: ['6日前', '5日前', '4日前', '3日前', '2日前', '1日前', '今日'],
        datasets: [
        {
          label: '投稿した本の数',
          data: [
            books_chart.data('created-6day-ago-books-count'),
            books_chart.data('created-5day-ago-books-count'),
            books_chart.data('created-4day-ago-books-count'),
            books_chart.data('created-3day-ago-books-count'),
            books_chart.data('created-2day-ago-books-count'),
            books_chart.data('created-1day-ago-books-count'),
            books_chart.data('created-0day-ago-books-count'),
          ],
          borderColor: "rgba(0,0,255,1)",
          backgroungColor: "rgba(0,0,0,0)",
        }
        ],
      },
      options: {
        title: {
          display: true,
          text: '7日間の投稿の比較'
        },
        responsive: true,
        scales: {
          y:{
            suggestedMin: 0,
            suggestedMax: 20,
          },
          x:{
            stacked: true
          },
        },
      }
    });
  });
