#!/bin/bash

# 현재 Amazon CloudWatch 서비스에서 Metric Data 를 조회합니다.
# 작성일: 2024.11.26
# 필수 구성요소: AWS CLI

# 사용법:
# $0 <MetricQueryFileName>
# 예) bash get_metric_data.sh metric-query.json

if [ -z ${1} ]
then
        echo ""
        echo "Usage:"
        echo "$0 <MetricQueryFileName>"
        echo ""
        exit 0
fi

fromDate=`date -u --date '-60 min' --iso-8601='seconds'`
startTime="${fromDate:0:19}Z"
toDate=`date -u --iso-8601='seconds'`
endTime="${toDate:0:19}Z"

echo "Current UTC TIme: " `date -u --iso-8601='seconds'`
echo "Search Range: $startTime ~ $endTime"

aws cloudwatch get-metric-data \
        --metric-data-queries file://${1} \
        --start-time ${startTime} \
        --end-time ${endTime}