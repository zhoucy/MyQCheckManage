/**
 * A small plugin for getting the CSV of a categorized chart
 */
(function (Highcharts) {
    
    
    var each = Highcharts.each;
    Highcharts.Chart.prototype.getCSV = function () {
    	var i=0;
    	var title="";
    	var labels="";
        var columns = [],
            line,
            tempLine,
            csv = "", 
            row,
            col,
            options = (this.options.exporting || {}).csv || {},

            // Options
            dateFormat = options.dateFormat || '%Y-%m-%d %H:%M:%S',
            itemDelimiter = options.itemDelimiter || ',', // use ';' for direct import to Excel
            lineDelimiter = options.lineDelimeter || '\n';
        each (this.series, function (series) {       	
        	i++;
            if (series.options.includeInCSVExport !== false) {
                if (series.xAxis) {
                    var xData = series.xData.slice(),
                        xTitle = 'X values';
                    if (series.xAxis.isDatetimeAxis) {
                        xData = Highcharts.map(xData, function (x) {
                            return Highcharts.dateFormat(dateFormat, x)
                        });
                        xTitle = 'DateTime';
                    } else if (series.xAxis.categories) {
                        xData = Highcharts.map(xData, function (x) {
                            return Highcharts.pick(series.xAxis.categories[x], x);
                        });
                        //xTitle = 'Category';
                        xTitle = '日期';
                    }
                    if(i==1){
                    	title=series.chart.options.title.text;
                    	labels=series.chart.options.labels.items[0].html;
                    	columns.push(xData);
                        columns[columns.length - 1].unshift(xTitle);
                    }                  
                }
                columns.push(series.yData.slice());
                columns[columns.length - 1].unshift(series.name);
            }
        });

        // Transform the columns to CSV 行列转换(原方法)
        console.log(columns);
        for (row = 0; row < columns[0].length; row++) {
            line = [];
            for (col = 0; col < columns.length; col++) {
                line.push(columns[col][row]);
            }
            csv += line.join(itemDelimiter) + lineDelimiter;
        }
        //不行列转换
        /*for (col = 0; col < columns.length; col++) {
            line = [];
            line.push(columns[col]);
            csv += line.join(itemDelimiter) + lineDelimiter;
        }*/
        labels=labels.replace(/<br>/gm,',');
        csv = [title].join(itemDelimiter) + lineDelimiter+
              [labels].join(itemDelimiter) + lineDelimiter+
              lineDelimiter+csv;
        return csv;
    };

    // Now we want to add "Download CSV" to the exporting menu. We post the CSV
    // to a simple PHP script that returns it with a content-type header as a 
    // downloadable file.
    // The source code for the PHP script can be viewed at 
    // https://raw.github.com/highslide-software/highcharts.com/master/studies/csv-export/csv.php
    /*if (Highcharts.getOptions().exporting) {
        Highcharts.getOptions().exporting.buttons.contextButton.menuItems.push({
            text: '导出数据到excel',
            onclick: function () {
                Highcharts.post('//export.hcharts.cn/cvs.php', {
                    csv: this.getCSV()
                });
            }
        });
    }*/
}(Highcharts));
