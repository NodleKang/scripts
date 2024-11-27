#!/bin/bash

# 현재 Amazon CloudWatch 서비스에서 조회할 수 있는 모든 Metric 의 모든 Dimension 을 출력합니다.
# 작성일: 2024.11.26
# 필수 구성요소: AWS CLI, jq

aws cloudwatch list-metrics | \
jq -rc '.Metrics | .[] | .Namespace + " - " + .MetricName + " - "
+ (.Dimensions | sort_by(.Name) | map(.Name) | "(" + (length|tostring) + ")" + join(",") )' \
| sort | uniq
