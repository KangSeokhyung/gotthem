<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.stock-table {
    font-size: 12px;
    width: 100%;
    border-collapse: collapse;
    border: 1px solid #CCC;
}
    th,
    td {
        padding: 6px 10px;
        border-top: 1px solid #CCC;
        border-left: 1px solid #CCC;
        &:first-child {
          border-left: 0 none;
        }
    }
    th {
        text-align: center;
        font-weight: normal;
        background: #eee;
    }
    td {
        text-align: right;
    }
    .label {
      display: none;
    }
    .lower {
        color: #0464b3;
    }
    .upper {
        color: #d92c12;
    }

    @media (max-width: 768px) {
        colgroup {
            display: none;
        }
        thead,
        thead th{
            display: none;
        }
        tr {
            display: block;
            box-sizing: border-box;
            width: 100%;
            padding: 10px 10px 0;
            border-top: 1px solid #ccc;
            clear: both;
        }
        th,
        td {
            display: block;
            float: left;
            box-sizing: border-box;
            border: 0;
        }
        th {
            width: 100%;
            background: none;
        }
        td {
            margin-bottom: 10px;
            padding: 0 1px;
            width: 25%;
            text-align: center;
        }
        td:nth-child(2),
        td:nth-child(3),
        td:nth-child(4) {
            width: 33.33333%;
        }
        .label {
            display: block;
            padding: 5px 8px;
            font-weight: normal;
            color: #fff;
            background: #666;
        }
        .data {
            display: block;
            padding: 5px 8px;
            background: #f8f8f8;
        }
    }
}

.table-cell {
    @for $i from 1 through 10 { &-1of#{$i} {width: percentage(1/$i);} }
	&-1of1 { width: 55%; }
    &-3of5 { width: 60%; }
    &-2of3 { width: 66.66%; }
    &-3of4 { width: 75%; }
    &-4of5 { width: 80%; }
    &-5of6 { width: 83.33%; }
}

.readable-hidden {  
    position: absolute !important;
    height: 1px;
    width: 1px;
    overflow: hidden;
    clip: rect(1px 1px 1px 1px);
    clip: rect(1px, 1px, 1px, 1px);
}
</style>
</head>
<body>
<table class="stock-table">
    <caption class="readable-hidden">Stock Information</caption>
    <colgroup>
        <col>
        <col class="table-cell-1of8" span="7">
    </colgroup>
    <thead>
        <tr>
            <th scope="col">DATE</th><th scope="col">CLOSE(￦)</th><th scope="col">CHANGE</th><th scope="col">CHG(%)</th><th scope="col">OPEN(￦)</th><th scope="col">HIGH(￦)</th><th scope="col">LOW(￦)</th><th scope="col">VOLUME</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th scope="row">2017-03-16</th>
            <td><b class="label">CLOSE(￦)</b><span class="data">413,000</span></td><td class="upper"><b class="label">CHANGE</b><span class="data"><span>4,000</span></span></td><td class="upper"><b class="label">CHG(%)</b><span class="data">+0.98%</span></td><td><b class="label">OPEN(￦)</b><span class="data">412,500</span></td><td><b class="label">HIGH(￦)</b><span class="data">415,000</span></td><td><b class="label">LOW(￦)</b><span class="data">410,500</span></td><td><b class="label">VOLUME</b><span class="data">26,441</span></td>
        </tr>
        <tr>
            <th scope="row">2017-03-15</th>
            <td><b class="label">CLOSE(￦)</b><span class="data">409,000</span></td><td class="lower"><b class="label">CHANGE</b><span class="data"><span>1,500</span></span></td><td class="lower"><b class="label">CHG(%)</b><span class="data">-0.37%</span></td><td><b class="label">OPEN(￦)</b><span class="data">408,500</span></td><td><b class="label">HIGH(￦)</b><span class="data">413,500</span></td><td><b class="label">LOW(￦)</b><span class="data">406,000</span></td><td><b class="label">VOLUME</b><span class="data">59,450</span></td>
        </tr>
        <tr>
            <th scope="row">2017-03-14</th>
            <td><b class="label">CLOSE(￦)</b><span class="data">410,500</span></td><td class="upper"><b class="label">CHANGE</b><span class="data"><span>500</span></span></td><td class="upper"><b class="label">CHG(%)</b><span class="data">+0.12%</span></td><td><b class="label">OPEN(￦)</b><span class="data">410,000</span></td><td><b class="label">HIGH(￦)</b><span class="data">416,000</span></td><td><b class="label">LOW(￦)</b><span class="data">402,000</span></td><td><b class="label">VOLUME</b><span class="data">89,897</span></td>
        </tr>
        <tr>
            <th scope="row">2017-03-13</th>
            <td><b class="label">CLOSE(￦)</b><span class="data">410,000</span></td><td class="lower"><b class="label">CHANGE</b><span class="data"><span>11,500</span></span></td><td class="lower"><b class="label">CHG(%)</b><span class="data">-2.73%</span></td><td><b class="label">OPEN(￦)</b><span class="data">419,500</span></td><td><b class="label">HIGH(￦)</b><span class="data">420,000</span></td><td><b class="label">LOW(￦)</b><span class="data">407,500</span></td><td><b class="label">VOLUME</b><span class="data">130,247</span></td>
        </tr>
        <tr>
            <th scope="row">2017-03-12</th>
            <td><b class="label">CLOSE(￦)</b><span class="data">421,500</span></td><td class="lower"><b class="label">CHANGE</b><span class="data"><span>14,500</span></span></td><td class="lower"><b class="label">CHG(%)</b><span class="data">-3.33%</span></td><td><b class="label">OPEN(￦)</b><span class="data">434,500</span></td><td><b class="label">HIGH(￦)</b><span class="data">434,500</span></td><td><b class="label">LOW(￦)</b><span class="data">417,500</span></td><td><b class="label">VOLUME</b><span class="data">121,331</span></td>
        </tr>
    </tbody>
</table>
</body>
</html>