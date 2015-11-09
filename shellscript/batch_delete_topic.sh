#!/bin/sh
# 功能：在kafka的安装目录下，批量删除topic
# 作者：wangmeng
# 版本：1.0
# 创建时间：2015/10/17
# 最后更新：2015/10/17

if [ $# -ne 2 ]; then
        echo "Usage:batch-delete-topic.sh ZK1:port,ZK2:port kafka_home"
        echo -e "For example, the following command will delete all of topic: \nbatch-delete-table.sh datanode50:2181 /opt/kafka_2.10-0.8.1.1"
        exit 1
fi

cd $2

#tmpFile=/tmp/wm_batch_delete_topic
OLD_IFS="$IFS"
topics=$(bin/kafka-topics.sh --list --zookeeper $1)
IFS=" "
IFS="$OLD_IFS"
topicList=($topics)

#执行命令
for topic in ${topicList[@]}
do
        echo "The topic of $topic will be deleted. Continue?(y/n)"
        read -n1 toContinue
        if [ "$toContinue" == "y" ]; then
                $(bin/kafka-run-class.sh kafka.admin.DeleteTopicCommand -zookeeper $1 -topic $topic)
        fi

done

