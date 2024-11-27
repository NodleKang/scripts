#!/bin/bash

# 현재 Amazon CloudWatch 서비스에서 조회할 수 있는 단일 Metric 의 모든 Dimension 을 출력합니다.
# 작성일: 2024.11.26
# 필수 구성요소: AWS CLI

if [ -z ${2} ]
then
        echo ""
        echo "Usage:"
        echo "$0 <Namespace> <MetricName>"
        echo ""
        exit 0
fi

aws cloudwatch list-metrics --namespace ${1} --metric-name ${2}
